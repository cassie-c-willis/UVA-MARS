CON
    _xinfreq=5_000_000 'Not sure what frequency I should operate at with the LIDAR.
    _clkmode=xtal1+pll16x     'Use the crystal for the clock? 

    'When the voltage on the Trigger wire steps down from a '1' signal to the neutral signal, the 
    'LIDAR shall begin acquiring measurements for a period, then it will output
    'a '1' signal for a period of time proportional to the distance measured.
    'We can then measure this time period's duration and convert it to the 
    'distance reading we require.
    'It is in this way that we can measure the distance that the LIDAR
    'has reported.
    LIDAR_Trigger = 16    
    LIDAR_PWM_Monitor = 6
    
    LIDAR_WidthToDistance = 10 '10 microseconds / cm

VAR

  long stack1[100]
  long currentDistanceReading
OBJ

  pst : "Parallax Serial Terminal"
  fM : "FloatMath"
  fS: "FloatString"
PUB Main

    pst.start(115200)
    
    
    'Rest of the bits in CTRA don't matter for our purposes. 

    
    coginit(2,ReadLidarSignal(LIDAR_PWM_Monitor),@stack1)

    repeat
      pst.str(fS.FloatToString(currentDistanceReading))
      pst.str(string("cm"))
      pst.newline
      waitcnt(clkfreq/100+cnt)
    
    
PUB ReadLIDARSignal(pin)|PHS_Val, float_PHS_Val
    'First, set up the counter modes and phase registers. This is how we shall keep count of the time period elapsed,
    'thusly also knowing the distance we have  
    CTRA[30..26]:=%01000 'Set to POS detector mode (accumulate the PHS register when the counter's pin is at positive value).
    CTRA[5..0]:= LIDAR_PWM_Monitor 'Counter A's pin will be our monitor pin.
    FRQA := 1
    'Second, send a signal to the LIDAR to begin acquisition.
    dira[LIDAR_Trigger]~~
    outa[LIDAR_Trigger]~~
    waitcnt(clkfreq/100 + cnt)
    outa[LIDAR_Trigger]~
    'Third, we begin monitoring our pin and calculating its value based on our width to distance ratio. 
    dira[LIDAR_PWM_Monitor]~
    
    repeat
        waitpeq(|< pin, |< pin, 0)
        waitpne(|< pin , |< pin, 0) 'Wait until the pin's not equal to one. (Between pulses).
        PHS_Val := PHSA  'Number of cycles
        float_PHS_Val := fM.FFloat(PHS_Val)
        'Cycles * Sec/Cycle (clkfreq) * Milliseconds/Second * Centimeters/Millisecond (From LIDAR Specs) 
        currentDistanceReading := fM.FMul(fM.FDiv(float_PHS_Val, fM.FFLoat(clkfreq)),fM.FDiv(fM.FFloat(1000000),fM.FFloat(LIDAR_WidthToDistance)))
        PHSA~
