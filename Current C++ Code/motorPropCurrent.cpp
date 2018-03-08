//
// automatically generated by spin2cpp v3.6.4 on Thu Mar  8 17:11:55 2018
// /home/volsungasaga/Downloads/spin2cpp/build/spin2cpp --gas --side motorPropCurrent.spin 
//

#include <stdlib.h>
#include <propeller.h>
#undef clkset
#undef cogid
#undef cogstop
#undef locknew
#undef lockret
#undef lockclr
#undef lockset
#undef waitcnt
#undef waitpeq
#undef waitpne
#define _waitcnt(x) __builtin_propeller_waitcnt((x), 0)
#include "motorPropCurrent.h"

#define INLINE__ static inline
#define Yield__() __asm__ volatile( "" ::: "memory" )
INLINE__ int32_t Min__(int32_t a, int32_t b) { return a < b ? a : b; }
INLINE__ int32_t Max__(int32_t a, int32_t b) { return a > b ? a : b; }
INLINE__ int32_t Shr__(uint32_t a, uint32_t b) { return (a>>b); }
typedef void (*Cogfunc__)(void *a, void *b, void *c, void *d);
static void Cogstub__(void *argp) {
  void **arg = (void **)argp;
  Cogfunc__ func = (Cogfunc__)(arg[0]);
  func(arg[1], arg[2], arg[3], arg[4]);
}
__asm__(".global _cogstart\n"); // force clone_cog to link if it is present
extern "C" void _clone_cog(void *tmp) __attribute__((weak));
extern "C" long _load_start_kernel[] __attribute__((weak));
static int32_t Coginit__(int cogid, void *stackbase, size_t stacksize, void *func, int32_t arg1, int32_t arg2, int32_t arg3, int32_t arg4) {
    void *tmp = _load_start_kernel;
    unsigned int *sp = ((unsigned int *)stackbase) + stacksize/4;
    static int32_t cogargs__[5];
    int r;
    cogargs__[0] = (int32_t) func;
    cogargs__[1] = arg1;
    cogargs__[2] = arg2;
    cogargs__[3] = arg3;
    cogargs__[4] = arg4;
    if (_clone_cog) {
        tmp = __builtin_alloca(1984);
        _clone_cog(tmp);
    }
    *--sp = 0;
    *--sp = (unsigned int)cogargs__;
    *--sp = (unsigned int)Cogstub__;
    r = coginit(cogid, tmp, sp);
    return r;
}
// Motor control serial output
void motorPropCurrent::Main(void)
{
  int32_t 	input, byteCount, ledstate, validSeries;
  isConnected = 0;
  // dira[ConnectionPin]~                'Set connection pin to be an input
  // input := 0
  byteCount = 0;
  // INIT all motor speeds to OFF
  frontRightArmSpeed = 0;
  backRightArmSpeed = 0;
  rightWheelSpeed = 0;
  frontLeftArmSpeed = 0;
  backLeftArmSpeed = 0;
  leftWheelSpeed = 0;
  excavatorSpeed = 0;
  linActSpeed = 0;
  // INIT all pos control to OFF
  enableFl = 0;
  enableFR = 0;
  enableRL = 0;
  enableRR = 0;
  enableExc = 0;
  // INIT all error flags to 0
  ErrorExc = 0;
  ErrorFL = 0;
  ErrorFR = 0;
  ErrorRL = 0;
  ErrorRR = 0;
  errorFlag[MOTORPROPCURRENT_INDEXC] = 0;
  // Setup debug LEDs
  DIRA |= (1 << MOTORPROPCURRENT_DEBUG1);
  DIRA |= (1 << MOTORPROPCURRENT_DEBUG2);
  DIRA |= (1 << MOTORPROPCURRENT_DEBUG3);
  // Reset Msgs not needed in beginning
  resetPosMsg[MOTORPROPCURRENT_INDEXC] = 0;
  ExcActiveModeEnabled = 1;
  ArmsActiveModeEnabled = 1;
  // Reset Msg Indicators
  // INIT macroRunning to false
  macroRunning = 0;
  // ADC Stability set to false
  stableADCReading = 0;
  // COG #1
  // Unneeded for final deployments
  p1Serial.start(MOTORPROPCURRENT_P2RX, MOTORPROPCURRENT_P2TX, 3, 9600);
  // COG #2 
  // Start the Asynchronous Serial driver to talk to the H-Bridges 
  HbridgeFDS.start(-1, MOTORPROPCURRENT_TXPIN, 0, 9600);
  // Cog 3
  pst.start();
  // Cog 4
  Coginit__(4, (void *)ADCStack, 200, (void *)updateADC, 0, 0, 0, 0);
  _waitcnt((CLKFREQ * 4) + CNT);
  while (!(PosExcavator != 0)) {
    Yield__();
  }
  // Start by maintaining current position  
  DesPosExcavator = Min__((Max__(PosExcavator, MOTORPROPCURRENT_EXCMIN)), MOTORPROPCURRENT_EXCMAX);
  // Cog 5    
  Coginit__(5, (void *)RobotStack, 400, (void *)processState, 0, 0, 0, 0);
  // Cog 6  
  Coginit__(6, (void *)PotStack, 200, (void *)PotControl, 0, 0, 0, 0);
  // Cog 7
  Coginit__(7, (void *)motorStack, 400, (void *)motorDriverUpdater, 0, 0, 0, 0);
  stableADCReading = 1;
  /*                                       
   pst.str(String("PosExc - DesPosExc: "))
   pst.dec(PosExcavator)
   pst.str(String(" - "))
   pst.dec(DesPosExcavator)
   'error := ||(PosExcavator - DesPosExcavator)
   pst.str(String(" = "))
   pst.dec(PosExcavator - DesPosExcavator)
   pst.NewLine             
   
   */
  // repeat
  while (1) {
    // pst.str(String("Receiving byte"))
    // discards all bytes until the start byte (255) appears
    input = p1Serial.rxtime(1050);
    while (!((input == 255) || (input == (-1)))) {
      input = p1Serial.rxtime(1050);
    }
    if (input == (-1)) {
      isConnected = 0;
      // stop all motors
      frontRightArmSpeed = 0;
      backRightArmSpeed = 0;
      rightWheelSpeed = 0;
      frontLeftArmSpeed = 0;
      backLeftArmSpeed = 0;
      leftWheelSpeed = 0;
    }
    // byte0 := input
    inputPacket[byteCount] = input;
    (byteCount++);
    // Load the received bytes into local variables
    // **Look into swapping this with an array in the DAT section**
    // keeps loading bytes until we have loaded 14 total or if the end byte appears
    while (!(((input == 254) || (byteCount == 14)) || (input == (-1)))) {
      input = p1Serial.rx();
      if ((byteCount > 0) && (byteCount < 14)) {
        inputPacket[byteCount] = input;
      }
      (byteCount++);
    }
    // If we've received 14 bytes, validate,otherwise drop the packet
    if (byteCount == 14) {
      // run validation on the byte sequence
      // validSeries := validateStartEnd(byte0, byte13)
      // (inputPacket[BYTE_beginpacket],inputpacket[BYTE_endpacket]
      validSeries = validateStartEnd();
      // only process if start/end are good (joystick connected, looks like sequence is valid)
      if (validSeries == 1) {
        isConnected = 1;
        OUTA ^= 0x40000;
      } else {
        isConnected = 0;
      }
    } else {
      // Series is invalid length
      isConnected = 0;
    }
    // reset the counter whether valid or not
    byteCount = 0;
    // reset packet so we know when invalid packet sent
    inputPacket[MOTORPROPCURRENT_BYTE_BEGINPACKET] = 0;
    inputPacket[MOTORPROPCURRENT_BYTE_ENDPACKET] = 0;
  }
}

