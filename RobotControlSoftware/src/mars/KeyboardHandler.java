package mars;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.util.*;

public class KeyboardHandler {
	
	private static boolean[] keyStates;
	private volatile boolean anyKeyPushed;
	

	public KeyboardHandler(JComponent parent) {
		keyStates = new boolean[16];
		// sets up key bindings
		InputMap inputMap = parent.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
		ActionMap actionMap = parent.getActionMap();
		setKeyBinding(inputMap, actionMap);
	}

	public boolean[] getKeyStates() {
		return keyStates;
	}
	
	public boolean getAnyKeyPushed() {
		for(int i = 0; i < keyStates.length; i++) {
			if(keyStates[i]) {
				return true;
			}
		}
		return false;
	}
	
	private void setKeyBinding(InputMap inputMap, ActionMap actionMap) {
		String[] keyCodes = { "Q", "W", "A", "S", "O", "P", "K", "L", "1", "2", "3", "4", "5", "6", "7", "8"};
		for(int i = 0; i < keyStates.length; i++) {
			String pushedKey = "button" + (i + 1) + "Pushed";
			inputMap.put(KeyStroke.getKeyStroke("pressed " + keyCodes[i]), pushedKey);
			actionMap.put(pushedKey, new ButtonPushedAction(i));
			
			String releasedKey = "button" + (i + 1) + "Released";
			inputMap.put(KeyStroke.getKeyStroke("released " + keyCodes[i]), releasedKey);
			actionMap.put(releasedKey, new ButtonReleasedAction(i));
		}
	}

	private class ButtonPushedAction extends AbstractAction {
		public int buttonIndex;

		public ButtonPushedAction(int i) {
			buttonIndex = i;
			

		}

		@Override
		public void actionPerformed(ActionEvent e) {
			keyStates[buttonIndex] = true;
		}

	}
	
	private class ButtonReleasedAction extends AbstractAction {
		public int buttonIndex;

		public ButtonReleasedAction(int i) {
			buttonIndex = i;
			

		}

		@Override
		public void actionPerformed(ActionEvent e) {
			keyStates[buttonIndex] = false;
			
		}

	}

}
