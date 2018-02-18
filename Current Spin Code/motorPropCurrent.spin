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

    
PUB Main  | input, byteCount, ledstate, validSeries   
 isConnected := 0
  'dira[ConnectionPin]~                'Set connection pin to be an input
 ' input := 0
 byteCount := 0           

 'INIT all motor speeds to OFF
 frontRightArmSpeed   := 0
 backRightArmSpeed := 0
 rightWheelSpeed := 0
 frontLeftArmSpeed    := 0
 backLeftArmSpeed := 0
 leftWheelSpeed  := 0
 excavatorSpeed  := 0
 linActSpeed     := 0

 'INIT all pos control to OFF
 enableFl        := 0
 enableFR        := 0
 enableRL        := 0
 enableRR        := 0
 enableExc       := 0

 'INIT all error flags to 0
 ErrorExc        := 0
 ErrorFL         := 0
 ErrorFR         := 0
 ErrorRL         := 0
 ErrorRR         := 0
 errorFlag[IndExc] := 0

 'Setup debug LEDs
 dira[debug1]~~
 dira[debug2]~~
 dira[debug3]~~

 'Reset Msgs not needed in beginning
 resetPosMsg[IndExc] := 0
 
 ExcActiveModeEnabled  := 1
 ArmsActiveModeEnabled := 1

 'Reset Msg Indicators
 
 
 'INIT macroRunning to false
 macroRunning    := 0

 'ADC Stability set to false
 stableADCReading := 0

 'COG #1
 p1Serial.Start(P2RX, P2TX, %0011, 9600) 'Unneeded for final deployments

 'COG #2 
 HbridgeFDS.Start(-1,txPin,0,9600)     'Start the Asynchronous Serial driver to talk to the H-Bridges 
 
 pst.start     'Cog 3
                                                         
 coginit(4 , updateADC          , @ADCStack  ) 'Cog 4
 waitcnt(clkfreq*4+cnt)      
 
 repeat until PosExcavator <> 0
 
 DesPosExcavator  := PosExcavator #> ExcMin <# ExcMax 'Start by maintaining current position  
 
 coginit(5 , processState       , @RobotStack) 'Cog 5    
 coginit(6 , PotControl         , @PotStack  ) 'Cog 6  
 coginit(7 , motorDriverUpdater , @motorStack) 'Cog 7

 stableADCReading := 1

 {                                      
 pst.str(String("PosExc - DesPosExc: "))
 pst.dec(PosExcavator)
 pst.str(String(" - "))
 pst.dec(DesPosExcavator)
 'error := ||(PosExcavator - DesPosExcavator)
 pst.str(String(" = "))
 pst.dec(PosExcavator - DesPosExcavator)
 pst.NewLine             
 }
 'repeat

 repeat
        'pst.str(String("Receiving byte"))
        'discards all bytes until the start byte (255) appears
        input := p1Serial.RxTime(1050)             
        repeat until input == 255 OR input == -1
          input := p1Serial.RxTime(1050) 
        
        if input == -1
           isConnected     := 0
          'stop all motors
           frontRightArmSpeed   := 0
           backRightArmSpeed := 0
           rightWheelSpeed := 0
           frontLeftArmSpeed    := 0
           backLeftArmSpeed := 0
           leftWheelSpeed  := 0
           
          
        'byte0 := input
        inputPacket[byteCount] := input
        byteCount ++
        
        'Load the received bytes into local variables
        '**Look into swapping this with an array in the DAT section**
        'keeps loading bytes until we have loaded 14 total or if the end byte appears
        repeat until input == 254 OR byteCount  == 14 OR input == -1
          input := p1Serial.Rx
          if byteCount > 0 and byteCount < 14
             inputPacket[byteCount] := input          
          byteCount ++
         
        'If we've received 14 bytes, validate,otherwise drop the packet
        if byteCount == 14
        
            'run validation on the byte sequence
            'validSeries := validateStartEnd(byte0, byte13)
            validSeries := validateStartEnd'(inputPacket[BYTE_beginpacket],inputpacket[BYTE_endpacket]
            'only process if start/end are good (joystick connected, looks like sequence is valid)
            
            if validSeries == 1                                                                                                             
               isConnected := 1
               
               outa[debug3] := !outa[debug3]   
            else               
               isConnected := 0

            
        else
           'Series is invalid length
           isConnected := 0
           
        'reset the counter whether valid or not
        byteCount := 0             
        
        inputPacket[BYTE_beginpacket] := 0     'reset packet so we know when invalid packet sent
        inputPacket[BYTE_endpacket] := 0                   
      
