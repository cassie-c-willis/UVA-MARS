package mars;

import java.awt.*;
import java.awt.event.*;
import java.awt.geom.Line2D;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.LineBorder;

//Code that runs the user interface it consists of a JFrame, and JPanel MainPanel/
//Main panel is further divided up into 4 separate panels: ConnnectionPanel,k
//JoystickPanel, ErrorPanel, and CameraPanel.
public class UserInterface {
	// default dimensions of the window
	private static final int XWIDTH = 1366;
	private static final int YHEIGHT = 725;
	// main content panel
	private MainPanel mainPanel;

	// default font size for all titles
	private static final float TITLEFONTSIZE = 20.0f;
	// default font size for all other text
	private static final float FONTSIZE = 17.0f;
	// Class that is used to send signals to robot/test server
	private KeyboardHandler kbHandler;
	private UIListenersHandler listeners;

	// loads up the frame on to screen and sets the panel as MainPanel
	public UserInterface(UIListenersHandler listeners) {
		this.listeners = listeners;
		// main content panel

		mainPanel = new MainPanel();
		kbHandler = new KeyboardHandler(mainPanel.connectionPanel);

	}

	public void initiate() {
		// setting up jframe state and variables
		JFrame frame = new JFrame("Robot Control Software");
		frame.setSize(XWIDTH, YHEIGHT);
		frame.setLocationRelativeTo(null);
		frame.setResizable(false);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setContentPane(mainPanel);
		frame.setVisible(true);
	}

	// updates section of panel relating to joystick panel
	public void updateJoystickPanel(float[] rightPollData, float[] leftPollData) {

		mainPanel.inputPanel.jsPanel.rightPollData = rightPollData;
		mainPanel.inputPanel.jsPanel.leftPollData = leftPollData;

		mainPanel.inputPanel.jsPanel.repaint();
	}

	public void updateKeyboardPanel(boolean[] keyStates) {
		mainPanel.inputPanel.keyboardPanel.keyStates = keyStates;

		mainPanel.inputPanel.keyboardPanel.repaint();
	}

	// updates the camera panel

	public void updateCameraImage(int cameraIndex) {
		if (cameraIndex == 1) {
			mainPanel.cameraPanel.gimbleCameraPanel.repaint();
		} else {
			mainPanel.cameraPanel.excCameraPanel.repaint();
		}
	}

	public byte[] getCameraBuffer(int cameraIndex) {
		if (cameraIndex == 1) {
			return mainPanel.cameraPanel.gimbleCameraBuffer;
		} else {
			return mainPanel.cameraPanel.excCameraBuffer;
		}

	}

	public void setCameraBuffer(int cameraIndex, byte[] newBuffer) {
		if (cameraIndex == 1) {
			mainPanel.cameraPanel.gimbleCameraBuffer = newBuffer;
		} else {
			mainPanel.cameraPanel.excCameraBuffer = newBuffer;
		}
	}

	// removes image from panel
	public void clearCameraImage(int cameraIndex) {
		setCameraBuffer(cameraIndex, new byte[0]);
		updateCameraImage(cameraIndex);
	}

	public void setCamButtonToConnect(int cameraIndex) {
		if (cameraIndex == 1) {
			mainPanel.cameraPanel.gimbleCameraPanel.connectButton.setText("Connect");
		} else {
			mainPanel.cameraPanel.excCameraPanel.connectButton.setText("Connect");
		}
	}

	public void setCamButtonToDisconnect(int cameraIndex) {
		if (cameraIndex == 1) {
			mainPanel.cameraPanel.gimbleCameraPanel.connectButton.setText("Disconnect");
		} else {
			mainPanel.cameraPanel.excCameraPanel.connectButton.setText("Disconnect");
		}

	}