int32_t motorPropCurrent::validateStartEnd(void)
{
  int32_t result = 0;
  // This method checks the start and end bytes of the communication sequence
  // To validate, it needs byte0 = 255 and byte13 = 254
  if (inputPacket[MOTORPROPCURRENT_BYTE_BEGINPACKET] == 255) {
    // result := 1
    if (inputPacket[MOTORPROPCURRENT_BYTE_ENDPACKET] == 254) {
      // returns 1 if start and end byte are correct, otherwise returns default value of 0           
      result = 1;
    }
  }
  return result;
}

void motorPropCurrent::processState(motorPropCurrent *self)
{
  int32_t 	excInSpeed;
  // pst.str(string("reached"))
  // pst.newline
  // Initialize to 0 -- For leg locking macro
  self->desiredPositionsSet = 0;
  // Start phased macros in phase 0    
  self->phase = 0;
  OUTA |= (1 << MOTORPROPCURRENT_DEBUG1);
  while (1) {
    // pst.str(String("Processing state"))
    if (self->isConnected == 1) {
      // Only do things if connection is active       
      // move robot (main control cog)
      // if macroRunning == 0                 'Only do teleop if macro not running
      if (self->getRightButton(0) == 0) {
        // Get state of Button 0 on Right Joystick   -- The Trigger
        if (self->getRightButton(1) == 1) {
          // Get state of Button 1 on Right Joystick   -- The Thumb Button
          // Vector addition of joystick axes to get screw movement
          self->rightScrew((-self->getRY()) + self->getRX());
          // Z Axis controls the Leg                         
          self->rightArm(-self->getRZ());
          self->leftScrew(self->getLY() + self->getLX());
          self->leftArm(self->getLZ());
        } else {
          // Without correct button sequence, do nothing
          self->rightScrew(0);
          self->leftScrew(0);
          if (self->getRightButton(11) == 1) {
            // if both other buttons are unpressed, but this button is pressed, individual leg control
            if (self->getRightButton(4) == 1) {
              self->flarm(15);
            } else {
              self->flarm(0);
            }
            if (self->getRightButton(2) == 1) {
              self->blarm(15);
            } else {
              self->blarm(0);
            }
            if (self->getRightButton(3) == 1) {
              self->brarm(15);
            } else {
              self->brarm(0);
            }
            if (self->getRightButton(5) == 1) {
              self->frarm(15);
            } else {
              self->frarm(0);
            }
          } else {
            self->leftArm(0);
            self->rightArm(0);
          }
        }
        // mainArm(0)                       'Don't let excavator operate in this mode
        // If not operating Exc, maintain current position
        self->enableExc = 1;
      } else {
        // Don't use position control when we're not manually controlling excavator
        self->enableExc = 0;
        excInSpeed = ((-self->getRY()) * self->getRT()) / 255;
        if ((self->PosExcavator > MOTORPROPCURRENT_EXCMIN) && (excInSpeed < 0)) {
          // Don't let the Arm hit other parts of robot    
          self->mainArm(excInSpeed);
        } else {
          if ((self->PosExcavator < MOTORPROPCURRENT_EXCMAX) && (excInSpeed > 0)) {
            // Don't let the Arm hit other parts of robot    
            self->mainArm(excInSpeed);
          } else {
            self->mainArm(0);
          }
        }
        self->PrevPos[MOTORPROPCURRENT_INDEXC] = self->PosExcavator;
        // Update desired pos to current pos, when exit this mode new pos will be held
        self->DesPosExcavator = Min__((Max__(self->PosExcavator, MOTORPROPCURRENT_EXCMIN)), MOTORPROPCURRENT_EXCMAX);
        // MAX 1275    MIN 1040
        self->rightScrew((-self->getLY()) + self->getLX());
        self->leftScrew(self->getLY() + self->getLX());
        self->leftArm(0);
        self->rightArm(0);
      }
      if ((self->getRightButton(MOTORPROPCURRENT_BUTTON_DOWN) == 1) || (self->getLeftButton(MOTORPROPCURRENT_BUTTON_DOWN) == 1)) {
        self->linAct(127);
      } else {
        // pst.str(String("LinActUP"))    
        // outa[debug1] := !outa[debug1]
        if ((self->getRightButton(MOTORPROPCURRENT_BUTTON_UP) == 1) || (self->getLeftButton(MOTORPROPCURRENT_BUTTON_UP) == 1)) {
          self->linAct(-127);
        }
      }
      // pst.str(String("LinActDOWN "))
      // outa[debug1] := !outa[debug1]
      if ((((self->getRightButton(MOTORPROPCURRENT_BUTTON_UP) == 0) && (self->getRightButton(MOTORPROPCURRENT_BUTTON_DOWN) == 0)) && (self->getLeftButton(MOTORPROPCURRENT_BUTTON_UP) == 0)) && (self->getLeftButton(MOTORPROPCURRENT_BUTTON_DOWN) == 0)) {
        self->linAct(0);
      }
      // outa[debug1] := !outa[debug1]
      // outa[debug2]~
      // checkForMacroButtons
      self->checkForModeButtons();
      // Software E-Stop
      if (self->getRightButton(10) == 1) {
        self->frontRightArmSpeed = 0;
        self->backRightArmSpeed = 0;
        self->rightWheelSpeed = 0;
        self->frontLeftArmSpeed = 0;
        self->backLeftArmSpeed = 0;
        self->leftWheelSpeed = 0;
        self->excavatorSpeed = 0;
        self->linActSpeed = 0;
        // may want to enable enableExc
        // E-Stop can only be disengaged with a re-enable button press
        while (!(self->getRightButton(6) == 1)) {
          Yield__();
        }
      }
    } else {
      self->frontRightArmSpeed = 0;
      self->backRightArmSpeed = 0;
      self->rightWheelSpeed = 0;
      self->frontLeftArmSpeed = 0;
      self->backLeftArmSpeed = 0;
      self->leftWheelSpeed = 0;
      self->linActSpeed = 0;
      // excavatorSpeed    := 0                        
      self->enableExc = 1;
    }
  }
}

