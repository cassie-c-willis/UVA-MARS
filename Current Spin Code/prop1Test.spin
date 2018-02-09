CON
  _clkmode = xtal1 + pll16x
  _xinfreq = 5_000_000

  ConnectionPin = 15

OBJ
     serial     : "FullDuplexSerial"
     xbeeFDS    : "FullDuplexSerial"
VAR

byte send
PUB Main
    dira[ConnectionPin]~      'Make connection an input pin
    dira[16]~~
    serial.start(-1, 9, %0011, 9600)
    send := 1
    repeat
      serial.Tx(send)
      outa[16]~~
      waitcnt(clkfreq + cnt)
      outa[16]~
      waitcnt(clkfreq + cnt)
    