	// when there is a change in connection status, this method is called so
	// the UI can respond appropriately
	public void updateConnectionStatus(boolean isConnected) {
		if (isConnected) {
			mainPanel.connectionPanel.status.setText("Connected");
			mainPanel.connectionPanel.status.setForeground(Color.GREEN);
			mainPanel.connectionPanel.mode.setEnabled(false);
			mainPanel.connectionPanel.connect.setText("Disconnect");
			mainPanel.connectionPanel.pause.setVisible(true);
		} else {
			mainPanel.connectionPanel.mode.setEnabled(true);
			mainPanel.connectionPanel.connect.setText("Connect");
			mainPanel.connectionPanel.status.setText("Disconnected");
			mainPanel.connectionPanel.status.setForeground(Color.RED);
			mainPanel.connectionPanel.pause.setVisible(false);
			setByteOutputColor(Color.BLACK);
		}
	}

	// updates the bytes displayed on the ConnectionPanel
	public void setByteOutput(String output) {
		// split up the byte output into to 3 rows
		String[] dividedOutput = new String[3];
		if (output.length() > 120) {
			for (int i = 0; i < dividedOutput.length; i++) {
				if (i != (dividedOutput.length - 1)) {
					dividedOutput[i] = output.substring(45 * i, 45 * (i + 1));
				} else {
					dividedOutput[i] = output.substring(45 * i, output.length());
				}
				mainPanel.connectionPanel.byteOutput[i].setText(dividedOutput[i]);
			}
		} else {
			mainPanel.connectionPanel.byteOutput[0].setText(output);
			clearBottomRows();
		}

	}

	private void clearBottomRows() {
		mainPanel.connectionPanel.byteOutput[1].setText("");
		mainPanel.connectionPanel.byteOutput[2].setText("");
	}

	// updates the color of the text of the byte output on the connection panel.
	// Used for the flashing effect when a new byte array is sent.
	public void setByteOutputColor(Color c) {
		for (int i = 0; i < mainPanel.connectionPanel.byteOutput.length; i++) {
			mainPanel.connectionPanel.byteOutput[i].setForeground(c);
		}
	}

	public void addMessage(String m) {
		addMessage(m, Color.GREEN);
	}

	public void addError(String error) {
		addMessage(error, Color.RED);
	}

	// adds message to console
	public void addMessage(String m, Color c) {
		mainPanel.errorPanel.addMessage(m, c);
	}

	public void toggleJoystickStreamControlButton(boolean streamPlaying) {
		if (streamPlaying) {
			mainPanel.connectionPanel.pause.setText("Pause Joystick Stream");
		} else {
			mainPanel.connectionPanel.pause.setText("Play Joystick Stream");
		}
	}

	public KeyboardHandler getKBHandler() {
		return kbHandler;
	}

	public void turnPotentiometerErrorLightOn(int i) {
		mainPanel.errorLightPanel.statusLightStates[i] = true;
		mainPanel.errorLightPanel.repaint();
	}

	public void turnPotentiometerErrorLightOff(int i) {
		mainPanel.errorLightPanel.statusLightStates[i] = false;
		mainPanel.errorLightPanel.repaint();
	}

	public void clearAllPotentiometerLights() {
		for (int i = 0; i < mainPanel.errorLightPanel.statusLightStates.length; i++) {
			mainPanel.errorLightPanel.statusLightStates[i] = false;
		}

		mainPanel.errorLightPanel.repaint();
	}

	private class MainPanel extends JPanel {
		private ConnectionPanel connectionPanel;
		private InputPanel inputPanel;
		private ErrorLightPanel errorLightPanel;
		private ErrorPanel errorPanel;
		private CameraPanel cameraPanel;

