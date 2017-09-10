CON
  _xinfreq = 5_000_000 
  _clkmode = xtal1 + pll16x

  ConnectionPin =  0
  txPin         = 8                        'Pin to send 9600 baud asynchronous data to all H-bridges (via their S1 pins
 ' xBeeRx        = 10                        'Receive data from xBee's DOUT Pin
' xBeeTx        = -1                                    'Transmits data to xBee's DIN Pin 
  eoc           =  8                        'monitors the ADC chip's EOC state
  clk           =  9                        'outputs the SPI clock signal to the ADC chip
  Sout          = 10                        'sends serial data to the ADC chip
  Sin           = 11                        'receives serial data from the ADC chip
  cs            = 12                        'selects/deselects the ADC chip
  armOffset     = 25                        'Right arm is about 30 more than the left arm (potentiometer reading)
  maxSpeed      = 100
  maxSpeedLegs  = 80
  samples       =  5
                         'The pin the XBEE "Connected" pin is wired to

  'Commands
  MotorStop           = 50                  'Stops drilling, tube, and wheel motors

  ArmUp               = 1
  ArmDown             = 2   
  FwdDrive            = 3
  BackDrive           = 4
  StrafeRight         = 5
  StrafeLeft          = 6
  TurnRight           = 110
  TurnLeft            = 120
  Dig                 = 7
  Deposit             = 8

    
  TubeUp              = 9
  TubeDown            = 10      
  IncreaseWheelSpeed  = 13
  DecreaseWheelSpeed  = 14
  IncreaseTurnOffset  = 15
  DecreaseTurnOffset  = 16

  ResetArms           = 17   
      
  MakeRightTurnIndent = 19
  MakeLeftTurnIndent  = 20

  LeftArmUp           = 21
  LeftArmDown         = 22
  RightArmUp          = 23
  RightArmDown        = 24 

  WheelStop           = 25

  TubeUpFast = 26
  TubeDownFast = 27
  SetArmFast = 28
  SetArmSlow = 29

  'Constant Limits
  MaxArmPosition     = 4000
  MinArmPosition     = 300
  MaxTubePosition    = 3800'3300
  MinTubePosition    = 1300'100
  MaxWheelSpeed      = 127
  MinWheelSpeed      = 0
  MaxDrillSpeed      = 127

  'Constant Increments
  WheelSpeedIncrement      = 20
  ArmPositionIncrement     = 300
  TubePositionIncrement    = 250
  WheelTurnOffsetIncrement = 20
  ArmsHighPosition         = 3900
  ArmsLowPosition          = 500

  'Offset for the uneven left arm
  leftArmBackMotorSpeedOffset = 0

  led1 = 8 
  
OBJ
  pst         : "PST_Driver"
  HbridgeFDS  : "FullDuplexSerial"   'Motor control serial output
'  xbeeFDS     : "FullDuplexSerial"      

VAR
  'XBEE VARIABLES
 ' long xBeeCmd
 ' long xbeeconnected 'Does not move until it detects the xbee is connected

  'ARMS VARIABLES
  long leftArmSetPt, leftArmCurrentPos
  long leftArmSpeed, leftArmDirection1, leftArmDirection2

  long rightArmSetPt, rightArmCurrentPos
  long rightArmSpeed, rightArmDirection1, rightArmDirection2

  'WHEELS VARIABLES
  long rightWheelSpeed, rightWheelFrontDir, rightWheelBackDir
  long leftWheelSpeed , leftWheelFrontDir , leftWheelBackDir

  long wheelTurnOffset    ' When turning, the slower wheel moves at this speed

  'TUBE VARIABLES
  long tubeSetPt, tubeCurrentPos
  long tubeSpeed, tubeDirection

  'DRILL VARIABLES
  long drillDirection, drillSpeed
  
  long LArmStack[100], RArmStack[100], ADCStack[100],PSTStack[100], TubeStack[100] 
  