PUB validateStartEnd
      ' This method checks the start and end bytes of the communication sequence
      ' To validate, it needs byte0 = 255 and byte13 = 254

      if inputPacket[BYTE_beginpacket] == 255
        'result := 1
        if inputPacket[BYTE_endpacket] == 254
          result:= 1 'returns 1 if start and end byte are correct, otherwise returns default value of 0           
                                                          
PUB processState | excInSpeed
    'pst.str(string("reached"))
    'pst.newline

  desiredPositionsSet := 0 'Initialize to 0 -- For leg locking macro
  phase               := 0 'Start phased macros in phase 0    
  outa[debug1] := 1    
                                                                                                                                                                           
  repeat
   ' pst.str(String("Processing state"))
    if isConnected == 1                    'Only do things if connection is active       
                              
        'move robot (main control cog)
      'if macroRunning == 0                 'Only do teleop if macro not running
        if getRightButton(0) == 0          'Get state of Button 0 on Right Joystick   -- The Trigger
          if getRightButton(1) == 1        'Get state of Button 1 on Right Joystick   -- The Thumb Button
            rightScrew(-getRY + getRX)     'Vector addition of joystick axes to get screw movement
            rightArm(-getRZ)               'Z Axis controls the Leg                         
            leftScrew(getLY + getLX)
            leftArm(getLZ)
          else
            rightScrew(0)                  'Without correct button sequence, do nothing
                                                                     
            leftScrew(0)
            
            if getrightbutton(11) == 1      'if both other buttons are unpressed, but this button is pressed, individual leg control
              if getRightButton(4) == 1
                flarm(15)
              else
                flarm(0)
              if getRightButton(2) == 1
                blarm(15)
              else
                blarm(0)
              if getRightButton(3) == 1
                brarm(15)
              else
                brarm(0)
              if getRightButton(5) == 1
                frarm(15)
              else
                frarm(0)
                

            else
              leftArm(0)
              rightArm(0)
                                     
          'mainArm(0)                       'Don't let excavator operate in this mode
          enableExc := 1                   'If not operating Exc, maintain current position
          
        else                            
          enableExc := 0                   'Don't use position control when we're not manually controlling excavator
          excInSpeed := -getRY*getRT/255
          if PosExcavator > ExcMin and excInSpeed < 0          'Don't let the Arm hit other parts of robot    
              mainArm(excInSpeed)
          elseif PosExcavator < ExcMax and excInSpeed > 0          'Don't let the Arm hit other parts of robot    
              mainArm(excInSpeed)
          else
              mainArm(0)

          PrevPos[IndExc] := PosExcavator           
          DesPosExcavator := PosExcavator  #> ExcMin <# ExcMax'Update desired pos to current pos, when exit this mode new pos will be held
          
          'MAX 1275    MIN 1040
          
          rightScrew(-getLY + getLX)
          leftScrew(getLY + getLX)   
          leftArm(0)
          rightArm(0)           

      


        
          


                                                             
      if getRightButton(BUTTON_DOWN) == 1 or getLeftButton(BUTTON_DOWN) == 1
           linAct(127)
           
           'pst.str(String("LinActUP"))    
          ' outa[debug1] := !outa[debug1]
      elseif getRightButton(BUTTON_UP) == 1 or getLeftButton(BUTTON_UP) == 1
           linAct(-127)               
          ' pst.str(String("LinActDOWN "))
           'outa[debug1] := !outa[debug1]
      if getRightButton(BUTTON_UP) == 0 and getRightButton(BUTTON_DOWN) == 0 and getLeftButton(BUTTON_UP) == 0 and getLeftButton(BUTTON_DOWN) == 0
           linAct(0)
          ' outa[debug1] := !outa[debug1]
           'outa[debug2]~
                               
      'checkForMacroButtons
      checkForModeButtons

      'Software E-Stop
      if getRightButton(10) == 1
         frontRightArmSpeed   := 0
         backRightArmSpeed := 0
         rightWheelSpeed := 0
         frontLeftArmSpeed    := 0
         backLeftArmSpeed := 0
         leftWheelSpeed  := 0
         excavatorSpeed  := 0
         linActSpeed     := 0     
         'may want to enable enableExc
         
         'E-Stop can only be disengaged with a re-enable button press
         repeat until getRightButton(6) == 1
                                               
    else
       frontRightArmSpeed     := 0
       backRightArmSpeed := 0
       rightWheelSpeed   := 0
       frontLeftArmSpeed      := 0
       backLeftArmSpeed := 0
       leftWheelSpeed    := 0
                                  
       linActSpeed       := 0
       'excavatorSpeed    := 0                        
       enableExc         := 1                        