void motorPropCurrent::checkForModeButtons(void)
{
  if (getLeftButton(4) == 1) {
    // Enable Active mode on Excavator
    DesPosExcavator = PosExcavator;
    PrevPos[MOTORPROPCURRENT_INDEXC] = PosExcavator;
    resetPosMsg[MOTORPROPCURRENT_INDEXC] = 1;
    p1Serial.tx(254 - 1);
    errorFlag[MOTORPROPCURRENT_INDEXC] = 0;
    ExcActiveModeEnabled = 1;
    // dira[debug2]~~                           
    OUTA |= (1 << MOTORPROPCURRENT_DEBUG2);
  } else {
    // pst.str(String("EnableExc"))
    // waitcnt(clkfreq+cnt)
    if (getLeftButton(2) == 1) {
      // Disable Active mode on Excavator
      ExcActiveModeEnabled = 0;
    } else {
      if (getLeftButton(5) == 1) {
        // Enable Active mode on Legs
        DesPosLegRL = PosLegRL;
        DesPosLegRR = PosLegRR;
        DesPosLegFL = PosLegFL;
        DesPosLegFR = PosLegFR;
        ArmsActiveModeEnabled = 1;
        ErrorRL = 0;
        ErrorRR = 0;
      } else {
        if (getLeftButton(3) == 1) {
          // Disable Active mode on Legs
          ArmsActiveModeEnabled = 0;
        }
      }
    }
  }
}

