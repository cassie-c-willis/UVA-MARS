package mars;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.text.BadLocationException;
import javax.swing.text.Style;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

public class UIListenersHandler {
	Launcher launcher;

	public UIListenersHandler(Launcher launcher) {
		this.launcher = launcher;
	}

	public class ConnectButtonListener implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			new Thread(new Runnable() {
				@Override
				public void run() {
					JButton sourceButton = (JButton) e.getSource();

					if (sourceButton.getText().equals("Connect")) {
						launcher.userConnect();
					} else {
						launcher.userDisconnect();
					}
				}

			}).start();

		}
	}

	public class DebugModeButtonListener implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			new Thread(new Runnable() {

				@Override
				public void run() {
					JButton sourceButton = (JButton) e.getSource();
					if (sourceButton.getText().equals("Off")) {
						launcher.setDebugMode(true);
						sourceButton.setText("On");
					} else {
						launcher.setDebugMode(false);
						sourceButton.setText("Off");
					}
				}

			}).start();
		}

	}

	public class JoystickStreamControlButtonListener implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			JButton sourceButton = (JButton) e.getSource();
			if (sourceButton.getText().equals("Play Joystick Stream")) {
				launcher.playJoystickStream();
				sourceButton.setText("Pause Joystick Stream");
			} else {
				launcher.pauseJoystickStream();
				sourceButton.setText("Play Joystick Stream");

			}

		}
	}

	public class SwitchJoysticksButtonListener implements ActionListener {

		@Override
		public void actionPerformed(ActionEvent e) {
			new Thread(new Runnable() {

				@Override
				public void run() {
					launcher.switchJoysticks();
				}

			}).start();
		}

	}
	
	public class ConnectMouseListener extends MouseAdapter {
		JComponent parent;

		public ConnectMouseListener(JComponent panel) {
			parent = panel;
		}
		
		@Override
		public void mouseEntered(MouseEvent e) {
			parent.requestFocusInWindow();
		}

	}
	
	public class ConnectToCameraButtonListener implements ActionListener {

		private int cameraIndex;
		
		public ConnectToCameraButtonListener(int cameraIndex) {
			this.cameraIndex = cameraIndex;
		}
		@Override
		public void actionPerformed(ActionEvent e) {
			JButton sourceButton = (JButton)e.getSource();
			if(sourceButton.getText().equals("Connect")) {
				launcher.cameraConnect(cameraIndex);
			} else {
				launcher.cameraUserDisconnect(cameraIndex);
			}
		}
		
	}
	
	public class ConsoleListener implements ActionListener {
		private Console terminal;
		private JTextField input;
		public JTextPane console;
		public StyledDocument document;
		
		public ConsoleListener(Console terminal, JTextField input, JTextPane console, StyledDocument document) {
			this.terminal = terminal;
			this.input = input;
			this.console = console;
			this.document = document;
		}
		

		@Override
		public void actionPerformed(ActionEvent arg0) {
			String text = input.getText();
			terminal.addText(text, Color.GREEN);
			doCommand(text);
			input.selectAll();
		}
		

		// executes command entered into the textbox, if recognized
		private void doCommand(String text) {
			String[] commands = text.split(" ");
			if (commands[0].equals("clear")) {
				clear();
			} else if (commands[0].equals("send")) {
				send(commands);
			} else if (commands[0].equals("help")) {
				help(commands);
			} else {
				terminal.addError("Command \"" + commands[0] + "\" not recognized type \"help\" for more info");
			}
		}

		// clears the console
		private void clear() {
			try {
				document.remove(0, document.getLength());
			} catch (BadLocationException e) {
				e.printStackTrace();
			}
		}

		// sends send the argument bytes to the robot
		private void send(String[] commands) {
			if (commands.length <= 1) {
				terminal.addError("Specify argument bytes to send");
			} else {
				int i = 1;
				byte[] output = new byte[commands.length - 1];
				try {
					while (i < commands.length) {
						
						//determines if the argument is a binary number
						if (commands[i].startsWith("0b")) {
							commands[i] = commands[i].substring(2, commands[i].length());
							//output[i - 1] = Byte.parseByte(commands[i], 2);
						} 
						
						//determines if the argument is a hexadecimal number
						else if (commands[i].startsWith("0x")) {
							commands[i] = commands[i].substring(2, commands[i].length());
							int unsigned = Integer.parseInt(commands[i], 16);
							
							
						} 
						
						//otherwise, assumes the number is decimal
						else {
							
							//converts from unsigned to its signed equivalent
							int unsigned = Integer.parseInt(commands[i]);
							int signed;
							if(unsigned < 256 && unsigned > 128) {
								signed = unsigned - 256;
							} else if (unsigned < 256 && unsigned >= 0) {
								signed = unsigned;
							} else {
								throw new NumberFormatException("Invalid range for byte (0 - 255)");
							}
							
							output[i - 1] = (byte)(signed);
						}
						i++;

					}
					
					launcher.sendPacket(output);	
				} catch (Exception e) {
					terminal.addError(e.toString());
				}

			}
		}

		// displays helpful documentations for console
		private void help(String[] commands) {
			if (commands.length == 1) {
				terminal.addMessage("Available commands:");
				helpClear();
				terminal.addMessage("");
				helpSend();
				terminal.addMessage("");
				helpHelp();
			} else if (commands.length == 2) {
				if (commands[1].equals("clear")) {
					helpClear();
				} else if (commands[1].equals("send")) {
					helpSend();
				} else if (commands[1].equals("help")) {
					helpHelp();
				} else {
					terminal.addError("Command \"" + commands[1] + "\" not recognized type \"help\" for more info");
				}
			} else {
				terminal.addError("Invalid syntax. type \"help\" for more info");
			}
		}

		// displays documentation for clear command
		private void helpClear() {
			terminal.addMessage("clear");
			terminal.addMessage("Syntax: clear");
			terminal.addMessage("Description: Clears the console of all text");
		}

		// documentations for send command
		private void helpSend() {
			terminal.addMessage("send");
			terminal.addMessage("Syntax: send byte1 [byte2] [byte3] ...");
			terminal.addMessage(
					"Description: Sends the specified argument bytes over the current socket connection, if one is present. Bytes must be specified in decimal (0 to 255)\n");
		}

		// documentation for help commands
		private void helpHelp() {
			terminal.addMessage("help");
			terminal.addMessage("Syntax: help [command]");
			terminal.addMessage(
					"Description: displays the documentation for the specified commands. If no command is specified, displays documentation for all commands");
		}

		

		
	}

}
