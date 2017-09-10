xCON
  _xinfreq = 5_000_000 
  _clkmode = xtal1 + pll16x
   
  ConnectionPin = 0
  txPin         = 8                        'Pin to send 9600 baud asynchronous data to all H-bridges (via their S1 pins
  xBeeRx        = 9                        'Receive data from xBee's DOUT Pin
  xBeeTx         = -1                                    'Transmits data to xBee's DIN Pin 
  eoc           =  15                        'monitors the ADC chip's EOC state
 ' clk           =  9                        'outputs the SPI clock signal to the ADC chip
  P2RX          = 9                         'connection between prop1 and prop2
 
VAR

long xbeeconnected = 0


OBJ
  pst         : "PST_Driver"
  HbridgeFDS  : "FullDuplexSerial"   'Motor control serial output
  xbeeFDS     : "FullDuplexSerial"

    
PUB Main  | input   

  'dira[ConnectionPin]~                                       'Set connection pin to be an input
 ' input := 0
  'dira[16] := 1
  xbeeFDS.start (xBeeRx, xBeeTx, %0011, 9600)
  
  repeat until xbeeconnected == 1
  
  HbridgeFDS.Start(-1,txPin,0,9600)                        'Start the Asynchronous Serial driver to talk to the H-Bridges        Cog 3 
  waitcnt((clkfreq*2)+cnt)

 ' pst.start

    repeat                                    'Send command and speed to specified H-bridge address
      SendH(133 , 1 , 10)                 'Front Right Arm
      waitcnt(clkfreq + cnt)
      


                                                  
PUB SendH(address,command,speed) | checksum
  checksum:=(address+command+speed) & %01111111         
  HbridgeFDS.tx(address)                                   'H-bridge address # (128-133)
  HbridgeFDS.tx(command)                                   'Motor B: 0=forward 1=backward ; Motor A: 4=forward 5=backward
  HbridgeFDS.tx(speed)                                     'Speed 0-127 0=stop (0% duty cycle), 127=max speed (100% duty cycle)
  HbridgeFDS.tx(checksum)                                  'If the H-bridge doesn't calculate the same checksum, then there was a transmission error and the command will be ignored

 