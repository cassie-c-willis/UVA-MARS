package mars;

import java.awt.Color;
import java.io.IOException;
import java.io.InputStream;
import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.net.URLConnection;
import java.util.concurrent.LinkedBlockingQueue;

public class Launcher {
	// default configuration for connection to robot mode
	public static final String ROBOT_DEFAULT_ADDRESS = "192.168.1.102";
	public static final String GIMBLE_CAMERA_IP = "192.168.1.103";
	public static final String EXC_CAMERA_IP = "192.168.1.104";
	private static final int PORT = 5565;

	// settings for configuring the time between packets
	private static final long TIME_BETWEEN_JS_PACKETS_WHEN_CHANGING_IN_MS = 50;
	private static final long TIME_BETWEEN_JS_PACKETS_WHEN_STATIONARY_IN_MS = 1000;
	private static final long TIME_BETWEEN_KB_PACKETS_WHEN_CHANGING_IN_MS = 100;
	private static final long TIME_BETWEEN_KB_PACKETS_WHEN_STATIONARY_IN_MS = 500;

	private volatile boolean connectionLive;
	private volatile boolean isDebugMode;
	private volatile long timeLastSent;
	private volatile boolean keyboardCommandsBeingSent;
	private NetworkDaemon networkDaemon;
	private UserInterface userInterface;
	private JoystickHandler joystickHandler;
	private KeyboardPacketHandler commandPacketHandler;
	private PollDataConverter dataConverter;
	private PacketSender packetSender;
	private LinkedBlockingQueue<Packet> packetsToBeSent;
	private CameraHandler gimbleCameraHandler, excCameraHandler;
	private TestServer testServer;

	public static void main(String[] args) {
		Launcher launcher = new Launcher();
		launcher.initiate();
	}

	public Launcher() {
		connectionLive = false;
		isDebugMode = false;
		keyboardCommandsBeingSent = false;
		timeLastSent = System.currentTimeMillis();
		networkDaemon = new NetworkDaemon(ROBOT_DEFAULT_ADDRESS, PORT);
		userInterface = new UserInterface(new UIListenersHandler(this));
		dataConverter = new PollDataConverter();
		packetsToBeSent = new LinkedBlockingQueue<Packet>();
		joystickHandler = new JoystickHandler();
		commandPacketHandler = new KeyboardPacketHandler();
		packetSender = new PacketSender();
		gimbleCameraHandler = new CameraHandler(1, GIMBLE_CAMERA_IP);
		excCameraHandler = new CameraHandler(2, EXC_CAMERA_IP);
	}

	// initializes all threads
	public void initiate() {
		userInterface.initiate();
		Thread joystickThread = new Thread(joystickHandler);
		joystickThread.setName("Joystick Thread");
		joystickThread.start();
		//new Thread(commandPacketHandler).start();
		//new Thread(packetSender).start();
		//new Thread(gimbleCameraHandler).start();
		//new Thread(excCameraHandler).start();
	}

	public void userConnect() {
		if (isDebugMode) {
			testServer = new TestServer(PORT);
			new Thread(testServer).start();
		}
		boolean successfulConnect = attemptToConnect();
		if (successfulConnect) {
			String connectedServer = isDebugMode ? "Test Server" : "Robot";
			addMessageToUserInterface("Successfully connected to " + connectedServer);
		}
	}

	// should not be used directly; use userConnect()
	private boolean attemptToConnect() {
		try {
			networkDaemon.connect(isDebugMode);
			connectionLive = true;
			userInterface.updateConnectionStatus(true);
			//new Thread(new PacketReceiver()).start();
			//new Thread(new ConnectionStatusChecker()).start();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			addErrorToUserInterface("Robot Connection Failure");
			return false;
		}
	}

	// disconnect using the disconnect button
	public void userDisconnect() {
		disconnect();
		String connectedServer = isDebugMode ? "Test Server" : "Robot";
		addMessageToUserInterface("Successfully disconnected from " + connectedServer);
	}

	// disconnect due to some connection error
	public void errorDisconnect() {
		disconnect();
		String connectedServer = isDebugMode ? "Test Server" : "Robot";
		addErrorToUserInterface("Forced to disconnect from " + connectedServer + " due to a connection error");
	}

