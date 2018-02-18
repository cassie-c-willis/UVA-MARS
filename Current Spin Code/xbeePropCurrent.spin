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
  P2TX = 8
  feedbackPin = 2

OBJ
     p2serial   : "FullDuplexSerial"  'Serial line communicates with next Propeller chip
     feedbackFDS: "FullDuplexSerial"
     xbeeFDS    : "FullDuplexSerial"  'Communication line with the XBEE
     pst        : "PST_Driver"        'Parallax Serial Terminal
VAR
     long xbeeConnected         'Do nothing until the xbee is connected
     long feedbackStack[50]

PUB Main | input, byteCount, byte3
    '  dira[ConnectionPin]~      'Make connection an input pin
    '  dira[11]~~                'Status LED (off)
    '  outa[11]~
      dira[P2RX] := 1
      dira[16..17]~~             'Set all debugging pins as outputs
      

      ''''''Variable Initialization''''''''
      xbeeConnected := 0
      xbeeFDS.start(xbeeDOUT, -1, 0, 9600) 'cog 1
      'repeat until ina[ConnectionPin] == 1
                                         
      p2serial.Start(-1, P2RX, %0011, 9600) 'cog 2
      

      'ledstate := outa[11] 
      pst.start  'cog 3
      'feedbackFDS.start(feedbackPin, -1, %0011, 9600)
      'coginit(5, feedback, @feedbackStack)
       
      byteCount := 0
      repeat
        input := xbeeFDS.Rx
        byteCount++
        'if byteCount == 4
          'pst.dec(input)
          'pst.NewLine
        'if byteCount == 14
          'byteCount := 0
          'pst.NewLine
       'pst.dec(input)
       'pst.NewLine
        outa[debugPin0] := !outa[debugPin0]
        p2serial.Tx(input)

PUB feedback | receivedVal

      repeat
        receivedVal := feedbackFDS.Rx
        if receivedVal <> -1
            xbeeFDS.Tx(255)
            xbeeFDS.Tx(receivedVal)
            xbeeFDS.Tx(254)
            pst.dec(receivedVal)
            pst.NewLine                          