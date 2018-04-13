CON
  _xinfreq = 5_000_000 
  _clkmode = xtal1 + pll16x
   
  ConnectionPin     =  0
  txPin             =  8    'Pin to send 9600 baud asynchronous data to all H-bridges (via their S1 pins
  xBeeRx            =  9    'Receive data from xBee's DOUT Pin
  xBeeTx            = -1    'Transmits data to xBee's DIN Pin                
  P2RX              =  9    'connection between prop1 and prop2
  P2TX              =  0

  'ADC Pins
  eoc  = 15                         'P15 receives the "end of conversion" signal from ADC
  clk  = 14                         'P14 sends the synchronous clock pulses to ADC chip
  Sout = 13                         'Data going to the ADI pin on ADC
  Sin  = 12                         'Data coming from the ADO pin on ADC
  cs   = 11                         'Chip Select
             
  ' Index of the byte number that is received from the remote control station (Type: Joystick)
  BYTE_beginPacket  =  0    'Start Byte
  BYTE_rjButs1      =  1    'Right Joystick Buttonset 1
  BYTE_rjButs2      =  2    'Right Joystick Buttonset 2
  BYTE_ry           =  3    'Right Joystick Y Axis
  BYTE_rx           =  4    'Right Joystick X Axis
  BYTE_rz           =  5    'Right Joystick Z Axis
  BYTE_rthrottle    =  6    'Right Joystick Throttle
  BYTE_ljbuts1      =  7    'Left  Joystick Buttonset 1
  BYTE_ljbuts2      =  8    'Left  Joystick Buttonset 2
  BYTE_ly           =  9    'Left  Joystick Y Axis   
  BYTE_lx           =  10   'Left  Joystick X Axis
  BYTE_lz           =  11   'Left  Joystick Z Axis
  BYTE_lthrottle    =  12   'Left  Joystick Throttle
  BYTE_endPacket    =  13   'End Byte

  BUTTON_UP         =  12   'POV Thumb Stick has only up, down, left, right
  BUTTON_DOWN       =  13
  BUTTON_RIGHT      =  14
  BUTTON_LEFT       =  15

  'ADC Channel Labels
  {
    CHANNEL MAP
    0 => Excavator   
    1 => Front Left  (FL)
    2 => Front Right (FR)  
    8 => Rear  Left  (RL)  
    5 => Rear  Right (RR)
  }
  adcExc = 1
  adcFL  = 0
  adcFR  = 2
  adcRL  = 8
  adcRR  = 5       

  'Excavator Positions
  ExcMin = 1247'1270       'MIN Pos on Cart
  ExcMax = 1525'1505       'MAX Pos on Cart
  ExcDigPos = 1300       'Pos to be at to dig

  'ERROR MSG SENT INDICATORS
  IndExc = 0
  IndFL  = 1
  IndRL  = 2
  IndRR  = 3
  IndFR  = 4

  debug1 = 16
  debug2 = 17
  debug3 = 18
  
VAR

'NETWORK STATUS
long xbeeconnected                    

'MOTOR DIRECTIONS
'0 is clockwise, 1 is counterclockwise     
'4 is counterclockwise. 5 is clockwise


'ARMS VARIABLES
long frontRightArmSpeed, backRightArmSpeed, frontRightArmDir, rearRightArmDir
long frontLeftArmSpeed, backLeftArmSpeed, frontLeftArmDir, rearLeftArmDir 

'WHEELS VARIABLES
long rightWheelSpeed, frontRightWheelDir, rearRightWheelDir
long leftWheelSpeed , frontLeftWheelDir , rearLeftWheelDir

'EXCAVATOR VARIABLES
long excavatorSpeed, excavatorDir, invertedExcavatorDir
long linActSpeed, linActDir          

'POSITION VARIABLES - Feedback from Pots
long PosLegFL, PosLegFR, PosLegRL, PosLegRR
long PosExcavator

'DESIRED POSITION VARIABLES - Mainly for Macros
long DesPosLegFL, DesPosLegFR, DesPosLegRL, DesPosLegRR
long DesPosExcavator
long desiredValuesSet

'POSITION OFFSETS
 {
    LEG CALIBRATION VALUES AT HORIZONTAL
    Current FL Position: 951
    Current RR Position: 958
    Current FR Position: 1086
    Current RL Position: 1099
  }  

{
  *Rotation based on looking down length of shaft to the pot body
  CW Rotation of Pots
  FL, RR Leg: Value UP  , Leg moves IN
  FR, RL Leg: Value UP  , Leg moves OUT
  Excavator : Value UP  , Exc moves UP
                                                                 
  CCW Rotation of Pots
  FL, RR Leg: Value DOWN, Leg moves OUT
  FR, RL Leg: Value DOWN, Leg moves IN
  Excavator : Value DOWN, Exc moves DOWN
}

'ENABLES FOR POSITION CONTROL                               
byte enableFl, enableFR, enableRL, enableRR, enableExc
byte enableRightArms, enableLeftArms 

'Circular Buffers for Pots
long FLBuf[5], FRBuf[5], RLBuf[5], RRBuf[5], ExcBuf[5]
long FLInd,    FRInd,    RLInd,    RRInd,    ExcInd

byte macroRunning

'Leg Locking Macro Vars
byte phase
byte desiredPositionsSet

'Pot Error Flags
byte ErrorExc, ErrorFL, ErrorFR, ErrorRL, ErrorRR
byte stableADCReading

'Mode bytes
byte ExcActiveModeEnabled, ArmsActiveModeEnabled

byte PrevPosSet[5]
long PrevPos[5]
byte resetPosMsg[5]

long motorStack[100], RobotStack[100], ADCStack[50], PotStack[50]
long inputPacket[14]
byte errorMsg[5]
byte errorFlag[5]
byte isConnected

OBJ
  pst         : "PST_Driver"
  HbridgeFDS  : "FullDuplexSerial"   'Motor control serial output
  p1Serial    : "FullDuplexSerial"

    