		// sets up framework for Main Panel using the layout manager
		// GridBagLayout
		// The layout sets out the 4 panels based on the defined proportions
		private MainPanel() {
			
			this.setLayout(new GridBagLayout());
			GridBagConstraints c = new GridBagConstraints();
			int totalGridWidth = 3;
			int totalGridHeight = 6;

			// Top Left Panel
			connectionPanel = new ConnectionPanel();
			MouseAdapter mouseListener = listeners.new ConnectMouseListener(connectionPanel);
			connectionPanel.addMouseListener(mouseListener);
			c.gridx = 0;
			c.gridy = 0;
			c.gridwidth = 1;
			c.gridheight = 2;
			setFinalSize(connectionPanel, (XWIDTH * 1) / totalGridWidth, (YHEIGHT * 2) / totalGridHeight);
			this.add(connectionPanel, c);
			// Top Right Panel
			inputPanel = new InputPanel();
			inputPanel.addMouseListener(mouseListener);
			c.gridx = 1;
			c.gridy = 0;
			c.gridwidth = 2;
			c.gridheight = 3;
			setFinalSize(inputPanel, (XWIDTH * 2) / totalGridWidth, (YHEIGHT * 3) / totalGridHeight);
			this.add(inputPanel, c);

			errorLightPanel = new ErrorLightPanel();
			errorLightPanel.addMouseListener(mouseListener);
			c.gridx = 0;
			c.gridy = 2;
			c.gridwidth = 1;
			c.gridheight = 1;
			setFinalSize(errorLightPanel, (XWIDTH * 1) / totalGridWidth, (YHEIGHT * 1) / totalGridHeight);
			this.add(errorLightPanel, c);
			// Bottom Left Panel
			errorPanel = new ErrorPanel();
			errorPanel.addMouseListener(mouseListener);
			c.gridx = 0;
			c.gridy = 3;
			c.gridwidth = 1;
			c.gridheight = 3;
			setFinalSize(errorPanel, (XWIDTH * 1) / totalGridWidth, (YHEIGHT * 3) / totalGridHeight);
			this.add(errorPanel, c);

			// Bottom Right Panel
			cameraPanel = new CameraPanel();
			cameraPanel.addMouseListener(mouseListener);
			c.gridx = 1;
			c.gridy = 3;
			c.gridwidth = 3;
			c.gridheight = 3;
			setFinalSize(cameraPanel, (XWIDTH * 2) / totalGridWidth, (YHEIGHT * 3) / totalGridHeight);
			this.add(cameraPanel, c);
		}

		private void setFinalSize(JComponent component, int width, int height) {
			component.setPreferredSize(new Dimension(width, height));
			component.setMinimumSize(new Dimension(width, height));
			component.setMaximumSize(new Dimension(width, height));
		}

		// panel used for connection aspects, including connecting
		// disconnecting,
		// connection status, and byte output.
		private class ConnectionPanel extends JPanel {
			private JLabel title, status;
			private JLabel[] byteOutput;
			private JButton connect, mode, pause;

			private ConnectionPanel() {
				this.setLayout(new BoxLayout(this, BoxLayout.Y_AXIS));
				this.setBorder(new LineBorder(Color.BLACK));

				Dimension titleDim = new Dimension(80, 25);
				Dimension compDim = new Dimension(120, 25);
				Dimension panelDim = new Dimension(220, 40);

				title = new JLabel("Connection");
				title.setFont(title.getFont().deriveFont(TITLEFONTSIZE));
				title.setAlignmentX(CENTER_ALIGNMENT);
				this.add(title);

				JPanel statusPanel = new JPanel();
				JLabel statusTitle = new JLabel("Status: ");
				statusTitle.setFont(statusTitle.getFont().deriveFont(FONTSIZE));
				statusTitle.setHorizontalAlignment(SwingConstants.RIGHT);
				statusTitle.setPreferredSize(titleDim);
				statusTitle.setMaximumSize(titleDim);
				statusPanel.add(statusTitle);

				status = new JLabel("Disconnected");
				status.setFont(status.getFont().deriveFont(FONTSIZE));
				status.setPreferredSize(compDim);
				status.setMinimumSize(compDim);
				status.setForeground(Color.RED);

				statusPanel.add(status);
				statusPanel.setPreferredSize(panelDim);
				statusPanel.setMaximumSize(panelDim);
				this.add(statusPanel);

				JPanel debug = new JPanel();
				JLabel debugTitle = new JLabel("Debug Mode: ");
				debugTitle.setFont(debugTitle.getFont().deriveFont(FONTSIZE));
				debug.add(debugTitle);
				mode = new JButton("Off");
				Dimension buttonDim = new Dimension(80, 25);
				mode.setPreferredSize(buttonDim);
				mode.setMinimumSize(buttonDim);

				// for toggling debug mode via debug button
				mode.addActionListener(listeners.new DebugModeButtonListener());
				debug.add(mode);
				Dimension debugDim = panelDim;
				debug.setPreferredSize(debugDim);
				debug.setMaximumSize(debugDim);

				this.add(debug);

				JPanel buttonPanel = new JPanel();

				pause = new JButton("Play Joystick Stream");
				pause.setSize(pause.getSize());
				// used for pausing and playing joystick stream
				pause.addActionListener(listeners.new JoystickStreamControlButtonListener());
				pause.setVisible(false);

				connect = new JButton("Connect");
				connect.setAlignmentX(CENTER_ALIGNMENT);
				// action listener for the connect button; used for connecting
				// and disconnecting
				connect.addActionListener(listeners.new ConnectButtonListener());

				buttonPanel.add(pause);
				buttonPanel.add(connect);
				this.add(buttonPanel);
				byteOutput = new JLabel[3];
				for (int i = 0; i < byteOutput.length; i++) {
					if (i != (byteOutput.length - 1)) {
						byteOutput[i] = new JLabel("00000000 00000000 00000000 00000000 00000000");
					} else {
						byteOutput[i] = new JLabel("00000000 00000000 00000000 00000000");
					}
					byteOutput[i].setFont(byteOutput[i].getFont().deriveFont(FONTSIZE));
					byteOutput[i].setAlignmentX(CENTER_ALIGNMENT);
					byteOutput[i].setAlignmentY(BOTTOM_ALIGNMENT);
					Dimension byteDim = new Dimension(400, 25);
					byteOutput[i].setPreferredSize(byteDim);
					byteOutput[i].setMinimumSize(byteDim);
					this.add(byteOutput[i]);
				}

			}

		}

