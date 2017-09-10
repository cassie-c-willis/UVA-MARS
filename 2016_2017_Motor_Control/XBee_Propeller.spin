CON
  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

  ConnectionPin = 15
  debugPin0 = 16                'checks if power is connected to the propeller with an LED
  debugPin1 = 17                'checks if power is connected to the propeller with an LED
  debugPin2 = 18                'checks if power is connected to the propeller with an LED
  xbeeDOUT = 15                 'Transmits data from xbee's DOut pin
  xbeeDIN = 14                  'Transmits data to xbee's DIn pin
  P2RX = 9                      'connects to Propeller 2

OBJ
     serial     : "FullDuplexSerial"
     xbeeFDS    : "FullDuplexSerial"
     pst        : "PST_Driver"
VAR
     long xbeeConnected         'Do nothing until the xbee is connected  

PUB Main | input, input2, byteCount, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, ledstate
    '  dira[ConnectionPin]~      'Make connection an input pin
    '  dira[11]~~                'Status LED (off)
    '  outa[11]~
      dira[P2RX] := 1
      dira[debugPin0]~~
      

      ''''''Variable Initialization''''''''
      xbeeConnected := 0
      xbeeFDS.start(xbeeDOUT, xbeeDIN, 0, 9600)
      'repeat until ina[ConnectionPin] == 1

      serial.Start(-1, 9, %0011, 9600)

      'ledstate := outa[11] 
      'pst.start

      
      
      repeat
        input := xbeeFDS.Rx
        'pst.dec(input)
        'pst.Newline
        case byteCount
          0:
             byte0 := input 
          1:
             byte1 := input
          2:
             byte2 := input
          3:
             byte3 := input
          4:
             byte4 := input
          5:
             byte5 := input
          6:
             byte6 := input
          7:
             byte7 := input
          8:
             byte8 := input
          9:
             byte9 := input
          10:
             byte10 := input
          11:
             byte11 := input
          12:
             byte12 := input
          13:
             byte13 := input
        byteCount ++
        'input2 := xbeeFDS.xbeeDOUT
        
      if byte0 == 255
        if byte13 == 254
          if byteCount == 14
             if byte1[0] == 1
                serial.Tx(1)
                outa[16]~~
                waitcnt(clkfreq + cnt)
                outa[16]~
                waitcnt(clkfreq + cnt)
             else
                !outa[18]
      else
        outa[debugPin1]~
        serial.Tx(0) 
        
      if byteCount >= 14
        byteCount := 0

       ' serial.Tx(input)
       ' serial.Tx(input2)