	// should not be used directly
	private void disconnect() {
		if (isDebugMode) {
			testServer.stop();
		}
		networkDaemon.disconnect();
		connectionLive = false;
		userInterface.updateConnectionStatus(false);
		userInterface.clearAllPotentiometerLights();
		pauseJoystickStream();
	}

	private void addMessageToUserInterface(String message) {
		addMessageToUserInterface(message, Color.GREEN);
	}

	private void addErrorToUserInterface(String error) {
		addMessageToUserInterface(error, Color.RED);
	}

	private void addMessageToUserInterface(String message, Color c) {
		{
				userInterface.addMessage(message, c);
		}
	}

	private void clearByteOutputColor() {
		userInterface.setByteOutputColor(Color.BLACK);
	}

	public void setDebugMode(boolean newDebug) {
		isDebugMode = newDebug;
	}

	public void switchJoysticks() {
		joystickHandler.switchJoysticks();
	}

	public void playJoystickStream() {
		joystickHandler.joystickStreamPlaying = true;
		userInterface.toggleJoystickStreamControlButton(true);
	}

	public void pauseJoystickStream() {
		joystickHandler.joystickStreamPlaying = false;
		userInterface.toggleJoystickStreamControlButton(false);
	}

	public void sendPacket(byte[] packetData) {
		packetsToBeSent.add(new Packet(packetData, Color.GREEN));
	}

	public void startSendingKeyboardCommandPackets() {
		keyboardCommandsBeingSent = true;
	}

	public void stopSendingKeyboardCommandPackets() {
		keyboardCommandsBeingSent = false;
	}

	public void cameraConnect(int cameraIndex) {
		if (cameraIndex == 1) {
			gimbleCameraHandler = new CameraHandler(1, GIMBLE_CAMERA_IP);
			new Thread(gimbleCameraHandler).start();
		} else {
			excCameraHandler = new CameraHandler(2, EXC_CAMERA_IP);
			new Thread(excCameraHandler).start();
		}

		userInterface.setCamButtonToDisconnect(cameraIndex);
	}

	// for when a disconnect from camera is forced due to a connection error
	public void cameraErrorDisconnect(int cameraIndex) {
		cameraDisconnect(cameraIndex);
		String cameraName = cameraIndex == 1 ? "Gimble Camera" : "Excavator Camera";
		userInterface.addError(cameraName + " Connection Failure");
	}

	// for when user disconnects from camera through the disconnect button
	public void cameraUserDisconnect(int cameraIndex) {
		cameraDisconnect(cameraIndex);
	}

	private void cameraDisconnect(int cameraIndex) {
		if (cameraIndex == 1) {
			gimbleCameraHandler.stop();
		} else {
			excCameraHandler.stop();
		}
		userInterface.setCamButtonToConnect(cameraIndex);
	}

	// Thread that handles polling the joystick and creating joystick packets
	private class JoystickHandler implements Runnable {
		private Joystick rightJoy, leftJoy;
		private volatile boolean joystickStreamPlaying = false;
		private byte[] previousJoystickPacket = new byte[17];
		private byte[] joystickPacket = new byte[17];