PUB checkForModeButtons
  if getLeftButton(4) == 1        'Enable Active mode on Excavator
     DesPosExcavator      := PosExcavator
     PrevPos[IndExc]      := PosExcavator
     resetPosMsg[IndExc]  := 1
     p1serial.Tx(254-1)
     ErrorFlag[IndExc]    := 0
     ExcActiveModeEnabled := 1

     'dira[debug2]~~                           
     outa[debug2] := 1        
     'pst.str(String("EnableExc"))
      
     'waitcnt(clkfreq+cnt)
     
  elseif getLeftButton(2) == 1    'Disable Active mode on Excavator
     ExcActiveModeEnabled := 0

  elseif getLeftButton(5) == 1    'Enable Active mode on Legs
     DesPosLegRL           := PosLegRL
     DesPosLegRR           := PosLegRR
     DesPosLegFL           := PosLegFL
     DesPosLegFR           := PosLegFR
     ArmsActiveModeEnabled := 1
     errorRL               := 0
     errorRR               := 0

  elseif getLeftButton(3) == 1    'Disable Active mode on Legs
     ArmsActiveModeEnabled := 0
 {
PUB checkForMacroButtons
   
'POSITION OFFSETS
 {
    LEG CALIBRATION VALUES AT HORIZONTAL
    Current FL Position: 951
    Current RR Position: 958
    Current FR Position: 1086
    Current RL Position: 1099
  }           
  if getLeftButton(6)  == 1    'Go to horizontal position
    macroRunning := 1                                                 
    DesPosLegRL         := 1087  'Experimentally Determined
    DesPosLegRR         := 958
    'enableRightArms     := 1
    'enableLeftArms      := 1
    pst.str(String("Button 7"))

                
    'enableExc           := 1
  '    'Lock Legs
     'LockLegs
  elseif getLeftButton(7)  == 1
    LockLegs
        
  elseif getLeftButton(8)  == 1    'Setup for digging
    macroRunning := 1                                                 
    DesPosLegRL         := 1024  'Experimentally Determined
    DesPosLegRR         := 1024
    'enableRightArms     := 1
    'enableLeftArms      := 1       

    DesPosExcavator     := ExcDigPos
    'enableExc           := 1
    pst.str(String("Button 9"))
    
  elseif getLeftButton(9)  == 1    'Drive forward and penetrate   
    pst.str(String("Penetrate"))
'    Penetrate                   
    
  else                                                                   
    DesPosLegRL     := PosLegRL
    DesPosLegRR     := PosLegRR                                                               
    DesPosLegFL     := PosLegFL
    DesPosLegFR     := PosLegFR         
    enableRightArms := 0
    enableLeftArms  := 0
    enableFL        := 0
    enableFR        := 0
    enableRL        := 0
    enableRR        := 0
    'enableExc       := 1               
    macroRunning    := 0
    phase           := 0
    
        

{   
  if getLeftButton(10) == 1    'Setup for Traveling Loaded      
    
  if getLeftButton(11) == 1    'Deposit Setup    
 }

PUB Penetrate     

  if phase == 0
    macroRunning := 1                                                 
    DesPosLegRL         := 1024  'Experimentally Determined
    DesPosLegRR         := 1024
    enableRightArms     := 1
    enableLeftArms      := 1    
    DesPosExcavator     := ExcMin
    'enableExc           := 1

    if ||(DesPosLegRL-PosLegRL) < 3 and ||(DesPosLegRR-PosLegRR) < 3 and ||(DesPosExcavator-PosExcavator) < 3
      phase := phase + 1

  elseif phase == 1

    DesPosLegRL         := 1050  'Experimentally Determined
    DesPosLegRR         := 960
    enableRightArms     := 1
    enableLeftArms      := 1       

    DesPosExcavator     := (ExcMax+ExcMin)/2
    'enableExc           := 1

    if ||(DesPosLegRL-PosLegRL) < 3 and ||(DesPosLegRR-PosLegRR) < 3 and ||(DesPosExcavator-PosExcavator) < 3
      phase := phase + 1

  elseif phase == 2
    
    
                    
PUB LockLegs                                               
  
  'Make sure things don't do awry by setting desired positions to current positions first
  DesPosLegFL := PosLegFL
  DesPosLegFR := PosLegFR
  DesPosLegRL := PosLegRL
  DesPosLegRR := PosLegRR
  
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
    if phase == 0
       'Move the front two legs outward while rear legs do nothing, this should engage locks on the front
       if desiredPositionsSet == 0
          desiredPositionsSet := 1
          DesPosLegFL         := PosLegFL - 8
          DesPosLegFR         := PosLegFR + 8
          enableFL            := 1
          enableFR            := 1
           
       if PosLegFL =< DesPosLegFL + 2 and PosLegFL => DesPosLegFL - 2  
          enableFL := 0
          if PosLegFR =< DesPosLegFR + 2 and PosLegFR => DesPosLegFL - 2
             phase               := phase + 1      
             enableFR            := 0
             desiredPositionsSet := 0
                                                                                                    
    elseif phase == 1
       'Move the rear legs while front do nothing, this should engage locks in rear
       if desiredPositionsSet == 0
          desiredPositionsSet := 1
          DesPosLegRR         := PosLegRR - 8
          DesPosLegRL         := PosLegRL + 8
          enableRR            := 1
          enableRL            := 1
           
       if PosLegRR =< DesPosLegFL + 2 and PosLegRR => DesPosLegRR - 2  
          enableRR := 0
          if PosLegRL =< DesPosLegRL + 2 and PosLegRL => DesPosLegRL - 2
             phase               := phase + 1                    
             enableRL            := 0
             desiredPositionsSet := 0
             
    elseif phase == 2
      'Make legs on same side equivalent to one another
      }    
                           