		// displays visuals for all of the input sources (joystick and keyboard)
		private class InputPanel extends JPanel {
			private JSPanel jsPanel;
			private KeyboardAndSwitchButtonPanel keyboardPanel;

			public InputPanel() {
				this.setLayout(new BorderLayout());
				this.setBorder(new LineBorder(Color.BLACK));
				jsPanel = new JSPanel();
				this.add(jsPanel, BorderLayout.CENTER);

				keyboardPanel = new KeyboardAndSwitchButtonPanel();
				this.add(keyboardPanel, BorderLayout.SOUTH);
			}

			// displays joystick data
			private class JSPanel extends JPanel {
				private float[] rightPollData;
				private float[] leftPollData;

				private JSPanel() {
					// raw poll data from both joysticks
					rightPollData = new float[17];
					leftPollData = new float[17];
				}

				// renders all of the joystick components on screen
				public void paintComponent(Graphics g) {
					super.paintComponent(g);
					// shifts everything on the panel left and right
					int horizontalOffset = 50;
					// shifts everything on the panel up or down
					int verticalOffset = 0;
					renderRightStick(g, rightPollData, horizontalOffset, verticalOffset);
					renderLeftStick(g, leftPollData, horizontalOffset, verticalOffset);
				}

				// renders right joystick
				private void renderRightStick(Graphics g, float[] pollData, int horizontalOffset, int verticalOffset) {
					renderButtons(g, 545 - horizontalOffset, 0 + verticalOffset, pollData);
					renderPOVIndicator(g, 555 - horizontalOffset, 195 + verticalOffset, pollData[2], "POV");
					renderJoyStickIndicator(g, 765 - horizontalOffset, 10 + verticalOffset, pollData[1], pollData[0],
							"Main Stick");
					renderThrottleIndicator(g, 680 - horizontalOffset, 195 + verticalOffset, pollData[12], "Throttle");
					renderRZIndicator(g, 810 - horizontalOffset, 195 + verticalOffset, pollData[3], "Z Rotation");
				}

				// renders left joystick
				private void renderLeftStick(Graphics g, float[] pollData, int horizontalOffset, int verticalOffset) {
					renderButtons(g, 10 + horizontalOffset, 0 + verticalOffset, pollData);
					renderPOVIndicator(g, 20 + horizontalOffset, 195 + verticalOffset, pollData[2], "POV");
					renderJoyStickIndicator(g, 230 + horizontalOffset, 10 + verticalOffset, pollData[1], pollData[0],
							"Main Stick");
					renderThrottleIndicator(g, 150 + horizontalOffset, 195 + verticalOffset, pollData[12], "Throttle");
					renderRZIndicator(g, 280 + horizontalOffset, 195 + verticalOffset, pollData[3], "Z Rotation");
				}

