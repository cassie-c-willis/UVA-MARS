CON
  _xinfreq = 5_000_000 
  _clkmode = xtal1 + pll16x


 'ADC Pins
  eoc  = 15                         'P15 receives the "end of conversion" signal from ADC
  clk  = 14                         'P14 sends the synchronous clock pulses to ADC chip
  Sout = 13                         'Data going to the ADI pin on ADC
  Sin  = 12                         'Data coming from the ADO pin on ADC
  cs   = 11                         'Chip Select

   adcExc = 1
  adcFL  = 0
  adcFR  = 2
  adcRL  = 8
  adcRR  = 5


  
VAR 


  long PosLegFL, PosLegFR, PosLegRL, PosLegRR
  long PosExcavator
  long  ADCStack[50]

OBJ
  pst         : "PST_Driver"
  HbridgeFDS  : "FullDuplexSerial"   'Motor control serial output
  p1Serial    : "FullDuplexSerial"


PUB Main

pst.start     'Cog 1
coginit(2 , updateADC          , @ADCStack  ) 'Cog 2

waitcnt(clkfreq*4+cnt)   'wait for adc to initialize   
 
repeat until PosExcavator <> 0     'wait for adc to initialize
repeat
  pst.str(string("Excavator Pos: "))
  pst.dec(posExcavator)
  pst.newLine
  waitcnt(clkfreq+cnt)


PUB updateADC | PrevExc, PrevFL, PrevFR, PrevRL, PrevRR, PrevsSet, counter

  PrevsSet := 0
  ADC(adcExc)                        'INIT ADC, get first byte in
  repeat
    PosExcavator := ADC(adcFL )
    PosLegFL     := ADC(adcFR )
    PosLegFR     := ADC(adcRL )
    PosLegRL     := ADC(adcRR ) 
    PosLegRR     := ADC(adcExc)

        

PUB ADC(NextChannel) : ADCbits | dataByte, i
  {
    Shift bits from last call out and read in the next called channel into buffer
  }
  dira[eoc..cs]:=%01101
  ADCbits:=0
  outa[clk]~
  outa[cs]~
  dataByte:=NextChannel<<8+%0000<<4
  waitpeq(|<eoc,|<eoc,0)
  repeat i from 11 to 0
    ADCbits:=(ADCbits<<1)+ina[Sin]
    outa[Sout]:=dataByte>>i
    outa[clk]~
    outa[clk]~~
    outa[clk]~
  outa[cs]~~
  