PUB Main     

  dira[ConnectionPin]~                                       'Set connection pin to be an input
  dira[led1] := 1

  '''''VARIABLE INITIALIZATION'''''
  leftArmSetPt    := 1200                                     'The initial position that the arm is set to hold
  rightArmSetPt   := 1200
  tubeSetPt       := 800
  
  drillSpeed      := 0
  rightWheelSpeed := 0
  leftWheelSpeed  := 0
  
'  xbeeconnected   := 0
              
'  xbeeFDS.start (xbeeRx, xbeeTx, 0, 9600)                                                                                                                  'Cog 1
  'coginit(2 , CommandInterface , @PSTStack)                                                                                            'Cog 2

'  repeat until xbeeconnected == 1
  
  HbridgeFDS.Start(-1,txPin,0,9600)                        'Start the Asynchronous Serial driver to talk to the H-Bridges        Cog 3 

  'coginit(4,ADCread, @ADCStack)                            'Read values from ADC                                                 Cog 4

  waitcnt(clkfreq/5+cnt)
  
  'coginit(5, LeftArmControl  , @LArmStack)                        'PI control for left arm                                       Cog 5
  'coginit(6, RightArmControl , @RArmStack)
  'coginit(7, TubeControl     , @TubeStack)                                                                                    'Cog 6
  
  waitcnt(clkfreq+cnt)
  
  '-----------------------------------------------------------------------------------------------------------------
  ' Address correspond to the Hbride you want to talk to. The addresses (128 - 133) are set by the switches on the Hbridge.
  ' 128 = Right Arm, 129 = Left Arm, 130 = Right Wheel, 131 = Left Wheel, 132 = Tube Rotation, 133 = Auger Drilling

  ' Commands control which motor you are turning on and its direction
  ' 0 = Drive forward motor 1 (Front)
  ' 1 = Drive backwards motor 1 (Back)
  ' 4 = Drive forward motor 2 (Front)
  ' 5 = Drive backwards motor 2 (Back)

  ' Speed dictates how fast you want the motor to run. Range is from 0 - 127 for off to full forward/backward
  ' Note that is a command of 0 is given, Sabertooth goes into power save mode after 4 seconds
  '------------------------------------------------------------------------------------------------------------------
  dira[16]~~

  repeat
        !outa[led1]  
        waitcnt(clkfreq + cnt)
        
  repeat
                                                               'Send command and speed to specified H-bridge address
    SendH(128 , 0 , 100   )                 'Front Right Arm
    SendH(128 , 5 , 100   )                 'Back Right Arm    
    SendH(129 , 0  , 100    )                 'Front Left Arm
    SendH(129 , 5  , 100 - leftArmBackMotorSpeedOffset)    
    if ina[ConnectionPin] == 1
      outa[16] := 0
      SendH(130 , rightWheelFrontDir , 0  )                 'Front Right Wheel
      SendH(130 , rightWheelBackDir  , 0  )                 'Back Right Wheel
      SendH(131 , leftWheelFrontDir  , 0  )                 'Front Left Wheel
      SendH(131 , leftWheelBackDir   , 0  )                 'Back Left Wheel
      SendH(132 , tubeDirection      , 0  )
      SendH(133 , drillDirection     , 0  )      
    else
      outa[16] := 1
      SendH(133 , 4 , 127 )                 'Front Right Wheel
      SendH(133 , 1  , 127 )                 'Back Right Wheel

                       


PUB LeftArmControl   |  Kp, error, buffer

  Kp := 10
  leftArmSpeed:=0
  
  repeat
    error:= leftArmSetPt - leftArmCurrentPos 'Calculating error (Desired minus ADC reading)

    buffer := ||((0-leftArmSetPt/18) + 311)
    
    if || error < 150
      leftArmSpeed := 0
      next    
      
    if error =< 0                'if the left arm is above the set point
      leftArmDirection1 := 0          'Setting direction (Arm moving up)
      leftArmDirection2 := 4
      Kp := 10
         
    else                         'if the left arm is below the set point
      leftArmDirection1 := 1          'Setting direction (Arm moving down)
      leftArmDirection2 := 5
      Kp := 25 
                                                       
    leftArmSpeed:=(||error)*Kp/100 #>25 <#maxSpeedLegs    'sets the P value to the product of the error and the proportional gain

