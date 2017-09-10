{Object_Title_a4nd_Purpose}


CON
        _clkmode = xtal1 + pll16x                                               'Standard clock mode * crystal frequency = 80 MHz
        _xinfreq = 5_000_000

        led  = 9


  
PUB Main
  dira[led]   := 0

  repeat