/* 
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
      
 */
int32_t motorPropCurrent::getLY(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_LY] - 127;
  return returnVal;
}

int32_t motorPropCurrent::getRY(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_RY] - 127;
  return returnVal;
}

int32_t motorPropCurrent::getLX(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_LX] - 127;
  return returnVal;
}

int32_t motorPropCurrent::getRX(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_RX] - 127;
  return returnVal;
}

int32_t motorPropCurrent::getLZ(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_LZ] - 127;
  return returnVal;
}

int32_t motorPropCurrent::getRZ(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_RZ] - 127;
  return returnVal;
}

int32_t motorPropCurrent::getRT(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_RTHROTTLE];
  return returnVal;
}

int32_t motorPropCurrent::getLT(void)
{
  int32_t returnVal = 0;
  returnVal = inputPacket[MOTORPROPCURRENT_BYTE_LTHROTTLE];
  return returnVal;
}

int32_t motorPropCurrent::getRightButton(int32_t buttNum)
{
  int32_t retval = 0;
  if (buttNum < 8) {
    retval = (Shr__(inputPacket[MOTORPROPCURRENT_BYTE_RJBUTS1], (7 - buttNum))) % 2;
  } else {
    retval = (Shr__(inputPacket[MOTORPROPCURRENT_BYTE_RJBUTS2], (7 - (buttNum - 8)))) % 2;
  }
  return retval;
}

