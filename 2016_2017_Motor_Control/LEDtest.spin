{Object_Title_a4nd_Purpose}


CON
        _clkmode = xtal1 + pll16x                                               'Standard clock mode * crystal frequency = 80 MHz
        _xinfreq = 5_000_000
        eoc  = 3                               'monitors the ADC chip's EOC state
        clk  = 4                               'outputs the SPI clock signal to the ADC chip
        Sout = 6                             'sends serial data to the ADC chip
        Sin  = 5                              'receives serial data from the ADC chip
        cs   = 7                               'selects/deselects the ADC chip
        led  = 8
        led2 = 16
        led3 = 17
        led4 = 18
        led1 = 9
VAR
  long  ADCStack[100], adcValue
  
OBJ
  pst     : "PST_Driver"
  
PUB Main
  dira[led]   := 1
  dira[led2]  := 1
  dira[led3]  := 1
  dira[led4]  := 1
  repeat
    !outa[led]
    !outa[led2]
    !outa[led3]
    !outa[led4]  
    waitcnt(clkfreq + cnt)

     