PUB getLY : returnVal
    returnVal := inputPacket[BYTE_ly] - 127
    
PUB getRY : returnVal
    returnVal := inputPacket[BYTE_ry] - 127
    
PUB getLX : returnVal
    returnVal := inputPacket[BYTE_lx] - 127
    
PUB getRX : returnVal
    returnVal := inputPacket[BYTE_rx] - 127
    
PUB getLZ : returnVal
    returnVal := inputPacket[BYTE_lz] - 127
    
PUB getRZ : returnVal
    returnVal := inputPacket[BYTE_rz] - 127
    
PUB getRT : returnVal
  returnVal := inputPacket[BYTE_rthrottle]
  
PUB getLT : returnVal
  returnVal := inputPacket[BYTE_lthrottle]

PUB getRightButton(buttNum) : retval
    if buttnum < 8
      retVal := (inputPacket[BYTE_rjbuts1]>>(7-buttNum))//2
    else
      retVal := (inputPacket[BYTE_rjbuts2]>>(7-(buttnum-8)))//2
PUB getLeftButton(buttNum) : retval
    if buttnum < 8
      retVal := (inputPacket[BYTE_ljbuts1]>>(7-buttNum))//2
    else
      retVal := (inputPacket[BYTE_ljbuts2]>>(7-(buttnum-8)))//2       


PUB flarm(inspeed)
   'individual arms move out only
   inspeed := inspeed #> 0 <# 127
   frontLeftArmDir := 0
   frontLeftArmSpeed := inspeed
PUB blarm(inspeed)
   'individual arms move out only
   inspeed := inspeed #> 0 <# 127
   rearLeftArmDir := 0
   backLeftArmSpeed := inspeed
PUB frarm(inspeed)
   'individual arms move out only
   inspeed := inspeed #> 0 <# 127
   frontRightArmDir := 0
   frontRightArmSpeed := inspeed
