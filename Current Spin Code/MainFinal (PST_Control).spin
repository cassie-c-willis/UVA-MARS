CON
  _xinfreq = 5_000_000 
  _clkmode = xtal1 + pll16x

  ConnectionPin =  0
  txPin         = 15                        'Pin to send 9600 baud asynchronous data to all H-bridges (via their S1 pins
  xBeeRx        = 17                        'Receive data from xBee's DOUT Pin
  xBeeTx        = 18                        'Transmits data to xBee's DIN Pin 
  eoc           =  8                        'monitors the ADC chip's EOC state
  clk           =  9                        'outputs the SPI clock signal to the ADC chip
  Sout          = 10                        'sends serial data to the ADC chip
  Sin           = 11                        'receives serial data from the ADC chip
  cs            = 12                        'selects/deselects the ADC chip
  armOffset     = 25                        'Right arm is about 30 more than the left arm (potentiometer reading)
  maxSpeed      = 75
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
  TurnRight           = 7
  TurnLeft            = 8
  Dig                 = 9
  Deposit             = 10

    
  TubeUp              = 11
  TubeDown            = 12      
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



  'Constant Limits
  MaxArmPosition     = 4000
  MinArmPosition     = 300
  MaxTubePosition    = 3300
  MinTubePosition    = 100
  MaxWheelSpeed      = 127
  MinWheelSpeed      = 25
  MaxDrillSpeed      = 127

  'Constant Increments
  WheelSpeedIncrement      = 20
  ArmPositionIncrement     = 300
  TubePositionIncrement    = 250
  WheelTurnOffsetIncrement = 20
  ArmsHighPosition         = 3900
  ArmsLowPosition          = 500

  'Offset for the uneven left arm
  leftArmBackMotorSpeedOffset = 5   
  
OBJ
  pst         : "PST_Driver"
  HbridgeFDS  : "FullDuplexSerial"   'Motor control serial output
  xbeeFDS     : "FullDuplexSerial"      

VAR
  'XBEE VARIABLES
  long xBeeCmd
  long xbeeconnected 'Does not move until it detects the xbee is connected
  long input 'For PST input

  'ARMS VARIABLES
  long leftArmSetPt, leftArmCurrentPos
  long leftArmSpeed, leftArmDirection1, leftArmDirection2

  long rightArmSetPt, rightArmCurrentPos
  long rightArmSpeed, rightArmDirection1, rightArmDirection2

  'WHEELS VARIABLES
  long rightWheelSpeed, rightWheelFrontDir, rightWheelBackDir
  long leftWheelSpeed , leftWheelFrontDir , leftWheelBackDir

  long wheelTurnOffset    ' When turning, the slower wheel moves at this speed

  long wheelSpeed 'Speed of wheels

  'TUBE VARIABLES
  long tubeSetPt, tubeCurrentPos
  long tubeSpeed, tubeDirection

  'DRILL VARIABLES
  long drillDirection, drillSpeed
  
  long LArmStack[100], RArmStack[100], ADCStack[100],PSTStack[100], TubeStack[100] 
  
