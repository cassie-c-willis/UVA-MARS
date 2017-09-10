UVA MARS Control Board Specifications
Updated: 12-3-2016

Overall:
* The overall purpose of the control board is to connect the wireless communications between the software on a computer and the motors on the robot. 

XBEE:
* The XBEE chip is a wireless communication chip that connects to the software. 
* The XBEE receives up to 8 bytes of information from the computer and communicates those bytes to Propeller 1. 

Joystick Control Mapping:
* Each byte or bit of information corresponds to a function on the joystick. The propeller chips have software loaded onto them to respond to given inputs from the joystick. 
In total there are 14 bytes. Byte 1 is the start byte, bytes 2 - 7 represent the state of the right joystick, bytes 8-13 represent the state of the left joystick, byte 14 is the end byte. 
START BYTE
* First byte: all 1's, (255 in decimal, 11111111 in binary) showing the joystick is connected 
RIGHT JOYSTICK
* Second byte: 
  o Bit 1: Button 1
  o Bit 2: Button 2
  o Bit 3: Button 3
  o Bit 4: Button 4
  o Bit 5: Button 5
  o Bit 6: Button 6
  o Bit 7: Button 7
  o Bit 8: Button 8
* Third Byte:
  o Bit 1: Button 9
  o Bit 2: Button 10
  o Bit 3: Button 11
  o Bit 4: Button 12
  o Bit 5: Pad up
  o Bit 6: Pad down
  o Bit 7: Pad right
  o Bit 8: Pad left
* Fourth Byte: Y-axis of main stick, 11111101 (253 in decimal) is all the way forward, 00000000 (0 in decimal) is the way backward, 01111111 is centered (127 in decimal). 
* Fifth Byte: X-axis of main stick, 11111101 (253 in decimal) is all the way right, 00000000 (0 in decimal) is the way left, 01111111 is centered (127 in decimal). 
* Sixth Byte: Rotation of main stick, 11111101 (253 in decimal) is rotated all the way to the right, 00000000 (0 in decimal) is rotated all the way to the left, 01111111 (127 in decimal) is no rotation
* Seventh Byte: Slider, 11111101 (253 in decimal) is all the way up, 00000000 (0 in decimal) is all the way down
LEFT JOYSTICK
* Eighth byte: 
  o Bit 1: Button 1
  o Bit 2: Button 2
  o Bit 3: Button 3
  o Bit 4: Button 4
  o Bit 5: Button 5
  o Bit 6: Button 6
  o Bit 7: Button 7
  o Bit 8: Button 8
* Ninth Byte:
  o Bit 1: Button 9
  o Bit 2: Button 10
  o Bit 3: Button 11
  o Bit 4: Button 12
  o Bit 5: Pad up
  o Bit 6: Pad down
  o Bit 7: Pad right
  o Bit 8: Pad left
* Tenth Byte: Y-axis of main stick, 11111101 (253 in decimal) is all the way forward, 00000000 (0 in decimal) is the way backward, 01111111 is centered (127 in decimal). 
* Eleventh Byte: X-axis of main stick, 11111101 (253 in decimal) is all the way right, 00000000 (0 in decimal) is the way left, 01111111 is centered (127 in decimal). 
* Twelfth Byte: Rotation of main stick, 11111101 (253 in decimal) is rotated all the way to the right, 00000000 (0 in decimal) is rotated all the way to the left, 01111111 (127 in decimal) is no rotation
* Thirteenth Byte: Slider, 11111101 (253 in decimal) is all the way up, 00000000 (0 in decimal) is all the way down
END BYTE
* Fourteenth Byte: 11111110 (254 in decimal) verifying that the signal is correct

Propeller 1:
* Receives motor communication bytes from the XBEE
* Sends that information to Propeller 2
* Mainly present so a byway between the XBEE and Propeller 2 
* Can be used to run sensors if the decision is made to add sensors to the robot later on

Propeller 2:
* Receives motor communication bytes from the XBEE
* Includes software that understands what to do with the information from the byte string
* Controls each of the motors through a signal wire to make the motors operate in a certain way such that the robot performs certain actions

Optoisolator:
* Creates optical instead of electrical communication 
* Primarily used to prevent brownouts on the board – also done through motors but this is an added measure of safety
* Connected between Propeller 2 and the H-Bridge supply wire

3.3V Voltage Regulator:
* Regulates the voltage from a 5-volt input signal to a 3.3-volt output signal
* Sends the 3.3v signal to the XBEE and the ADC chip

H-Bridge Signal Wire:
* Sends the signals to perform certain commands from Propeller 2 to the motors

Motor Power Connector:
* Provides 5 volts of power to the board
* These 5 volts are sent to the 3.3v voltage regulator to power the XBEE and ADC

Control Power Connector:
* Provides 12 volts of power to the board
* These 12 volts are used to power both of the propeller chips
* Also currently connected to a 5-volt regulator which is no longer in use in the board but is still present in the schematic

XBEE Reset Button:
* Resets the XBEE chip

Propeller Reset Button:
* Resets both of the Propeller chips

ADC:
* Analog-to-Digital Converter
* Used to hook up sensors and communicate to the sensors from Propeller 2
* Not currently in use because sensors not currently present on the robot

Other Components:
* Various resistors and capacitors are also included in the control board to help regulate the overall power flow
* Various LED’s are used on the board for testing purposes and to ensure that each element in the control board is operating properly