PUB brarm(inspeed)
   'individual arms move out only
   inspeed := inspeed #> 0 <# 127
   rearRightArmDir := 0
   backRightArmSpeed := inspeed


PUB leftArm(inspeed)
  'positive is out
   inspeed := inspeed #> -127 <# 127
   if inspeed > 0
      frontLeftArmDir   := 0
      rearLeftArmDir    := 0
      frontLeftArmSpeed      := inspeed
      backLeftArmSpeed := inspeed
   else
      frontLeftArmDir   := 1
      rearLeftArmDir    := 1
      frontLeftArmSpeed      := -inspeed
      backLeftArmSpeed := -inspeed
      
PUB rightArm(inspeed)  
  'positive is out
   inspeed := inspeed #> -127 <# 127
   if inspeed > 0
      frontRightArmDir  := 0
      rearRightArmDir   := 0
      frontRightArmSpeed     := inspeed
      backRightArmSpeed := inspeed
   else
      frontRightArmDir  := 1
      rearRightArmDir   := 1
      frontRightArmSpeed     := -inspeed
      backRightArmSpeed  := -inspeed

PUB leftScrew(inspeed)
    'inspeed from -127 to 127
    'positive is clockwise as viewed from rear
    inspeed := inspeed #> -127 <# 127
    if inspeed > 0
      frontLeftWheelDir := 5
      rearLeftWheelDir  := 4
      leftWheelSpeed    := inspeed
    else
      frontLeftWheelDir := 4
      rearLeftWheelDir  := 5
      leftWheelSpeed    := -inspeed
      
PUB rightScrew(inspeed)
    'inspeed from -127 to 127
    'positive is clockwise as viewed from rear
    inspeed := inspeed #> -127 <# 127
    if inspeed > 0
      frontRightWheelDir := 5
      rearRightWheelDir  := 4
      rightWheelSpeed    := inspeed
    else
      frontRightWheelDir := 4
      rearRightWheelDir  := 5
      rightWheelSpeed    := -inspeed    

PUB linAct(inspeed)
    'positive is up (back)
    inspeed := inspeed #> -127 <# 127
    if inspeed > 0
        linActDir   := 4
        linActSpeed := inspeed
    else
        linActDir   := 5
        linActSpeed := -inspeed

PUB mainArm(inspeed)
    inspeed := inspeed #> -127 <# 127
    'positive is up (back)

    {pst.str(string("inspeed = "))
    pst.dec(inspeed)
    pst.Newline   }
    
    if inspeed > 0
      excavatorDir         := 1  
      invertedExcavatorDir := 0
      excavatorSpeed       := inspeed
    else
      excavatorDir         := 0  
      invertedExcavatorDir := 1
      excavatorSpeed       := -inspeed