		@Override
		public void run() {
			int rightJoyIndex = 1;
			int leftJoyIndex = 2;
			connectToJoysticks(rightJoyIndex, leftJoyIndex);

			float[] rightRawPollData, leftRawPollData;

			while (true) {
				attemptToUpdateRightJoystick();
				rightRawPollData = rightJoy.getRawPollData();

				attemptToUpdateLeftJoystick();
				leftRawPollData = leftJoy.getRawPollData();

				updateUIWithNewJoystickData(rightRawPollData, leftRawPollData);
				joystickPacket = dataConverter.createJoystickPacket(rightRawPollData, leftRawPollData);

				if (connectionLive) {
					attemptToSendJoystickPacket();
					if (System.currentTimeMillis() - timeLastSent > 100) {
						clearByteOutputColor();
					}
				}

				storePreviousPacket();

				try {
					Thread.sleep(TIME_BETWEEN_JS_PACKETS_WHEN_CHANGING_IN_MS);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

			}

		}

		private void connectToJoysticks(int rightJoyIndex, int leftJoyIndex) {
			rightJoy = new Joystick(rightJoyIndex);
			try {
				rightJoy.connectToStick();
				userInterface.addMessage("Successfully Connected to Right Joystick");
			} catch (IOException e) {
				addErrorToUserInterface("Right Joystick: " + e.toString());
			}

			leftJoy = new Joystick(leftJoyIndex);
			try {
				leftJoy.connectToStick();
				userInterface.addMessage("Successfully Connected to Left Joystick");
			} catch (IOException e) {
				addErrorToUserInterface("Left Joystick: " + e.toString());
				e.printStackTrace();
			}
		}

		private void attemptToUpdateRightJoystick() {
			try {
				rightJoy.update();
			} catch (IOException e) {
				addErrorToUserInterface(e.toString());
				e.printStackTrace();
			}
		}

		private void attemptToUpdateLeftJoystick() {
			try {
				leftJoy.update();
			} catch (IOException e) {
				addErrorToUserInterface(e.toString());
			}
		}

		private void updateUIWithNewJoystickData(float[] rightRawPollData, float[] leftRawPollData) {
					userInterface.updateJoystickPanel(rightRawPollData, leftRawPollData);


		}

		private void attemptToSendJoystickPacket() {
			if (joystickStreamPlaying) {
				boolean packetChanged = packetIsChanged();
				if (packetChanged || (System.currentTimeMillis() > timeLastSent
						+ TIME_BETWEEN_JS_PACKETS_WHEN_STATIONARY_IN_MS)) {
					try {
						userInterface.setByteOutputColor(Color.RED);
						networkDaemon.send(joystickPacket);
						timeLastSent = System.currentTimeMillis();
						Color byteColor = packetChanged ? Color.GREEN : Color.BLUE;
						userInterface.setByteOutputColor(byteColor);
						userInterface.setByteOutput(byteArrToStr(joystickPacket));
					} catch (IOException e) {
						e.printStackTrace();
						errorDisconnect();
						
					}
					
				}
			}
		}

		private boolean packetIsChanged() {
			for (int i = 0; i < joystickPacket.length; i++) {

				if (previousJoystickPacket[i] != joystickPacket[i]) {
					return true;
				}
			}

			return false;

		}

		private void storePreviousPacket() {
			for (int i = 0; i < joystickPacket.length; i++) {
				previousJoystickPacket[i] = joystickPacket[i];
			}
		}

		private void switchJoysticks() {
			userInterface.addMessage("Attempting to Switch Joysticks...");
			int temp = rightJoy.getIndex();
			int newRightJoyIndex = leftJoy.getIndex();
			int newLeftJoyIndex = temp;
			connectToJoysticks(newRightJoyIndex, newLeftJoyIndex);

		}

	}

	// Thread for reading keyboard input and creating keyboard packets
	public class KeyboardPacketHandler implements Runnable {
		KeyboardHandler kbHandler;
		private static final int KB_PACKET_LENGTH = 4;
		byte[] keyboardPacket;
		byte[] previousKeyboardPacket;

		public KeyboardPacketHandler() {
			kbHandler = userInterface.getKBHandler();
			keyboardPacket = new byte[KB_PACKET_LENGTH];
			previousKeyboardPacket = new byte[KB_PACKET_LENGTH];
		}

		@Override
		public void run() {
			while (true) {
				boolean[] keyStates = kbHandler.getKeyStates();
				updateUIWithNewKeyboardData(keyStates);
				keyboardPacket = dataConverter.createCommandPacket(keyStates);

				if (connectionLive) {
					determineToSendKeyboardPackets(keyStates);
					attemptToSendKeyboardPackets();
					if (System.currentTimeMillis() - timeLastSent > 100) {
						clearByteOutputColor();
					}

				}

				storePreviousPacket();

				try {
					Thread.sleep(TIME_BETWEEN_KB_PACKETS_WHEN_CHANGING_IN_MS);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}

			}

		}

		private void updateUIWithNewKeyboardData(boolean[] keyStates) {
					userInterface.updateKeyboardPanel(keyStates);
				

		}

		public void determineToSendKeyboardPackets(boolean[] keyStates) {
			if (getAnyKeyPushed(keyStates)) {
				startSendingKeyboardCommandPackets();
			} else {
				// the first time it registers no key is pushed, send a key
				// released packet
				if (packetIsChanged()) {
					sendKeyReleasedPacket();
				}
				stopSendingKeyboardCommandPackets();
			}
		}

		public boolean getAnyKeyPushed(boolean[] keyStates) {
			for (int i = 0; i < keyStates.length; i++) {
				if (keyStates[i]) {
					return true;
				}
			}
			return false;
		}

