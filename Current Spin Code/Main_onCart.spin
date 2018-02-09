CON
  _xinfreq = 5_000_000
  _clkmode = xtal1 + pll16x

  ConnectionPin = 0
  debugPin0 = 16                'checks if power is connected to the propeller with an LED
  debugPin1 = 17                'checks if power is connected to the propeller with an LED
  debugPin2 = 18                'checks if power is connected to the propeller with an LED
  AEOC = 15                     'connects to EOC pin of ADC chip 
  AIO = 14                      'connects to I/O Clock of ADC chip
  ADI = 13                      'Transmits data to Data In of ADC chip
  ADO = 12                      'Transmits data from Data Out of ADC chip
  P2RX = 9                      'connects to Propeller 1
  P2TX = 8                      'Transmits to IN-1 pin of optoisolator, also connects to LED to check for connection success
  