PUB RightArmControl   |  Kp, error

  Kp := 10
  rightArmSpeed:=0
  
  repeat
    error:= rightArmSetPt - rightArmCurrentPos 'Calculating error (Desired minus ADC reading)
    
    if || error < 150
      rightArmSpeed := 0
      next    
      
    if error =< 0                'if the left arm is above the set point
      rightArmDirection1 := 1          'Setting direction (Arm moving up)
      rightArmDirection2 := 5
      Kp := 7
         
    else                         'if the left arm is below the set point
      rightArmDirection1 := 0          'Setting direction (Arm moving down)
      rightArmDirection2 := 4
      Kp := 21  
                                                       
    rightArmSpeed:=(||error)*Kp/100 #>25 <#maxSpeedLegs    'sets the P value to the product of the error and the proportional gain

PUB TubeControl   |  Kp, error

  Kp := 10
  tubeSpeed:=0
  
  repeat
    error:= tubeSetPt - tubeCurrentPos 'Calculating error (Desired minus ADC reading)
    
    if (|| error) < 100
      tubeSpeed := 0
      next    
      
    if error < 0                'if the left arm is above the set point
      tubeDirection := 0          'Setting direction (Arm moving up)
      Kp := 30
         
    else                         'if the left arm is below the set point
      tubeDirection := 1          'Setting direction (Arm moving down)
      Kp := 7  
                                                       
    tubeSpeed:=(||error)*Kp/100 #>25 <#maxSpeed    'sets the P value to the product of the error and the proportional gain
    
PUB CommandInterface  | input , wheelSpeed, input2 , turning, armSpeed
  pst.start
  turning := 0
  tubeSetPt     := 3000
  waitcnt(clkfreq+cnt)
  leftArmSetPt  := 1000
  rightArmSetPt := 1000 

'  input := xbeeFDS.Rx
'  input2 := xbeeFDS.Rx

  armSpeed := 60

    
'  xbeeconnected   := 1
  wheelSpeed      := 127
  wheelTurnOffset := 0
  drillSpeed      := 0
             
  repeat


    if turning == 0
      leftWheelSpeed := wheelSpeed
      rightWheelSpeed := wheelSpeed
    if turning == 1
      leftWheelSpeed := wheelTurnOffset
      rightWheelSpeed := wheelSpeed
    if turning == 2
      rightWheelSpeed := wheelTurnOffset
      leftWheelSpeed := wheelSpeed
      
                                               
