package mars;

//converts raw poll data to byte array
public class PollDataConverter {

	/*
	 * 8 Byte array to send to the robot. Byte 1 is a byte of all 1's. The next
	 * six bytes represent the right joystick. Bytes 2 and the first half of
	 * byte 3 represent the state of the buttons (1 = on, * 0 = off). The second
	 * half of byte 3 represents the state of the pov. Byte 4 represents the
	 * state of y-axis of the joystick. Byte 5 represents the state of the
	 * x-axis of the joystick. Byte 6 represents the state of the rotational
	 * z-axis. Byte 7 represents the state of the throttle. Bytes 8 - 13
	 * represent the left joystick, in the same order as before. Byte 14 is
	 * 11111110 (254 in binary)
	 */
	private byte[] convertedPollData;
	private byte[] previousConvertedPollData;

	// see Joystick class for documentation

	private static final int X = 1, Y = 0, POV = 2, RZ = 3;
	private static final int B1 = 4, B2 = 5, B3 = 6, B4 = 7, B5 = 8, B6 = 9, B7 = 10, B8 = 11, SLIDER = 12, B9 = 13,
			B10 = 14, B11 = 15, B12 = 16;

	public PollDataConverter() {
		convertedPollData = new byte[14];
		previousConvertedPollData = new byte[14];

		// used to check number of bytes
		convertedPollData[0] = -1;
		convertedPollData[convertedPollData.length - 1] = (byte) 254;
	}

	public byte[] getByteArr() {
		return convertedPollData;
	}

	public String getByteArrAsStr(byte[] byteArr) {
		String byteArrStr = "";
		for (int i = 0; i < byteArr.length; i++) {
			byteArrStr += (String.format("%8s", Integer.toBinaryString((byteArr[i] + 256) % 256)).replace(' ', '0')
					+ " ");
		}
		return byteArrStr;
	}

	public boolean isChanged() {
		for (int i = 0; i < convertedPollData.length; i++) {
			if (Math.abs(convertedPollData[i] - previousConvertedPollData[i]) >= 1) {
				return true;
			}
		}
		return false;
	}

	public byte[] createJoystickPacket(float[] rightFloatArr, float[] leftFloatArr) {
		for (int i = 0; i < convertedPollData.length; i++) {
			previousConvertedPollData[i] = convertedPollData[i];
		}
		convertIndividual(rightFloatArr, 0); // right stick
		convertIndividual(leftFloatArr, 6); // left stick
		return convertedPollData;
	}

	private void convertIndividual(float[] floatArr, int startingIndex) {

		// setting up the bytes for the buttons
		boolean allActive = true;
		// first byte of buttons
		for (int i = B1; i < SLIDER - 2; i++) {
			if (floatArr[i] == 1.0f) {
				convertedPollData[1 + startingIndex] |= (1 << (11 - i));
			} else if (floatArr[i] == 0.0f) {
				allActive = false;
				convertedPollData[1 + startingIndex] &= ~(1 << (11 - i));
			}

		}
		// keeps track of if either button 7 and/or button 8 is pushed.
		// Used to make sure the byte value does not exceed 253
		boolean oneOfLastTwo = false;

		for (int i = SLIDER - 2; i < SLIDER; i++) {
			if (floatArr[i] == 1.0f) {
				oneOfLastTwo = true;
				convertedPollData[1 + startingIndex] |= (1 << (11 - i));
			} else if (floatArr[i] == 0.0f) {
				convertedPollData[1 + startingIndex] &= ~(1 << (11 - i));
			}

		}

		// deactivates button 7 and button 8 if all of the first 8 buttons are
		// pushed
		if (allActive && oneOfLastTwo) {
			convertedPollData[1 + startingIndex] &= ~(1 << (11 - B7));
			convertedPollData[1 + startingIndex] &= ~(1 << (11 - B8));
		}
		// last half byte of buttons
		for (int i = B9; i < floatArr.length; i++) {
			if (floatArr[i] == 1.0f) {
				convertedPollData[2 + startingIndex] |= (1 << (20 - i));
			} else if (floatArr[i] == 0.0f) {
				convertedPollData[2 + startingIndex] &= ~(1 << (20 - i));
			}
		}

		// half byte of pov; bit 1 is forward, bit 2 is backward,
		// bit 3 is right, bit 4 is left; 1 is active in that direction,
		// 0 is inactive in that direction

		// forward bit
		if ((floatArr[POV] > 0.0f) && (floatArr[POV] < 0.5f)) {
			convertedPollData[2 + startingIndex] |= (1 << 3);
		} else {
			convertedPollData[2 + startingIndex] &= ~(1 << 3);
		}
		// backward bit
		if ((floatArr[POV] > 0.5f) && (floatArr[POV] < 1.0f)) {
			convertedPollData[2 + startingIndex] |= (1 << 2);
		} else {
			convertedPollData[2 + startingIndex] &= ~(1 << 2);
		}
		// right bit
		if ((floatArr[POV] > 0.25f) && (floatArr[POV] < 0.75f)) {
			convertedPollData[2 + startingIndex] |= (1 << 1);
		} else {
			convertedPollData[2 + startingIndex] &= ~(1 << 1);
		}
		// left bit
		if (((floatArr[POV] > 0.75f) && (floatArr[POV] <= 1.0f))
				|| ((floatArr[POV] > 0.0f) && (floatArr[POV] < 0.25f))) {
			convertedPollData[2 + startingIndex] |= (1 << 0);
		} else {
			convertedPollData[2 + startingIndex] &= ~(1 << 0);
		}

		// converting the y-axis floating-point value to byte
		// multiply by -1 so that all the way forward is 253
		convertedPollData[3 + startingIndex] = convertFloatToByte(-1.0f * floatArr[Y]);

		// converting the x-axis floating-point value to byte
		convertedPollData[4 + startingIndex] = convertFloatToByte(floatArr[X]);

		// converting the rotational z-axis floating-point value to byte
		convertedPollData[5 + startingIndex] = convertFloatToByte(floatArr[RZ]);

		// converting the throttle floating-point value to byte
		// multiply by -1 so that all the way forward is 253
		convertedPollData[6 + startingIndex] = convertFloatToByte(-1.0f * floatArr[SLIDER]);

	}

	// used to convert float to byte
	private byte convertFloatToByte(float f) {
		return (byte) (Math.round((f + 1.0) / 2.0 * 251.0));
	}

	public byte[] createCommandPacket(boolean[] keyStates) {
		byte[] packet = new byte[4];
		packet[0] = (byte) 253;
		packet[3] = (byte) 252;

		for (int i = 0; i < 8; i++) {
			if (keyStates[i]) {
				packet[1] |= (1 << i);
			} else {
				packet[1] &= ~(1 << i);
			}
		}

		for (int i = 8; i < 16; i++) {
			if (keyStates[i]) {
				packet[2] |= (1 << (i - 8));
			} else {
				packet[2] &= ~(1 << (i - 8));
			}
		}

		return packet;
	}
}