				// renders buttons
				private void renderButtons(Graphics g, int x, int y, float[] pollData) {
					g.setFont(new Font("Dialog", Font.BOLD, 15));

					for (int i = 1; i < 7; i++) {
						g.setColor(Color.BLACK);
						g.drawString("Button " + i, x, y + 30 * i);
						if (pollData[i + 3] == 1.0f) {
							g.setColor(Color.GREEN);
						} else {
							g.setColor(Color.BLACK);
						}
						g.fillOval(x + 70, y - 17 + 30 * i, 20, 20);
						g.setColor(Color.BLACK);
						g.drawString("Button " + (6 + i), x + 120, y + 30 * i);
						// to get around the index of the slider
						if (i + 3 + 6 >= 12) {
							if (pollData[i + 3 + 7] == 1.0f) {
								g.setColor(Color.GREEN);
							} else {
								g.setColor(Color.BLACK);
							}
						} else {
							if (pollData[i + 3 + 6] == 1.0f) {
								g.setColor(Color.GREEN);
							} else {
								g.setColor(Color.BLACK);
							}
						}

						g.fillOval(x + 190, y - 17 + 30 * i, 20, 20);
					}

				}
			}

			// renders pov (the small stick on the main joy stick
			private void renderPOVIndicator(Graphics g, int x, int y, double pov, String label) {
				double jx, jy;
				if (pov == 0.0f) {
					jx = 0;
					jy = 0;
				} else {
					jx = Math.cos(2 * Math.PI * pov + Math.PI);
					jy = Math.sin(2 * Math.PI * pov + Math.PI);
				}
				int jlength = 20;
				int boxsize = 60;
				g.setColor(Color.BLACK);
				g.fillRect(x + 3, y + 3, boxsize, boxsize);
				g.setColor(new Color(127, 127, 127));
				g.fillRect(x, y, boxsize, boxsize);
				g.setColor(new Color(220, 220, 220));
				g.drawLine(x + (boxsize / 2), y + (boxsize / 2), (int) ((x + (boxsize / 2)) + jx * (jlength)),
						(int) ((y + (boxsize / 2)) + jy * (jlength)));
				g.fillOval((int) ((x + (boxsize / 2)) + jx * (jlength)) - 18,
						(int) ((y + (boxsize / 2)) + jy * (jlength)) - 18, 36, 36);
				g.setColor(Color.BLACK);
				g.drawString(label, x + boxsize / 4, y + (boxsize + 20));

			}

			// renders the main stick
			private void renderJoyStickIndicator(Graphics g, int x, int y, float jx, float jy, String label) {
				int jlength = 40;
				int boxsize = 140;
				g.setColor(Color.BLACK);
				g.fillRect(x + 3, y + 3, boxsize, boxsize);
				g.setColor(new Color(127, 127, 127));
				g.fillRect(x, y, boxsize, boxsize);
				g.setColor(Color.WHITE);
				g.drawLine(x + (boxsize / 2), y + (boxsize / 2), (int) ((x + (boxsize / 2)) + jx * (jlength)),
						(int) ((y + (boxsize / 2)) + jy * (jlength)));
				g.fillOval((int) ((x + (boxsize / 2)) + jx * (jlength)) - 40,
						(int) ((y + (boxsize / 2)) + jy * (jlength)) - 40, 80, 80);
				g.setColor(Color.BLACK);
				g.drawString(label, x + boxsize / 4, y + (boxsize + 20));

			}

			// renders the slider
			private void renderThrottleIndicator(Graphics g, int x, int y, float slider, String label) {
				double jx = Math.cos(Math.PI / 4 * slider + Math.PI / 2);
				double jy = Math.sin(Math.PI / 4 * slider + Math.PI / 2);
				;
				int jlength = 35;
				int boxsize = 60;
				g.setColor(Color.BLACK);
				g.fillRect(x + 3, y + 3, boxsize, boxsize);
				g.setColor(new Color(127, 127, 127));
				g.fillRect(x, y, boxsize, boxsize);
				g.setColor(new Color(220, 220, 220));
				Graphics2D g2 = (Graphics2D) g;
				g2.setStroke(new BasicStroke(5));
				g2.draw(new Line2D.Double(x + (boxsize / 2), y + boxsize - 4, (jx * jlength + x + boxsize / 2),
						(-jy * jlength + y + boxsize - 4)));
				g.fillOval(x + (boxsize / 2 - 8), y + boxsize - 16, 16, 16);
				g.setColor(Color.BLACK);
				g.drawString(label, x + boxsize / 12, y + (boxsize + 20));
			}