'    input := xbeeFDS.rx    
'    input2 := xbeeFDS.rx

    pst.str(String(" input1: "))
    pst.dec(leftWheelSpeed)
    pst.newline

    
    case input
      TurnRight:
        turning := 2     
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelTurnOffset
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed                            
        
      TurnLeft:
        turning := 1       
        rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed                            
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 5 
        leftWheelSpeed     := wheelTurnOffset                          

      MakeRightTurnIndent:
        rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelTurnOffset
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed
        
      MakeLeftTurnIndent:
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed                            
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 5 
        leftWheelSpeed     := wheelTurnOffset                                                         
        
      StrafeRight:
        turning := 0                                                                                   
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

      StrafeLeft:
        turning := 0                                                                                    
        rightWheelFrontDir := 1                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed 
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 5        
        leftWheelSpeed     := wheelSpeed

      FwdDrive:
        turning := 0                                                                                      
        rightWheelFrontDir := 1                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 4        
        leftWheelSpeed     := wheelSpeed

      BackDrive:
        turning := 0                                                                                     
        rightWheelFrontDir := 0                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 5        
        leftWheelSpeed     := wheelSpeed

      IncreaseWheelSpeed:
        wheelSpeed         := input2 #>MinWheelSpeed <#MaxWheelSpeed              'wheelSpeed + WheelSpeedIncrement           #>MinWheelSpeed <#MaxWheelSpeed

      DecreaseWheelSpeed:
        wheelSpeed         := wheelSpeed - WheelSpeedIncrement           #>MinWheelSpeed <#MaxWheelSpeed

      IncreaseTurnOffset:
        wheelTurnOffset    := wheelTurnOffset + WheelTurnOffsetIncrement #>MinWheelSpeed <#MaxWheelSpeed

      DecreaseTurnOffset:
        wheelTurnOffset    := wheelTurnOffset - WheelTurnOffsetIncrement #>MinWheelSpeed <#MaxWheelSpeed
    
      TubeUp:                                   
        'tubeSetPt          := tubeSetPt + TubePositionIncrement #>MinTubePosition <#MaxTubePosition
        if tubeSpeed == 0
          tubeSpeed := 40
          tubeDirection := 5
        else
         tubeSpeed := 0
         tubeDirection := 5 
      TubeDown:
        'tubeSetPt          := tubeSetPt - TubePositionIncrement #>MinTubePosition <#MaxTubePosition
        if tubeSpeed == 0
          tubeSpeed := 40
          tubeDirection := 4
        else
          tubeSpeed := 0
          tubeDirection := 4
      TubeUpFast:
        if tubeSpeed == 0
          tubeSpeed := 100
          tubeDirection := 5
        else
         tubeSpeed := 0
         tubeDirection := 5
      TubeDownFast:
        if tubeSpeed == 0
          tubeSpeed := 100
          tubeDirection := 4
        else
          tubeSpeed := 0
          tubeDirection := 4
      Dig:
        if drillSpeed == 0                                 
          drillDirection := 1
          drillSpeed     := MaxDrillSpeed
        else
          drillDirection := 1
          drillSpeed := 0
      Deposit:
        if drillSpeed == 0                             
          drillDirection := 0
          drillSpeed     := MaxDrillSpeed
        else
          drillDirection := 0
          drillSpeed := 0
      ResetArms:
        rightArmSetPt      := 1500
        leftArmSetPt       := 1500
                
      ArmUp:                                                  
        'leftArmSetPt  := leftArmSetPt  + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        'rightArmSetPt := rightArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        'if leftArmSpeed == 0 & rightArmSpeed == 0
          leftArmDirection1 := 1
          leftArmDirection2 := 4
          rightArmDirection1 := 1
          rightArmDirection2 := 4
          leftArmSpeed := armSpeed  'change to wheelSpeed later
          rightArmSpeed := armSpeed 'change to wheelSpeed later
        'else
         ' leftArmSpeed := 0
         ' rightArmSpeed := 0
      ArmDown:
        'leftArmSetPt  := leftArmSetPt  - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        'rightArmSetPt := rightArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
       ' if leftArmSpeed == 0 & rightArmSpeed == 0
          leftArmDirection1 := 0
          leftArmDirection2 := 5
          rightArmDirection1 := 0
          rightArmDirection2 := 5
          leftArmSpeed := armSpeed  'change to wheelSpeed later
          rightArmSpeed := armSpeed 'change to wheelSpeed later
        'else
         ' leftArmSpeed := 0
          'rightArmSpeed := 0

      LeftArmUp:
        'LeftArmSetPt := LeftArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        if leftArmSpeed == 0
          leftArmDirection1 := 1
          leftArmDirection2 := 4
          leftArmSpeed := armSpeed  'change to wheelSpeed later
          

          leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
          leftWheelBackDir   := 4 
          wheelSpeed     := armSpeed/3
          turning := 2
        else
          leftArmSpeed := 0
          wheelSpeed := 0
          
      LeftArmDown:
        'LeftArmSetPt := LeftArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        if leftArmSpeed == 0
          leftArmDirection1 := 0
          leftArmDirection2 := 5
          leftArmSpeed := armSpeed  'change to wheelSpeed later

          leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
          leftWheelBackDir   := 5 
          wheelSpeed     := armSpeed/3
          turning := 2
        else
          leftArmSpeed := 0
          wheelSpeed := 0
          
      RightArmUp:
        'RightArmSetPt := RightArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        if rightArmSpeed == 0
          rightArmDirection1 := 1
          rightArmDirection2 := 4
          rightArmSpeed := armSpeed 'change to wheelSpeed later

          rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
          rightWheelBackDir  := 5 
          wheelSpeed    := armSpeed/3
          turning := 1 
        else
          rightArmSpeed := 0
          wheelSpeed := 0
          
      RightArmDown:
        'RightArmSetPt := RightArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        if rightArmSpeed == 0
          rightArmDirection1 := 0
          rightArmDirection2 := 5
          rightArmSpeed := armSpeed 'change to wheelSpeed later

          rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
          rightWheelBackDir  := 4 
          wheelSpeed    := armSpeed/3
          turning := 1      
        else
          rightArmSpeed := 0
          wheelSpeed := 0

      SetArmFast:
        armSpeed := 120
      SetArmSlow:
        armSpeed := 60
      {
      ArmsHighUp:
        leftArmSetPt  := ArmsHighPosition
        rightArmSetPt := ArmsHighPosition

      ArmsLowDown:
        leftArmSetPt  := ArmsLowPosition
        rightArmSetPt := ArmsLowPosition
      }

      WheelStop:
        rightWheelSpeed := 0
        leftWheelSpeed  := 0
        turning := 0
        wheelSpeed := 0
      

      MotorStop:
        rightWheelSpeed := 0
        leftWheelSpeed  := 0
        wheelSpeed := 0
        drillSpeed      := 0
        tubeSpeed := 0
        leftArmSpeed := 0
        rightArmSpeed := 0

      

     