int32_t motorPropCurrent::getLeftButton(int32_t buttNum)
{
  int32_t retval = 0;
  if (buttNum < 8) {
    retval = (Shr__(inputPacket[MOTORPROPCURRENT_BYTE_LJBUTS1], (7 - buttNum))) % 2;
  } else {
    retval = (Shr__(inputPacket[MOTORPROPCURRENT_BYTE_LJBUTS2], (7 - (buttNum - 8)))) % 2;
  }
  return retval;
}

void motorPropCurrent::flarm(int32_t inspeed)
{
  // individual arms move out only
  inspeed = Min__((Max__(inspeed, 0)), 127);
  frontLeftArmDir = 0;
  frontLeftArmSpeed = inspeed;
}

void motorPropCurrent::blarm(int32_t inspeed)
{
  // individual arms move out only
  inspeed = Min__((Max__(inspeed, 0)), 127);
  rearLeftArmDir = 0;
  backLeftArmSpeed = inspeed;
}

void motorPropCurrent::frarm(int32_t inspeed)
{
  // individual arms move out only
  inspeed = Min__((Max__(inspeed, 0)), 127);
  frontRightArmDir = 0;
  frontRightArmSpeed = inspeed;
}

void motorPropCurrent::brarm(int32_t inspeed)
{
  // individual arms move out only
  inspeed = Min__((Max__(inspeed, 0)), 127);
  rearRightArmDir = 0;
  backRightArmSpeed = inspeed;
}

void motorPropCurrent::leftArm(int32_t inspeed)
{
  // positive is out
  inspeed = Min__((Max__(inspeed, (-127))), 127);
  if (inspeed > 0) {
    frontLeftArmDir = 0;
    rearLeftArmDir = 0;
    frontLeftArmSpeed = inspeed;
    backLeftArmSpeed = inspeed;
  } else {
    frontLeftArmDir = 1;
    rearLeftArmDir = 1;
    frontLeftArmSpeed = -inspeed;
    backLeftArmSpeed = -inspeed;
  }
}

void motorPropCurrent::rightArm(int32_t inspeed)
{
  // positive is out
  inspeed = Min__((Max__(inspeed, (-127))), 127);
  if (inspeed > 0) {
    frontRightArmDir = 0;
    rearRightArmDir = 0;
    frontRightArmSpeed = inspeed;
    backRightArmSpeed = inspeed;
  } else {
    frontRightArmDir = 1;
    rearRightArmDir = 1;
    frontRightArmSpeed = -inspeed;
    backRightArmSpeed = -inspeed;
  }
}

void motorPropCurrent::leftScrew(int32_t inspeed)
{
  // inspeed from -127 to 127
  // positive is clockwise as viewed from rear
  inspeed = Min__((Max__(inspeed, (-127))), 127);
  if (inspeed > 0) {
    frontLeftWheelDir = 5;
    rearLeftWheelDir = 4;
    leftWheelSpeed = inspeed;
  } else {
    frontLeftWheelDir = 4;
    rearLeftWheelDir = 5;
    leftWheelSpeed = -inspeed;
  }
}