			// renders the rotational z value
			private void renderRZIndicator(Graphics g, int x, int y, float rz, String label) {
				double jx = Math.cos(-1 * Math.PI / 4 * rz + Math.PI / 2);
				double jy = Math.sin(-1 * Math.PI / 4 * rz + Math.PI / 2);
				;
				int jlength = 35;
				int boxsize = 60;
				g.setColor(Color.BLACK);
				g.fillRect(x + 3, y + 3, boxsize, boxsize);
				g.setColor(new Color(127, 127, 127));
				g.fillRect(x, y, boxsize, boxsize);
				g.setColor(Color.WHITE);
				Graphics2D g2 = (Graphics2D) g;
				g2.setStroke(new BasicStroke(5));
				g2.draw(new Line2D.Double(x + (boxsize / 2), y + boxsize - 4, (jx * jlength + x + boxsize / 2),
						(-jy * jlength + y + boxsize - 4)));
				g.setColor(Color.BLACK);
				g.drawString(label, x - 5 + boxsize / 12, y + (boxsize + 20));
			}

			private class KeyboardAndSwitchButtonPanel extends JPanel {
				JButton switchJS;
				boolean[] keyStates;

				public KeyboardAndSwitchButtonPanel() {
					keyStates = new boolean[16];
					// this.setLayout(new BorderLayout());
					switchJS = new JButton("Switch Joysticks");
					switchJS.addActionListener(listeners.new SwitchJoysticksButtonListener());
					setFinalSize(switchJS, 150, 25);
					setFinalSize(this, this.getWidth(), 70);
					JPanel buttonPanel = new JPanel();
					buttonPanel.setOpaque(false);
					buttonPanel.setLayout(new BorderLayout());
					buttonPanel.add(switchJS, BorderLayout.SOUTH);
					setFinalSize(buttonPanel, 150, 65);
					this.add(buttonPanel);
				}

				public void paintComponent(Graphics g) {
					super.paintComponent(g);
					// shifts everything on the panel left and right
					int horizontalOffset = 160;
					// shifts everything on the panel up or down
					int verticalOffset = 5;
					renderRightKeyboardInput((Graphics2D) g, horizontalOffset, verticalOffset);
					renderCenterKeyboardInput((Graphics2D) g, horizontalOffset + 150, verticalOffset);
					renderLeftKeyboardInput((Graphics2D) g, horizontalOffset + 500, verticalOffset);

				}