		// sends a keyboard packet indicating that no keys are pushed
		private void sendKeyReleasedPacket() {
			packetsToBeSent.add(new Packet(dataConverter.createCommandPacket(new boolean[16]), Color.MAGENTA));
		}

		private void attemptToSendKeyboardPackets() {
			if (keyboardCommandsBeingSent) {
				if (packetIsChanged() || (System.currentTimeMillis() > timeLastSent
						+ TIME_BETWEEN_KB_PACKETS_WHEN_STATIONARY_IN_MS)) {
					packetsToBeSent.add(new Packet(keyboardPacket, Color.MAGENTA));
					timeLastSent = System.currentTimeMillis();
				}
			}
		}

		private boolean packetIsChanged() {
			for (int i = 0; i < keyboardPacket.length; i++) {
				if (previousKeyboardPacket[i] != keyboardPacket[i]) {
					return true;
				}
			}

			return false;

		}

		private void storePreviousPacket() {
			for (int i = 0; i < keyboardPacket.length; i++) {
				previousKeyboardPacket[i] = keyboardPacket[i];
			}
		}

	}

	// Thread for sending packets to Robot. It waits for packets to be adding to
	// its queue
	// and then sends them as soon as it can
	public class PacketSender implements Runnable {

		@Override
		public void run() {
			try {
				while (true) {
					Packet packet = packetsToBeSent.take();
					if (connectionLive) {
						attemptSend(packet);
					}

				}
			} catch (InterruptedException e) {
				e.printStackTrace();
			}

		}

		private void attemptSend(Packet packet) {
			try {
				boolean sent = networkDaemon.send(packet.getPacketData());
				if(packet.getPacketData()[1] < (byte)128) {
					System.out.println(byteToStr(packet.getPacketData()[1]));
				}
				if(packet.getPacketData()[2] != 0) {
					System.out.println(byteToStr(packet.getPacketData()[2]));
				}
				if (sent) {
					userInterface.setByteOutputColor(packet.getPacketColor());
					updateByteOutputOnUserInterface(packet.getPacketData());
				}

			} catch (Exception e) {
				addErrorToUserInterface("Connection was interrupted");
				errorDisconnect();
				e.printStackTrace();
			}
		}

		private void updateByteOutputOnUserInterface(byte[] packet) {
			userInterface.setByteOutput(byteArrToStr(packet));

		}

	}

	// Thread for receiving signals from the socket, constantly running
	// independent of the sending threads
	public class PacketReceiver implements Runnable {
		// expected length of packet
		public static final int PACKET_LENGTH = 3;

		// indexes for status lights
		public static final int EX_LIGHT = 0, FL_LIGHT = 1, RL_LIGHT = 2, RR_LIGHT = 3, FR_LIGHT = 4;
		// Protocol for receiving bytes from XBEE
		public static final int START_BYTE = 255, END_BYTE = 254, EX_LIGHT_ON = 1, FL_LIGHT_ON = 2, RL_LIGHT_ON = 3,
				RR_LIGHT_ON = 4, FR_LIGHT_ON = 5, EX_LIGHT_OFF = 253, FL_LIGHT_OFF = 252, RL_LIGHT_OFF = 251,
				RR_LIGHT_OFF = 250, FR_LIGHT_OFF = 249;

		@Override
		public void run() {

			try {
				while (connectionLive) {
					byte[] input = new byte[0];
					input = networkDaemon.receive();
					if (input.length == PACKET_LENGTH && input[0] == (byte) START_BYTE && input[2] == (byte) END_BYTE) {
						int byteReceived = getUnsignedEquivalent(input[1]);
						userInterface.addMessage("Received byte " + byteReceived + ": ", Color.BLUE);
						processReceivedByte(byteReceived);
					}
				}

			} catch (IOException e) {
				// caught by packetSender
				// System.out.println(e.toString());
				e.printStackTrace();
			}
		}

		// necessary because java assumes bytes are signed
		private int getUnsignedEquivalent(byte signedByte) {
			int unsigned;
			if (signedByte < 0) {
				unsigned = signedByte + 256;
			} else {
				unsigned = signedByte;
			}

			return unsigned;
		}