void motorPropCurrent::rightScrew(int32_t inspeed)
{
  // inspeed from -127 to 127
  // positive is clockwise as viewed from rear
  inspeed = Min__((Max__(inspeed, (-127))), 127);
  if (inspeed > 0) {
    frontRightWheelDir = 5;
    rearRightWheelDir = 4;
    rightWheelSpeed = inspeed;
  } else {
    frontRightWheelDir = 4;
    rearRightWheelDir = 5;
    rightWheelSpeed = -inspeed;
  }
}

void motorPropCurrent::linAct(int32_t inspeed)
{
  // positive is up (back)
  inspeed = Min__((Max__(inspeed, (-127))), 127);
  if (inspeed > 0) {
    linActDir = 4;
    linActSpeed = inspeed;
  } else {
    linActDir = 5;
    linActSpeed = -inspeed;
  }
}

void motorPropCurrent::mainArm(int32_t inspeed)
{
  inspeed = Min__((Max__(inspeed, (-127))), 127);
  // positive is up (back)
  /* pst.str(string("inspeed = "))
      pst.dec(inspeed)
      pst.Newline   
   */
  if (inspeed > 0) {
    excavatorDir = 1;
    invertedExcavatorDir = 0;
    excavatorSpeed = inspeed;
  } else {
    excavatorDir = 0;
    invertedExcavatorDir = 1;
    excavatorSpeed = -inspeed;
  }
}