				private void renderRightKeyboardInput(Graphics2D g, int horizontalOffset, int verticalOffset) {
					int squareSize = 30;
					g.setColor(Color.BLACK);
					g.setFont(new Font("Arial", Font.BOLD, 20));

					if (keyStates[0]) {
						g.setColor(Color.GREEN);
						g.fillRect(10 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(10 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					g.drawString("Q", 16 + horizontalOffset, 25 + verticalOffset);

					if (keyStates[1]) {
						g.setColor(Color.GREEN);
						g.fillRect(42 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(42 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					g.drawString("W", 47 + horizontalOffset, 25 + verticalOffset);

					// determine relative distance from top row
					int rightShift = 10;
					int downShift = 32;

					if (keyStates[2]) {
						g.setColor(Color.GREEN);
						g.fillRect(10 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize,
								squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(10 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize, squareSize);
					g.drawString("A", 18 + horizontalOffset + rightShift, 25 + verticalOffset + downShift);

					if (keyStates[3]) {
						g.setColor(Color.GREEN);
						g.fillRect(42 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize,
								squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(42 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize, squareSize);
					g.drawString("S", 47 + rightShift + horizontalOffset, 25 + +downShift + verticalOffset);

				}

				private void renderCenterKeyboardInput(Graphics2D g, int horizontalOffset, int verticalOffset) {
					int numOfKeys = 8;
					int squareSize = 30;
					int distanceBetweenSquares = 2;
					for (int i = 0; i < numOfKeys; i++) {
						if (keyStates[i + 8]) {
							g.setColor(Color.GREEN);
							g.fillRect(10 + horizontalOffset + i * (squareSize + distanceBetweenSquares),
									0 + verticalOffset, squareSize, squareSize);
						}
						g.setColor(Color.BLACK);
						g.drawRect(10 + horizontalOffset + i * (squareSize + distanceBetweenSquares),
								0 + verticalOffset, squareSize, squareSize);
						g.drawString("" + (i + 1), 20 + horizontalOffset + i * (squareSize + distanceBetweenSquares),
								25 + verticalOffset);
					}
				}

				private void renderLeftKeyboardInput(Graphics2D g, int horizontalOffset, int verticalOffset) {
					int squareSize = 30;
					g.setColor(Color.BLACK);
					g.setFont(new Font("Arial", Font.BOLD, 20));

					if (keyStates[4]) {
						g.setColor(Color.GREEN);
						g.fillRect(10 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(10 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					g.drawString("O", 16 + horizontalOffset, 25 + verticalOffset);

					if (keyStates[5]) {
						g.setColor(Color.GREEN);
						g.fillRect(42 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(42 + horizontalOffset, 0 + verticalOffset, squareSize, squareSize);
					g.drawString("P", 47 + horizontalOffset, 25 + verticalOffset);

					// determine relative distance from top row
					int rightShift = -10;
					int downShift = 32;

					if (keyStates[6]) {
						g.setColor(Color.GREEN);
						g.fillRect(10 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize,
								squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(10 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize, squareSize);
					g.drawString("K", 18 + horizontalOffset + rightShift, 25 + verticalOffset + downShift);

					if (keyStates[7]) {
						g.setColor(Color.GREEN);
						g.fillRect(42 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize,
								squareSize);
					}
					g.setColor(Color.BLACK);
					g.drawRect(42 + horizontalOffset + rightShift, downShift + verticalOffset, squareSize, squareSize);
					g.drawString("L", 47 + rightShift + horizontalOffset, 25 + +downShift + verticalOffset);

				}
			}
		}

		// panel for potentiometer status lights
		private class ErrorLightPanel extends JPanel {
			private boolean[] statusLightStates;

			public ErrorLightPanel() {
				statusLightStates = new boolean[5];
				this.setBorder(new LineBorder(Color.BLACK));
				JLabel title = new JLabel("Potentiometer Error Lights");
				title.setFont(title.getFont().deriveFont(TITLEFONTSIZE));
				title.setAlignmentX(CENTER_ALIGNMENT);
				this.add(title);
			}

			@Override
			public void paintComponent(Graphics g) {
				super.paintComponent(g);
				renderPotentiometerStatusLights(g);
			}

			private void renderPotentiometerStatusLights(Graphics g) {
				int numOfPotentiometers = 5;

				// coordinates of first light
				int startingX = 30;
				int startingY = 50;
				// relative distance between lights
				int distanceBetweenLights = 90;
				int statusLightSize = 30;
				int distanceBetweenLightAndLabel = 5;
				String[] statusLightTitles = { "EX", "FL", "RL", "RR", "FR" };

				for (int i = 0; i < numOfPotentiometers; i++) {
					if (statusLightStates[i]) {
						g.setColor(Color.RED);
					} else {
						g.setColor(Color.BLACK);
					}
					g.fillOval(startingX + i * distanceBetweenLights, startingY, statusLightSize, statusLightSize);
					g.setColor(Color.BLACK);
					g.setFont(new Font("Arial", Font.BOLD, 15));
					g.drawString(statusLightTitles[i], startingX + i * distanceBetweenLights + 7,
							startingY + 40 + distanceBetweenLightAndLabel);
				}

			}
		}

		// panel for displaying all error messages
		private class ErrorPanel extends JPanel {
			Console console;

			private ErrorPanel() {

				this.setLayout(new BorderLayout());
				this.setBorder(new LineBorder(Color.BLACK));

				console = new Console(listeners);
				this.add(console, BorderLayout.CENTER);

			}

			// adds normal message to console
			private void addMessage(String m) {
				addMessage(m, Color.GREEN);
			}

			private void addError(String error) {
				addMessage(error, Color.RED);
			}

			private void addMessage(String m, Color c) {
				console.addText(m, c);
			}
		}

		// displays all aspects of the Camera Panel
		public class CameraPanel extends JPanel {
			public GimbleCameraImagePanel gimbleCameraPanel;
			public ExcCameraImagePanel excCameraPanel;
			public static final int BUTTON_WIDTH = 100, BUTTON_HEIGHT = 25;
			public byte[] gimbleCameraBuffer;
			public byte[] excCameraBuffer;

			private CameraPanel() {
				this.setLayout(new BorderLayout());
				this.setBorder(new LineBorder(Color.BLACK));

				gimbleCameraPanel = new GimbleCameraImagePanel();
				setFinalSize(gimbleCameraPanel, XWIDTH / 3, 1000);
				this.add(gimbleCameraPanel, BorderLayout.WEST);

				excCameraPanel = new ExcCameraImagePanel();
				setFinalSize(excCameraPanel, XWIDTH / 3, 1000);
				this.add(excCameraPanel, BorderLayout.EAST);

			}

			private class GimbleCameraImagePanel extends JPanel {
				public JButton connectButton;

				public GimbleCameraImagePanel() {
					this.setLayout(new BorderLayout());
					JPanel titlePanel = new JPanel();
					JLabel title = new JLabel("Gimble Camera Feed");
					title.setFont(title.getFont().deriveFont(TITLEFONTSIZE));
					titlePanel.add(title);
					this.add(titlePanel, BorderLayout.NORTH);

					connectButton = new JButton("Connect");
					connectButton.addActionListener(listeners.new ConnectToCameraButtonListener(1));
					JPanel connectButtonPanel = new JPanel();
					setFinalSize(connectButtonPanel, 100, 50);
					setFinalSize(connectButton, BUTTON_WIDTH, BUTTON_HEIGHT);
					connectButton.setAlignmentX(CENTER_ALIGNMENT);
					connectButtonPanel.add(connectButton);
					this.add(connectButtonPanel, BorderLayout.SOUTH);
				}

				@Override
				public void paintComponent(Graphics g) {
					super.paintComponent(g);

					if (gimbleCameraBuffer != null) {
						InputStream in1 = new ByteArrayInputStream(gimbleCameraBuffer);

						try {
							g.drawImage(ImageIO.read(in1), 60, 50, null);
						} catch (IOException e) {
							addError("Camera 1 connection error");
						}
					}

				}
			}

			private class ExcCameraImagePanel extends JPanel {
				public JButton connectButton;

				public ExcCameraImagePanel() {
					this.setLayout(new BorderLayout());
					JPanel titlePanel = new JPanel();
					JLabel title = new JLabel("Excavator Camera Feed");
					title.setFont(title.getFont().deriveFont(TITLEFONTSIZE));
					titlePanel.add(title);
					this.add(titlePanel, BorderLayout.NORTH);

					connectButton = new JButton("Connect");
					connectButton.addActionListener(listeners.new ConnectToCameraButtonListener(2));
					;
					JPanel connectButtonPanel = new JPanel();
					setFinalSize(connectButtonPanel, 100, 50);
					setFinalSize(connectButton, BUTTON_WIDTH, BUTTON_HEIGHT);
					connectButton.setAlignmentX(CENTER_ALIGNMENT);
					connectButtonPanel.add(connectButton);
					this.add(connectButtonPanel, BorderLayout.SOUTH);
				}

				@Override
				public void paintComponent(Graphics g) {
					super.paintComponent(g);

					if (excCameraBuffer != null) {
						InputStream in2 = new ByteArrayInputStream(excCameraBuffer);

						try {
							g.drawImage(ImageIO.read(in2), 60, 50, null);
						} catch (IOException e) {
							addError("Camera 2 connection error");
						}
					}
				}
			}

		}
	}
}
