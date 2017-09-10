package mars;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;

import javax.swing.*;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.text.BadLocationException;
import javax.swing.text.Style;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

import mars.UIListenersHandler.ConsoleListener;

public class Console extends JPanel {
	public JFrame frame;
	public JPanel content;
	public JTextPane console;
	public JTextField input;
	public JScrollPane scrollPane;
	public StyledDocument document;
	public UIListenersHandler listeners;
	boolean trace = false;

	public Console(UIListenersHandler listeners) {
		this.listeners = listeners;
		// setting up a bunch of default values
		this.setLayout(new BorderLayout());

		console = new JTextPane();
		console.setEditable(false);
		console.setFont(new Font("Monospaced", Font.BOLD, 18));
		console.setOpaque(false);
		console.setFocusable(false);

		document = console.getStyledDocument();

		scrollPane = new JScrollPane(console);
		scrollPane.setBorder(null);
		scrollPane.setOpaque(false);
		scrollPane.getViewport().setOpaque(false);

		input = new JTextField();
		input.setBorder(BorderFactory.createMatteBorder(1, 0, 13, 0, Color.GREEN));
		input.setFont(new Font("Monospaced", Font.BOLD, 20));
		input.setEditable(true);
		input.setCaretColor(Color.GREEN);
		input.setForeground(Color.GREEN);
		input.setOpaque(false);
		input.addActionListener(listeners.new ConsoleListener(this, input, console, document));

		// key listener for text field
		input.addKeyListener(new KeyListener() {

			@Override
			public void keyPressed(KeyEvent arg0) {

			}

			@Override
			public void keyReleased(KeyEvent arg0) {

			}

			@Override
			public void keyTyped(KeyEvent arg0) {

			}

		});
		

		this.add(scrollPane, BorderLayout.CENTER);
		this.add(input, BorderLayout.SOUTH);
		this.setBackground(new Color(50, 50, 50));
	}
	
			public void addMessage(String text) {
				addText(text, Color.GREEN);
			}
			
			public void addError(String error) {
				addText(error, Color.RED);
			}

			// adds text to the console in the specified color
			public void addText(String text, Color c) {
				Style style = console.addStyle("Style", null);
				StyleConstants.setForeground(style, c);
				try {
					document.insertString(document.getLength(), text + "\n", style);

					// catches error when the connection is closed while text is being
					// added; completely harmless
				} catch (Error e) {

				} catch (BadLocationException e) {
					e.printStackTrace();
				}
				scrollBottom();
			}
			
			// scrolls to the bottom of the screen
			private void scrollBottom() {
				console.setCaretPosition(document.getLength());
			}

	
}