PUB Main

  dira[ConnectionPin]~                                       'Set connection pin to be an input

  '''''VARIABLE INITIALIZATION'''''
  leftArmSetPt    := 872                                     'The initial position that the arm is set to hold
  rightArmSetPt   := 872
  tubeSetPt       := 1000
  
  drillSpeed      := 0
  rightWheelSpeed := 0
  leftWheelSpeed  := 0
  wheelSpeed      := 0
  
  xbeeconnected   := 0
  input           := 0
              
  'xbeeFDS.start (xbeeRx, xbeeTx, 0, 9600)                                                                                                                  'Cog 1
  'coginit(2 , CommandInterface , @PSTStack)                                                                                            'Cog 2
  pst.start
  'repeat until xbeeconnected == 1
  
  HbridgeFDS.Start(-1,txPin,0,9600)                        'Start the Asynchronous Serial driver to talk to the H-Bridges        Cog 3 

  coginit(4,ADCread, @ADCStack)                            'Read values from ADC                                                 Cog 4

  waitcnt(clkfreq/5+cnt)
  
  coginit(5, LeftArmControl  , @LArmStack)                        'PI control for left arm                                       Cog 5
  coginit(6, RightArmControl , @RArmStack)
  coginit(7, TubeControl     , @TubeStack)                                                                                    'Cog 6
  
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
  tubeSetPt     := 1000
  waitcnt(clkfreq+cnt)
  leftArmSetPt  := 1500
  rightArmSetPt := 1500

  input := 0  
  xbeeconnected   := 1
  wheelSpeed      := 25
  wheelTurnOffset := 0
  drillSpeed      := 0

  pst.str(String("Right Arm Pos: "))
  pst.dec(rightArmCurrentPos)
  pst.NewLine
  pst.str(String("Left Arm Pos: "))
  pst.dec(leftArmCurrentPos)
  pst.NewLine
   
  pst.str(String("Right Arm Set Pos: "))
  pst.dec(rightArmSetPt)
  pst.NewLine
  pst.str(String("Left Arm Set Pos: "))
  pst.dec(leftArmSetPt)
  pst.NewLine
             
  repeat                                              
    input := pst.RxTime(100)
     
    pst.str(String("Right Arm Pos: "))
    pst.dec(rightArmCurrentPos)
    pst.NewLine
    pst.str(String("Left Arm Pos: "))
    pst.dec(leftArmCurrentPos)
    pst.NewLine
    
    pst.str(String("Right Arm Set Pos: "))
    pst.dec(rightArmSetPt)
    pst.NewLine
    pst.str(String("Left Arm Set Pos: "))
    pst.dec(leftArmSetPt)
    pst.NewLine
        
    case input
      0:       
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelTurnOffset
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Turning Right"))
        pst.NewLine                          
        
      1:       
        rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed                            
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 5 
        leftWheelSpeed     := wheelTurnOffset

        pst.str(String("Turning Left"))
        pst.NewLine                           
                           
      2:
        rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelTurnOffset
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Making Right Indent"))
        pst.NewLine         
        
      3:
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed                            
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 5 
        leftWheelSpeed     := wheelTurnOffset

        pst.str(String("Making Left Indent"))
        pst.NewLine                                                                  
        
      4:                                                                                    
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Strafing Right"))
        pst.NewLine          

      5:                                                                                    
        rightWheelFrontDir := 1                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed 
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 5        
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Strafing Left"))
        pst.NewLine  

      6:                                                                                      
        rightWheelFrontDir := 1                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 4        
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Driving Fwd"))
        pst.NewLine          

      7:                                                                                     
        rightWheelFrontDir := 0                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 5        
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Driving Back"))
        pst.NewLine          

      8:
        wheelSpeed         := wheelSpeed + WheelSpeedIncrement           #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Increase Wheel Speed"))
        pst.NewLine  

      9:
        wheelSpeed         := wheelSpeed - WheelSpeedIncrement           #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Decrease Wheek Speed"))
        pst.NewLine          

      10:
        wheelTurnOffset    := wheelTurnOffset + WheelTurnOffsetIncrement #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Increase Turning Offset"))
        pst.NewLine  

      11:
        wheelTurnOffset    := wheelTurnOffset - WheelTurnOffsetIncrement #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Decrease Turning Offset"))
        pst.NewLine 
    
      12:                                   
        tubeSetPt          := tubeSetPt + TubePositionIncrement #>MinTubePosition <#MaxTubePosition

        pst.str(String("Tube Up"))
        pst.NewLine 

      13:
        tubeSetPt          := tubeSetPt - TubePositionIncrement #>MinTubePosition <#MaxTubePosition

        pst.str(String("Tube Down"))
        pst.NewLine

      14:                                 
        drillDirection := 1
        drillSpeed     := MaxDrillSpeed

        pst.str(String("Digging"))
        pst.NewLine

      15:                             
        drillDirection := 0
        drillSpeed     := MaxDrillSpeed

        pst.str(String("Emptying"))
        pst.NewLine
      
      16:
        rightArmSetPt      := 1500
        leftArmSetPt       := 1500

        pst.str(String("Arm positions reset"))
        pst.NewLine
                
      17:                                                  
        leftArmSetPt  := leftArmSetPt  + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        rightArmSetPt := rightArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Raising Both Arms"))
        pst.NewLine


      18:
        leftArmSetPt  := leftArmSetPt  - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        rightArmSetPt := rightArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Lowering Both Arms"))
        pst.NewLine


      19:
        LeftArmSetPt := LeftArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Raising Left Arm"))
        pst.NewLine


      20:
        LeftArmSetPt := LeftArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Lowering Left Arm"))
        pst.NewLine


      21:
        RightArmSetPt := RightArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Raising Right Arm"))
        pst.NewLine

      22:
        RightArmSetPt := RightArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Lowering Right Arm"))
        pst.NewLine

      

      {
      ArmsHighUp:
        leftArmSetPt  := ArmsHighPosition
        rightArmSetPt := ArmsHighPosition

      ArmsLowDown:
        leftArmSetPt  := ArmsLowPosition
        rightArmSetPt := ArmsLowPosition
      }

      MotorStop:
        rightWheelSpeed := 0
        leftWheelSpeed  := 0
        drillSpeed      := 0
        tubeSetPt       := tubeCurrentPos


    pst.str(String("CNT Value: "))
    pst.dec(cnt)
    pst.NewLine    
     
    pst.str(String("Right Arm Pos: "))
    pst.dec(rightArmCurrentPos)
    pst.NewLine
    pst.str(String("Left Arm Pos: "))
    pst.dec(leftArmCurrentPos)
    pst.NewLine
     
    pst.str(String("Right Arm Set Pos: "))
    pst.dec(rightArmSetPt)
    pst.NewLine
    pst.str(String("Left Arm Set Pos: "))
    pst.dec(leftArmSetPt)
    pst.NewLine           
    
                                                                'Send command and speed to specified H-bridge address
    SendH(128 , rightArmDirection1 , rightArmSpeed   )                 'Front Right Arm
    SendH(128 , rightArmDirection2 , rightArmSpeed   )                 'Back Right Arm    
    SendH(129 , leftArmDirection1  , leftArmSpeed    )                 'Front Left Arm
    SendH(129 , leftArmDirection2  , leftArmSpeed - leftArmBackMotorSpeedOffset)    
    if ina[ConnectionPin] == 1
      SendH(130 , rightWheelFrontDir , 0  )                 'Front Right Wheel
      SendH(130 , rightWheelBackDir  , 0  )                 'Back Right Wheel
      SendH(131 , leftWheelFrontDir  , 0  )                 'Front Left Wheel
      SendH(131 , leftWheelBackDir   , 0  )                 'Back Left Wheel
      SendH(132 , tubeDirection      , 0  )
      SendH(133 , drillDirection     , 0  )      
    else
      SendH(130 , rightWheelFrontDir , rightWheelSpeed )                 'Front Right Wheel
      SendH(130 , rightWheelBackDir  , rightWheelSpeed )                 'Back Right Wheel
      SendH(131 , leftWheelFrontDir  , leftWheelSpeed  )                 'Front Left Wheel
      SendH(131 , leftWheelBackDir   , leftWheelSpeed  )                 'Back Left Wheel
      SendH(132 , tubeDirection      , tubeSpeed       )
      SendH(133 , drillDirection     , drillSpeed      )
                       


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
                                                       
    leftArmSpeed:=(||error)*Kp/100 #>25 <#maxSpeed    'sets the P value to the product of the error and the proportional gain

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
                                                       
    rightArmSpeed:=(||error)*Kp/100 #>25 <#maxSpeed    'sets the P value to the product of the error and the proportional gain

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
      Kp := 7
         
    else                         'if the left arm is below the set point
      tubeDirection := 1          'Setting direction (Arm moving down)
      Kp := 15  
                                                       
    tubeSpeed:=(||error)*Kp/100 #>25 <#maxSpeed    'sets the P value to the product of the error and the proportional gain
    