void motorPropCurrent::PotControl(motorPropCurrent *self)
{
  int32_t 	Kp, error, deadzone;
  /* 
      Runs on independent cog, only actually does things if enables go high
    
   */
  /* 
    *Rotation based on looking down length of shaft to the pot body
    CW Rotation of Pots
    FL, RR Leg: Value UP  , Leg moves IN
    FR, RL Leg: Value UP  , Leg moves OUT
    Excavator : Value UP  , Exc moves UP
                                                                   
    CCW Rotation of Pots
    FL, RR Leg: Value DOWN, Leg moves OUT
    FR, RL Leg: Value DOWN, Leg moves IN
    Excavator : Value DOWN, Exc moves DOWN
    
   */
  /* 
      LEG CALIBRATION VALUES
      Current FL Position: 951
      Current RR Position: 958
      Current FR Position: 1086
      Current RL Position: 1099
    
   */
  deadzone = 3;
  Kp = 4;
  while (1) {
    // pst.str(String("PosExc: "))
    // pst.dec(PosExcavator)     
    // pst.NewLine
    if (self->enableExc == 1) {
      if (self->errorFlag[MOTORPROPCURRENT_INDEXC] == 0) {
        if (self->ExcActiveModeEnabled == 1) {
          // inspeed := -getRY*getRT/255
          // Building in a deadzone of 20 'ticks' where actions doesn't need to be taken
          // Need to test if this deadzone is a good number      
          /*   
                    pst.str(String("PosExc - DesPosExc: "))
                    pst.dec(PosExcavator)                         
                    pst.str(String(" - "))
                    pst.dec(PrevPos[IndExc])                    
                    pst.str(String(" = "))
                    pst.dec(PosExcavator - PrevPos[IndExc])         
                    pst.NewLine    
                    
           */
          error = abs((self->PosExcavator - self->DesPosExcavator));
          if (self->PosExcavator < (self->DesPosExcavator - 3)) {
            /*  pst.str(String("Exc Rotate up: "))    
                          pst.dec((error)*Kp)                  
                          pst.NewLine   
             */
            self->mainArm(error * Kp);
          } else {
            if (self->PosExcavator > (self->DesPosExcavator + 3)) {
              /*  pst.str(String("Exc Rotate down: "))   
                            pst.dec(-(error)*Kp)
                            pst.NewLine   
               */
              self->mainArm((-error) * Kp);
            } else {
              self->mainArm(0);
            }
          }
          if (self->PrevPosSet[MOTORPROPCURRENT_INDEXC] == 0) {
            self->PrevPos[MOTORPROPCURRENT_INDEXC] = self->PosExcavator;
            self->PrevPosSet[MOTORPROPCURRENT_INDEXC] = 1;
          } else {
            if ((abs((self->PosExcavator - self->PrevPos[MOTORPROPCURRENT_INDEXC]))) > 75) {
              self->pst.dec(self->PosExcavator);
              self->pst.str((int32_t)" ");
              self->pst.dec(self->PrevPos[MOTORPROPCURRENT_INDEXC]);
              self->pst.NewLine();
              self->errorFlag[MOTORPROPCURRENT_INDEXC] = 1;
              self->pst.str((int32_t)"Error Exc");
              self->pst.NewLine();
            } else {
              self->PrevPos[MOTORPROPCURRENT_INDEXC] = self->PosExcavator;
            }
          }
        } else {
          self->mainArm(0);
        }
      } else {
        // if resetPosMsg[IndExc] == 1 
        //    pst.dec(resetPosMsg[IndExc])
        //    pst.NewLine
        //    resetPosMsg[IndExc] := 0
        self->mainArm(0);
      }
    }
    // else
    // pst.str(String("Not enabled"))
    // pst.NewLine
    /* pst.str(String("Current FL Position: "))
        pst.dec(PosLegFL)
        pst.NewLine
     */
    /* 
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
    
    
        
     */
    if (self->enableRightArms == 1) {
      if ((self->ErrorRR == 0) && (self->ArmsActiveModeEnabled == 1)) {
        self->pst.str((int32_t)"Current RR Position: ");
        self->pst.dec(self->PosLegRR);
        self->pst.NewLine();
        error = abs((self->PosLegRR - self->DesPosLegRR));
        if (self->PosLegRR < (self->DesPosLegRR - 3)) {
          self->rightArm((-error) * Kp);
        } else {
          if (self->PosLegRR > (self->DesPosLegRR + 3)) {
            self->rightArm(error * Kp);
          } else {
            self->rightArm(0);
          }
        }
      } else {
        self->rightArm(0);
      }
    }
    //  else
    /*       pst.str(String("Disabled"))
          pst.NewLine
     
     */
    if (self->enableLeftArms == 1) {
      if ((self->ErrorRL == 0) && (self->ArmsActiveModeEnabled == 1)) {
        self->pst.str((int32_t)"Current RL Position: ");
        self->pst.dec(self->PosLegRL);
        self->pst.NewLine();
        error = self->PosLegRL - self->DesPosLegRL;
        if (((abs(error)) * Kp) > deadzone) {
          // |error| * Kp           127         
          // ------------  *  --------------- * (|error|*Kp - deadzone) * -1
          //  error  * Kp      (127-deadzone) 
          self->leftArm((-((((abs(error)) * Kp) * 127) * (((abs(error)) * Kp) - deadzone))) / ((error * Kp) * (127 - deadzone)));
        } else {
          self->leftArm(0);
        }
      } else {
        self->leftArm(0);
      }
    }
  }
}

//   waitcnt(clkfreq/10+cnt)
//   pst.ClearHome
void motorPropCurrent::updateADC(motorPropCurrent *self)
{
  int32_t 	PrevExc, PrevFL, PrevFR, PrevRL, PrevRR, PrevsSet, counter;
  /* 
      POSITION VARIABLES - Feedback from Pots
      long PosLegFL, PosLegFR, PosLegRL, PosLegRR
      long PosExcavator
      
      adcExc = 0
      adcFL  = 1
      adcFR  = 2
      adcRL  = 8
      adcRR  = 5
    
   */
  PrevsSet = 0;
  // INIT ADC, get first byte in
  self->ADC(MOTORPROPCURRENT_ADCEXC);
  while (1) {
    self->PosExcavator = self->ADC(MOTORPROPCURRENT_ADCFL);
    self->PosLegFL = self->ADC(MOTORPROPCURRENT_ADCFR);
    self->PosLegFR = self->ADC(MOTORPROPCURRENT_ADCRL);
    self->PosLegRL = self->ADC(MOTORPROPCURRENT_ADCRR);
    self->PosLegRR = self->ADC(MOTORPROPCURRENT_ADCEXC);
  }
}