		// determines what to do based on the value of the received byte
		private void processReceivedByte(int byteReceived) {
			switch (byteReceived) {
			case EX_LIGHT_ON:
				userInterface.addError("Excavator Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOn(EX_LIGHT);
				break;
			case FL_LIGHT_ON:
				userInterface.addError("Front Left Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOn(FL_LIGHT);
				break;
			case RL_LIGHT_ON:
				userInterface.addError("Rear Left Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOn(RL_LIGHT);
				break;
			case RR_LIGHT_ON:
				userInterface.addError("Rear Right Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOn(RR_LIGHT);
				break;
			case FR_LIGHT_ON:
				userInterface.addError("Front Right Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOn(FR_LIGHT);
				break;
			case EX_LIGHT_OFF:
				userInterface.addMessage("Cleared Excavator Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOff(EX_LIGHT);
				break;
			case FL_LIGHT_OFF:
				userInterface.addMessage("Cleared Front Left Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOff(FL_LIGHT);
				break;
			case RL_LIGHT_OFF:
				userInterface.addMessage("Cleared Rear Left Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOff(RL_LIGHT);
				break;
			case RR_LIGHT_OFF:
				userInterface.addMessage("Cleared Rear Right Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOff(RR_LIGHT);
				break;
			case FR_LIGHT_OFF:
				userInterface.addMessage("Cleared Front Right Potentiometer Error");
				userInterface.turnPotentiometerErrorLightOff(FR_LIGHT);
				break;

			}
		}
	}

	// checks every half a second if the connection is still active
	public class ConnectionStatusChecker implements Runnable {

		@Override
		public void run() {
			while (connectionLive) {
				boolean connected = networkDaemon.isConnected();
				if (!connected) {
					errorDisconnect();
				} else {
					try {
						Thread.sleep(450);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				}
			}

		}

	}

	public class Packet {
		private byte[] packetData;
		private Color packetColor;

		public Packet(byte[] packetData, Color packetColor) {
			this.packetData = packetData;
			this.packetColor = packetColor;
		}

		public byte[] getPacketData() {
			return packetData;
		}

		public Color getPacketColor() {
			return packetColor;
		}
	}

	// Thread for handling interactions with Camera. An instance is created for
	// each camera
	public class CameraHandler implements Runnable {
		private int cameraIndex;
		private String cameraIP;
		private URLConnection uc;
		private volatile boolean running;

		public CameraHandler(int cameraIndex, String cameraIP) {
			this.cameraIndex = cameraIndex;
			this.cameraIP = cameraIP;
			running = true;
		}

		@Override
		public void run() {
			try {

				while (running) {
					retrieveImage(cameraIP);
					userInterface.updateCameraImage(cameraIndex);

				}
			} catch (Exception e) {
				cameraErrorDisconnect(cameraIndex);
				e.printStackTrace();
			}

			userInterface.clearCameraImage(cameraIndex);

		}

		public void retrieveImage(String ip) throws Exception {

			Authenticator.setDefault(new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("admin", "".toCharArray());
				}

			});
			URL a = new URL("http://" + ip + "/image.jpg");
			URLConnection uc = a.openConnection();
			uc.setConnectTimeout(1000);
			uc.setReadTimeout(1000);

			uc.connect();
			InputStream is = uc.getInputStream();

			int len = uc.getContentLength();
			userInterface.setCameraBuffer(cameraIndex, new byte[len]);
			int n = is.read(userInterface.getCameraBuffer(cameraIndex));
			while (n < userInterface.getCameraBuffer(cameraIndex).length) {
				n += is.read(userInterface.getCameraBuffer(cameraIndex), n,
						userInterface.getCameraBuffer(cameraIndex).length - n);
			}

		}

		public void stop() {
			running = false;
		}
	}

	// method to convert byte array to easily readable string
	public String byteArrToStr(byte[] byteOutput) {
		String formattedByteArr = "";
		for (int i = 0; i < byteOutput.length; i++) {
			formattedByteArr += String.format("%8s", Integer.toBinaryString((byteOutput[i] + 256) % 256)).replace(' ',
					'0');
			formattedByteArr += " ";
		}
		return formattedByteArr;
	}

	public String byteToStr(byte byteOutput) {
		String formattedByteArr = "";
		formattedByteArr += String.format("%8s", Integer.toBinaryString((byteOutput + 256) % 256)).replace(' ', '0');
		return formattedByteArr;
	}

}