PUB PotControl   |  Kp, error, deadzone   
  {
    Runs on independent cog, only actually does things if enables go high
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

  {
    LEG CALIBRATION VALUES
    Current FL Position: 951
    Current RR Position: 958
    Current FR Position: 1086
    Current RL Position: 1099
  }
  deadzone := 3
  Kp := 4     
  repeat
    'pst.str(String("PosExc: "))
    'pst.dec(PosExcavator)     
    'pst.NewLine
    
    if enableExc == 1
      if errorFlag[IndExc] == 0
        if ExcActiveModeEnabled == 1
          'inspeed := -getRY*getRT/255
           
          'Building in a deadzone of 20 'ticks' where actions doesn't need to be taken
          'Need to test if this deadzone is a good number      
          {  
          pst.str(String("PosExc - DesPosExc: "))
          pst.dec(PosExcavator)                         
          pst.str(String(" - "))
          pst.dec(PrevPos[IndExc])                    
          pst.str(String(" = "))
          pst.dec(PosExcavator - PrevPos[IndExc])         
          pst.NewLine    
          } 
          error := ||(PosExcavator - DesPosExcavator)    
          if PosExcavator < DesPosExcavator - 3       
             { pst.str(String("Exc Rotate up: "))    
              pst.dec((error)*Kp)                  
              pst.NewLine   }        
              mainArm((error)*Kp)
           
          elseif PosExcavator > DesPosExcavator + 3 
             { pst.str(String("Exc Rotate down: "))   
              pst.dec(-(error)*Kp)
              pst.NewLine   }  
              mainArm(-(error)*Kp)                        
          else
              mainArm(0)
              
          if PrevPosSet[IndExc] == 0
              PrevPos[IndExc]    := PosExcavator    
              PrevPosSet[IndExc] := 1
          else                                   
              if ||(PosExcavator-PrevPos[IndExc]) > 75
                  pst.dec(PosExcavator)
                  pst.str(String(" "))
                  pst.dec(PrevPos[IndExc])
                  pst.NewLine
                  
                  errorFlag[IndExc] := 1 
           '       p1serial.Tx(1)          
                  pst.str(String("Error Exc"))
                  pst.NewLine
              else
                  PrevPos[IndExc] := PosExcavator
        else
            mainArm(0)
      else                     
        'if resetPosMsg[IndExc] == 1 
        '    pst.dec(resetPosMsg[IndExc])
        '    pst.NewLine
        '    resetPosMsg[IndExc] := 0
            
            
        mainArm(0)
    
    'else
      'pst.str(String("Not enabled"))
      'pst.NewLine
    {pst.str(String("Current FL Position: "))
    pst.dec(PosLegFL)
    pst.NewLine}
    {
    if enableFL  == 1     

      if PosLegFL < DesPosLegFL - 100
          pst.str(String("FL Rotate in"))
          pst.NewLine
      elseif PosLegFL > DesPosLegFL + 100 
          pst.str(String("FL Rotate out"))
          pst.NewLine                      

{    pst.str(String("Current RR Position: "))
    pst.dec(PosLegRR)
    pst.NewLine
 }    
    if enableRR  == 1   
      if PosLegRR < DesPosLegRR - 100
          pst.str(String("RR Rotate in"))
          pst.NewLine
      elseif PosLegRR > DesPosLegRR + 100 
          pst.str(String("RR Rotate out"))
          pst.NewLine

{    pst.str(String("Current FR Position: "))
    pst.dec(PosLegFR)
    pst.NewLine
}
    if enableFR  == 1
      if PosLegFR < DesPosLegFR - 100
          pst.str(String("FR Rotate out"))
          pst.NewLine
      elseif PosLegFR > DesPosLegFR + 100 
          pst.str(String("FR Rotate in"))
          pst.NewLine
          
{    pst.str(String("Current RL Position: "))
    pst.dec(PosLegRL)
    pst.NewLine
}
    if enableRL  == 1      
     
      if PosLegRL < DesPosLegRL - 100
          pst.str(String("RL Rotate out"))
          pst.NewLine
      elseif PosLegRL > DesPosLegRL + 100 
          pst.str(String("RL Rotate in"))
          pst.NewLine


    }
    if enableRightArms == 1
      if errorRR == 0 and ArmsActiveModeEnabled == 1  
        pst.str(String("Current RR Position: "))
        pst.dec(PosLegRR)
        pst.NewLine                      
        error := ||(PosLegRR - DesPosLegRR)
        if PosLegRR < DesPosLegRR - 3
           rightArm(-error*Kp)
        elseif PosLegRR > DesPosLegRR + 3
           rightArm(error*Kp)
        else
           rightArm(0)
           
      else
        rightArm(0)
  '  else
{      pst.str(String("Disabled"))
      pst.NewLine
 }
    if enableLeftArms  == 1
      if errorRL == 0 and ArmsActiveModeEnabled == 1
        pst.str(String("Current RL Position: "))
        pst.dec(PosLegRL)
        pst.NewLine                    
        error := (PosLegRL - DesPosLegRL)
        if (||error)*Kp > deadzone
           ' |error| * Kp           127         
           ' ------------  *  --------------- * (|error|*Kp - deadzone) * -1
           '  error  * Kp      (127-deadzone) 
           leftArm(-((||error)*Kp*127*((||error)*Kp-deadzone))/(error*Kp*(127-deadzone)))          
        else
           leftArm(0)
           
      else
        leftArm(0)
                          
 '   waitcnt(clkfreq/10+cnt)
 '   pst.ClearHome

PUB updateADC | PrevExc, PrevFL, PrevFR, PrevRL, PrevRR, PrevsSet, counter
  {
    POSITION VARIABLES - Feedback from Pots
    long PosLegFL, PosLegFR, PosLegRL, PosLegRR
    long PosExcavator
    
    adcExc = 0
    adcFL  = 1
    adcFR  = 2
    adcRL  = 8
    adcRR  = 5
  }
  PrevsSet := 0
  ADC(adcExc)                        'INIT ADC, get first byte in
  repeat
    PosExcavator := ADC(adcFL )
    PosLegFL     := ADC(adcFR )
    PosLegFR     := ADC(adcRL )
    PosLegRL     := ADC(adcRR ) 
    PosLegRR     := ADC(adcExc)

    {
    if stableADCReading == 1
      if PrevsSet == 1
         if ||(PosExcavator-PrevExc) > 75
            if ErrorExc == 0
                p1serial.Tx(1)
            ErrorExc := 1
            pst.str(String("Error Exc"))
            pst.NewLine
         else
            PrevExc := PosExcavator
            'ErrorExc := 0       
                                                  
         if ||(PosLegFL-PrevFL)      > 75
            ErrorFL := 1
         else
            PrevFL := PosLegFL      
            'ErrorFL := 0       
            
         if ||(PosLegFR-PrevFR)      > 75
            ErrorFR := 1
         else
            PrevFR  := PosLegFR    
            'ErrorFR := 0       
            
         if ||(PosLegRL-PrevRL)      > 75
            ErrorRL := 1
         else
            PrevRL  := PosLegRL 
            'ErrorRL := 0       
            
         if ||(PosLegRR-PrevRR)      > 75
            ErrorRR := 1
         else
            PrevRR  := PosLegRR   
            'ErrorRR := 0        
      else                          
        PrevExc  := PosExcavator
        PrevFL   := PosLegFL
        PrevFR   := PosLegFR
        PrevRL   := PosLegRL
        PrevRR   := PosLegRR
        PrevsSet := 1
      } 
        

PUB ADC(NextChannel) : ADCbits | dataByte, i
  {
    Shift bits from last call out and read in the next called channel into buffer
  }
  dira[eoc..cs]:=%01101
  ADCbits:=0
  outa[clk]~
  outa[cs]~
  dataByte:=NextChannel<<8+%0000<<4
  waitpeq(|<eoc,|<eoc,0)
  repeat i from 11 to 0
    ADCbits:=(ADCbits<<1)+ina[Sin]
    outa[Sout]:=dataByte>>i
    outa[clk]~
    outa[clk]~~
    outa[clk]~
  outa[cs]~~

PUB motorDriverUpdater
  repeat
      'Right Arm Motors
      SendH(129, frontRightArmDir    , frontRightArmSpeed)
      SendH(130, rearRightArmDir     , backRightArmSpeed)

      'Right Screw Motors
      SendH(129, frontRightWheelDir  , rightWheelSpeed)
      SendH(130, rearRightWheelDir   , rightWheelSpeed)

      'Left Arm Motors
      SendH(131, frontLeftArmDir     , frontLeftArmSpeed)
      SendH(128, rearLeftArmDir      , backLeftArmSpeed)

      'Left Screw Motors
      SendH(131, frontLeftWheelDir   , leftWheelSpeed)
      SendH(128, rearLeftWheelDir    , leftWheelSpeed)

      'Excavator Axis Motors
      SendH(133, excavatorDir        , excavatorSpeed)
      SendH(134, invertedExcavatorDir, excavatorSpeed)
     { pst.str(String("excavatorSpeed: "))
      pst.dec(excavatorSpeed)
      pst.str(string("  isCon: "))
      pst.dec(isConnected)
      pst.NewLine     }

      'Linear Actuator Motor
      SendH(133, linActDir           , linActSpeed)

            
      waitcnt(clkfreq/100 + cnt)
PUB SendH(address,command,speed) | checksum
  checksum:=(address+command+speed) & %01111111         
  HbridgeFDS.tx(address)                                   'H-bridge address # (128-133)
  HbridgeFDS.tx(command)                                   'Motor B: 0=forward 1=backward ; Motor A: 4=forward 5=backward
  HbridgeFDS.tx(speed)                                     'Speed 0-127 0=stop (0% duty cycle), 127=max speed (100% duty cycle)
  HbridgeFDS.tx(checksum)                                  'If the H-bridge doesn't calculate the same checksum, then there was a transmission error and the command will be ignored

 