/* 
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
      
 */
int32_t motorPropCurrent::ADC(int32_t NextChannel)
{
  int32_t 	dataByte, i, _mask_0001;
  int32_t ADCbits = 0;
  _mask_0001 = 1 << MOTORPROPCURRENT_SOUT;
  /* 
      Shift bits from last call out and read in the next called channel into buffer
    
   */
  DIRA = (DIRA & 0xffff07ff) | 0x6800;
  ADCbits = 0;
  OUTA &= (~(1 << MOTORPROPCURRENT_CLK));
  OUTA &= (~(1 << MOTORPROPCURRENT_CS));
  dataByte = (NextChannel << 8) + (0 << 4);
  __builtin_propeller_waitpeq(1 << MOTORPROPCURRENT_EOC, 1 << MOTORPROPCURRENT_EOC);
  for(i = 11; i >= 0; --i) {
    ADCbits = (ADCbits << 1) + ((INA >> MOTORPROPCURRENT_SIN) & 0x1);
    if ((Shr__(dataByte, i)) & 0x1) {
      OUTA |= _mask_0001;
    } else {
      OUTA &= (~_mask_0001);
    }
    OUTA &= (~(1 << MOTORPROPCURRENT_CLK));
    OUTA |= (1 << MOTORPROPCURRENT_CLK);
    OUTA &= (~(1 << MOTORPROPCURRENT_CLK));
  }
  OUTA |= (1 << MOTORPROPCURRENT_CS);
  return ADCbits;
}

void motorPropCurrent::motorDriverUpdater(motorPropCurrent *self)
{
  while (1) {
    // Right Arm Motors
    self->SendH(129, self->frontRightArmDir, self->frontRightArmSpeed);
    self->SendH(130, self->rearRightArmDir, self->backRightArmSpeed);
    // Right Screw Motors
    self->SendH(129, self->frontRightWheelDir, self->rightWheelSpeed);
    self->SendH(130, self->rearRightWheelDir, self->rightWheelSpeed);
    // Left Arm Motors
    self->SendH(131, self->frontLeftArmDir, self->frontLeftArmSpeed);
    self->SendH(128, self->rearLeftArmDir, self->backLeftArmSpeed);
    // Left Screw Motors
    self->SendH(131, self->frontLeftWheelDir, self->leftWheelSpeed);
    self->SendH(128, self->rearLeftWheelDir, self->leftWheelSpeed);
    // Excavator Axis Motors
    self->SendH(133, self->excavatorDir, self->excavatorSpeed);
    self->SendH(134, self->invertedExcavatorDir, self->excavatorSpeed);
    /*  pst.str(String("excavatorSpeed: "))
          pst.dec(excavatorSpeed)
          pst.str(string("  isCon: "))
          pst.dec(isConnected)
          pst.NewLine     
     */
    // Linear Actuator Motor
    self->SendH(133, self->linActDir, self->linActSpeed);
    _waitcnt((CLKFREQ / 100) + CNT);
  }
}

void motorPropCurrent::SendH(int32_t address, int32_t command, int32_t speed)
{
  int32_t 	checksum;
  checksum = ((address + command) + speed) & 0x7f;
  // H-bridge address # (128-133)
  HbridgeFDS.tx(address);
  // Motor B: 0=forward 1=backward ; Motor A: 4=forward 5=backward
  HbridgeFDS.tx(command);
  // Speed 0-127 0=stop (0% duty cycle), 127=max speed (100% duty cycle)
  HbridgeFDS.tx(speed);
  // If the H-bridge doesn't calculate the same checksum, then there was a transmission error and the command will be ignored
  HbridgeFDS.tx(checksum);
}

__asm__( "    .global __clkfreqval\n" );
__asm__( "    __clkfreqval = 0x4c4b400\n" );
__asm__( "    .global __clkmodeval\n" );
__asm__( "    __clkmodeval = 0x6f\n" );

motorPropCurrent MainObj__;

int main() {
  MainObj__.Main();
  return 0;
}