''''''''''''''''''''''''''''''''''''''''''''''''
'The below code is almost guaranteed to not be the issue
''''''''''''''''''''''''''''''''''''''''''''''''     
    
PUB SendH(address,command,speed) | checksum
  checksum:=(address+command+speed) & %01111111         
  HbridgeFDS.tx(address)                                   'H-bridge address # (128-133)
  HbridgeFDS.tx(command)                                   'Motor B: 0=forward 1=backward ; Motor A: 4=forward 5=backward
  HbridgeFDS.tx(speed)                                     'Speed 0-127 0=stop (0% duty cycle), 127=max speed (100% duty cycle)
  HbridgeFDS.tx(checksum)                                  'If the H-bridge doesn't calculate the same checksum, then there was a transmission error and the command will be ignored
 
PUB ADCread  | leftAngleData,rightAngleData,tubeAngleData
  dira[eoc..cs]:=%01101
  ADC(2)                                    'Get ready to read the leftArmPosition
  repeat                           
    leftAngleData~
    rightAngleData~
    tubeAngleData~
    
    repeat samples                                                                                            
      leftAngleData  := leftAngleData  + ADC(1)          'Read left arm and get ready to read right arm
      rightAngleData := rightAngleData + ADC(0)          'Read right arm and get ready to read tube
      tubeAngleData  := tubeAngleData  + ADC(2)          'Read tube and get ready to read left arm
                        
    leftArmCurrentPos  := leftAngleData  / samples
    rightArmCurrentPos := rightAngleData / samples
    tubeCurrentPos     := tubeAngleData  / samples
    
PUB ADC(NextChannel) : ADCbits | dataByte, i 'Read current ADC channel value & set the channel for the next conversion
  dira[eoc..cs]:=%01101              'Set I/O pin direction register (Hint: In case this is used on a separate cog!-)  
  ADCbits~                           'Initialize ADCbits to zero
  outa[clk]~                         'Set the clock pin Low
  outa[cs]~                          'Set the chip select pin Low
  dataByte:=NextChannel<<8+%0000<<4  'Setup the 12-bit control value to send to the ADC chip
  waitpeq(|<eoc,|<eoc,0)             'Wait for eco pin to indicate the end of the previous conversion
  repeat i from 11 to 0
    ADCbits:=(ADCbits<<1)+ina[Sin]   'Shift previous data bits to left & add Sin pin's current state from ADC
    outa[Sout]:=dataByte>>i          'Send the ith bit out across the Sout line
    outa[clk]~                       'Set the clock pin Low                                                                   
    outa[clk]~~                      'Set the clock pin High (data is transferred across SPI)                                 
    outa[clk]~                       'Set the clock pin Low                                                                   
  outa[cs]~~                         'Set the chip select pin High 