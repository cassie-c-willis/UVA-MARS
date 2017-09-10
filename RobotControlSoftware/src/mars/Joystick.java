package mars;

import java.io.IOException;

import net.java.games.input.*;

public class Joystick {
	private float[] rawPollData;
	private Controller connectedDevice;
	private boolean connected = false;
	private Component[] components;
	// the poll data as received from the joystick controller
	// used to tell what number joystick in the components array; used for
	// switching
	private int index;

	// indices for all of the buttons in the Component array + description of
	// output

	// main stick y-axis; returns float between -1 and 1;
	// -1 is all the way forward, 1 is all the way back
	private int y = 0;
	// main stick x-axis; returns float between -1 and 1;
	// 1 is all the way forward, -1 is all the way back
	private int x = 1;
	// small stick on main stick; returns float between 0 and 1;
	// 0 is inactive, 0.25 is forward, 0.5 is right, 0.75 is down, 1.0 is left
	private int pov = 2;
	// main stick rotational z-axis; returns float between -1 and 1;
	// 1 is rotated all the way to the right, -1 is rotated all the way to the
	// left
	private int rz = 3;
	// all 12 buttons; returns a float 1.0 (pushed) or 0.0 (not pushed)
	private int b1 = 4;
	private int b2 = 5;
	private int b3 = 6;
	private int b4 = 7;
	private int b5 = 8;
	private int b6 = 9;
	private int b7 = 10;
	private int b8 = 11;
	// slider; returns float between 1 and -1;
	// -1 is pushed all the way to the top, 1 is pushed all the way to the
	// bottom
	private int slider = 12;
	private int b9 = 13;
	private int b10 = 14;
	private int b11 = 15;
	private int b12 = 16;

	public Joystick(int index) {
		this.index = index;
		rawPollData = new float[17];

	}

	/*
	 * Loops through all connected devices and finds the joystick
	 */
	public void connectToStick() throws IOException {
		long start = System.currentTimeMillis();
		while (System.currentTimeMillis() < start + 500) {
			Controller[] ca = ControllerEnvironment.getDefaultEnvironment().getControllers();
			int devicesFound = 0;
			for (int i = 0; i < ca.length; i++) {
				if (ca[i].getType().equals(Controller.Type.STICK)) {
					devicesFound++;
					if (devicesFound == index) {
						connected = true;
						connectedDevice = ca[i];
						components = connectedDevice.getComponents();
						return;
					}
				}
			}
		}
		throw new IOException("Joystick not found. Reconnect and restart.");
	}

	public void switchIndex(int i) throws IOException {
		this.index = i;
		connectToStick();
	}

	public void update() throws IOException {
		if (connected) {
			rawPollData = new float[17];
			if (connectedDevice.poll()) {
				for (int i = 0; i < components.length; i++) {
					rawPollData[i] = components[i].getPollData();
				}
				
			} else {
				connected = false;
				throw new IOException("Joystick has been disconnected. Restart.");
			}
		}

	}

	public int getIndex() {
		return index;
	}

	public float[] getRawPollData() {
		return rawPollData;
	}

	/*
	 * Polls joystick, then loops through each component, printing the
	 * components name and poll data to the console
	 */
	public void updateToConsole() {
		connectedDevice.poll();
		System.out.println("OUTPUT");
		for (int i = 0; i < components.length; i++) {
			System.out.println(components[i].getIdentifier() + ": " + components[i].getPollData());
		}

	}

}