{PUB CommandInterface  | input , wheelSpeed

  tubeSetPt     := 2300
  waitcnt(clkfreq+cnt)
  leftArmSetPt  := 300
  rightArmSetPt := 300 

  input := 0  
  xbeeconnected   := 1
  wheelSpeed      := 25
  wheelTurnOffset := 0
  drillSpeed      := 0
             
  repeat                                              
    input := pst.DecIn    
    
    case input
      0:       
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelTurnOffset
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Turning Right"))
        pst.NewLine                          
        
      1:       
        rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed                            
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 5 
        leftWheelSpeed     := wheelTurnOffset

        pst.str(String("Turning Left"))
        pst.NewLine                           
                           
      2:
        rightWheelFrontDir := 1                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelTurnOffset
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Making Right Indent"))
        pst.NewLine         
        
      3:
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed                            
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 5 
        leftWheelSpeed     := wheelTurnOffset

        pst.str(String("Making Left Indent"))
        pst.NewLine                                                                  
        
      4:                                                                                    
        rightWheelFrontDir := 0                                        'Right Wheel spinning clockwise (i.e motors spinning forwards)=
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning clockwise (i.e motors spinning forwards)
        leftWheelBackDir   := 4 
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Strafing Right"))
        pst.NewLine          

      5:                                                                                    
        rightWheelFrontDir := 1                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed 
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 5        
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Strafing Left"))
        pst.NewLine  

      6:                                                                                      
        rightWheelFrontDir := 1                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 5 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 0                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 4        
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Driving Fwd"))
        pst.NewLine          

      7:                                                                                     
        rightWheelFrontDir := 0                                        'Right Wheel spinning counterclockwise (i.e motors spinning backwards)
        rightWheelBackDir  := 4 
        rightWheelSpeed    := wheelSpeed
       
        leftWheelFrontDir  := 1                                        'Left Wheel spinning counterclockwise (i.e motors spinning backwards) 
        leftWheelBackDir   := 5        
        leftWheelSpeed     := wheelSpeed

        pst.str(String("Driving Back"))
        pst.NewLine          

      8:
        wheelSpeed         := wheelSpeed + WheelSpeedIncrement           #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Increase Wheel Speed"))
        pst.NewLine  

      9:
        wheelSpeed         := wheelSpeed - WheelSpeedIncrement           #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Decrease Wheek Speed"))
        pst.NewLine          

      10:
        wheelTurnOffset    := wheelTurnOffset + WheelTurnOffsetIncrement #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Increase Turning Offset"))
        pst.NewLine  

      11:
        wheelTurnOffset    := wheelTurnOffset - WheelTurnOffsetIncrement #>MinWheelSpeed <#MaxWheelSpeed

        pst.str(String("Decrease Turning Offset"))
        pst.NewLine 
    
      12:                                   
        tubeSetPt          := tubeSetPt + TubePositionIncrement #>MinTubePosition <#MaxTubePosition

        pst.str(String("Tube Up"))
        pst.NewLine 

      13:
        tubeSetPt          := tubeSetPt - TubePositionIncrement #>MinTubePosition <#MaxTubePosition

        pst.str(String("Tube Down"))
        pst.NewLine

      14:                                 
        drillDirection := 1
        drillSpeed     := MaxDrillSpeed

        pst.str(String("Digging"))
        pst.NewLine

      15:                             
        drillDirection := 0
        drillSpeed     := MaxDrillSpeed

        pst.str(String("Emptying"))
        pst.NewLine
      
      16:
        rightArmSetPt      := 1500
        leftArmSetPt       := 1500

        pst.str(String("Arm positions reset"))
        pst.NewLine
                
      17:                                                  
        leftArmSetPt  := leftArmSetPt  + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        rightArmSetPt := rightArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Raising Both Arms"))
        pst.NewLine

      18:
        leftArmSetPt  := leftArmSetPt  - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition
        rightArmSetPt := rightArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Lowering Both Arms"))
        pst.NewLine

      19:
        LeftArmSetPt := LeftArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Raising Left Arm"))
        pst.NewLine

      20:
        LeftArmSetPt := LeftArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Lowering Left Arm"))
        pst.NewLine

      21:
        RightArmSetPt := RightArmSetPt + ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Raising Right Arm"))
        pst.NewLine

      22:
        RightArmSetPt := RightArmSetPt - ArmPositionIncrement #>MinArmPosition <#MaxArmPosition

        pst.str(String("Lowering Right Arm"))
        pst.NewLine      

      {
      ArmsHighUp:
        leftArmSetPt  := ArmsHighPosition
        rightArmSetPt := ArmsHighPosition

      ArmsLowDown:
        leftArmSetPt  := ArmsLowPosition
        rightArmSetPt := ArmsLowPosition
      }

      MotorStop:
        rightWheelSpeed := 0
        leftWheelSpeed  := 0
        drillSpeed      := 0
        tubeSetPt       := tubeCurrentPos

      
 }
     

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
