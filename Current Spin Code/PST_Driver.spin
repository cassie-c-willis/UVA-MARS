'' PST_Driver
''12/10/2008
''Updated 8/12/2013 to handle Backspace key presses, Cog number designation, and to output characters
''by Gavin Garner and Michael Myers
''University of Virginia
{{
This program facilitates the use of the Parallax Serial Terminal (PST) with the Propeller chip allowing
a PC (and its keyboard) to communicate with the Propeller and for the Propeller to output text to the computer's
screen. It assumes that the Prop Plug programmer is being used to connect the Propeller to the PC and sets the
baudrate to 115200.

Disclaimer: This program is a modified version of the FullDuplexSerialPlus object by Parallax
that is included in the Objects Lab of their Propeller Education Kit (which is at the time of this initial writing currently still
work in progress) and also borrows methods from the FloatMath object in the Propeller Library. Thus the primary authors of this code
are Jeff Martin, Andy Lindsay, and the almighty Chip Gracey himself. 
}}
  
CON                                                     'Parallax Serial Terminal Control Character Constants 
  HOME     =   1                               
  CRSRXY   =   2                               
  CRSRLF   =   3                               
  CRSRRT   =   4                               
  CRSRUP   =   5                               
  CRSRDN   =   6                               
  BELL     =   7                               
  BKSP     =   8                               
  TAB      =   9                               
  LF       =   10                              
  CLREOL   =   11                              
  CLRDN    =   12                              
  CR       =   13                              
  CRSRX    =   14                              
  CRSRY    =   15                              
  CLS      =   16                               

VAR                  
  byte  rx_buffer[16]                                         'transmit and receive buffers
  byte  tx_buffer[16]
  long cog
  long  rx_head, rx_tail, tx_head, tx_tail, rx_pin, tx_pin, rxtx_mode, bit_ticks, buffer_ptr

PUB start : okay | rxpin,txpin,mode,baudrate,countdown    'Starts serial driver in a new cog
  rxpin:=31
  txpin:=30
  mode:=0
  baudrate:=115200
  stop
  longfill(@rx_head, 0, 4)
  longmove(@rx_pin, @rxpin, 3)
  bit_ticks := clkfreq / baudrate
  buffer_ptr := @rx_buffer
  okay := cog := cognew(@entry, @rx_head) + 1

  repeat countdown from 4 to 1                            'Give the user time to open and enable the PST program
    ClearHome                                             ' after downloading the Propeller program 
    str(string("The PST interface will start in "))
    dec(countdown)
    str(string(" seconds."))
    waitcnt(clkfreq+cnt)
  ClearHome   

PUB StartOnCog(cognumber) : okay | rxpin,txpin,mode,baudrate,countdown    'Starts serial driver in a new cog
  cog:=cognumber
  rxpin:=31
  txpin:=30
  mode:=0
  baudrate:=115_200
  cogstop(cog)                                      'Stops
  longfill(@rx_head, 0, 4)                                'Wipe any pre-existing receive data
  longmove(@rx_pin, @rxpin, 3)                            'Copy {rxpin,txpin,mode} to {rx_pin,tx_pin,rxtx_mode}
  bit_ticks := clkfreq / baudrate                         'Set baudrate to 115,200 bits per second
  buffer_ptr := @rx_buffer                                'Store receive buffer pointer address
  coginit(cog,@entry,@rx_head)

  repeat countdown from 4 to 1                            'Give the user time to open and enable the PST program
    ClearHome                                             ' after downloading the Propeller program 
    str(string("The PST interface will start in "))
    dec(countdown)
    str(string(" seconds."))
    waitcnt(clkfreq+cnt)
  ClearHome  

PUB stop                                                                                                           
  if cog                                        'Stops serial driver - frees a cog                         
    cogstop(cog~ - 1)                                                                                      
  longfill(@rx_head, 0, 9)                                                                                             
                                                                                                           
PUB ClearHome                                                                                                      
  tx(CLS)                                       'Clears the screen and sets cursor to its home position    
  tx(HOME)                                                                                                 
                                                                                                           
PUB ClearRight                                                                                                     
  tx(CLREOL)                                    'Clears everything to the right of the cursor              
                                                                                                           
PUB NewLine                                                                                                        
  tx(CR)                                        'Creates a new line and moves cursor to the far left              
                                                                                                           
PUB NewLines(number)                                                                 
  repeat number                                            
    tx(CR)                                      'Carriage return (moves cursor to the far left)                                                                
                                                                      
PUB SetCursorHome                                                                                                  
  tx(Home)                                      'Moves the cursor to the upper left of the screen          
                                                                                                           
PUB SetCursor(column,row)                                                                                          
  tx(CRSRXY)                                    'Moves the cursor to a specific position                   
  tx(column)                                                                                               
  tx(row)                                                                                                  
                                                                                                           
PUB str(stringptr)                              'Send zero terminated string that starts at the 
  repeat strsize(stringptr)                     ' stringptr memory address
    tx(byte[stringptr++])

PUB strcr(stringptr)                              'Send zero terminated string that starts at the 
  repeat strsize(stringptr)                     ' stringptr memory address
    tx(byte[stringptr++])
  tx(CR)

PUB dec(value) | i                              'Prints a decimal number 
  if value < 0
    -value
    tx("-")

  i := 1_000_000_000
  repeat 10
    if value => i
      tx(value / i + "0")                       ' "0"=48 and 48+(a # 0-9)=the ASCII character value for that #
      value //= i
      result~~
    elseif result or i == 1
      tx("0")
    i /= 10
  ClearRight
  'NewLine

PUB decNCR(value) | i                            'Prints a decimal number without a creating a new line afterward
  if value < 0
    -value
    tx("-")

  i := 1_000_000_000
  repeat 10
    if value => i
      tx(value / i + "0")                       ' "0"=48 and 48+(a # 0-9)=the ASCII character value for that #
      value //= i
      result~~
    elseif result or i == 1
      tx("0")
    i /= 10
  ClearRight

PUB GetDec : value | tempstr[11]                'Gets decimal character representation of a number from the terminal           
    GetStr(@tempstr)                            ' and returns the corresponding value                                          
    value := StrToDec(@tempstr)    

PUB StrToDec(stringptr) : value | character, index, multiply  
  'Converts a zero terminated string representation of a decimal number to a value
  value := index := 0                                                    
  repeat until ((character := byte[stringptr][index++]) == 0)                 
     if character => "0" and character =< "9"                                      
        value := value * 10 + (character - "0")                               
  if byte[stringptr] == "-"                                              
     value := - value                                                    

PUB bin(value, digits)
  'Sends the character representation of a binary number to the terminal.
  value <<= 32 - digits
  repeat digits
    tx((value <-= 1) & 1 + "0")

PUB GetBin : value | tempstr[11]
  'Gets binary character representation of a number from the terminal and returns the corresponding value
  GetStr(@tempstr)
  value := StrToBin(@tempstr)    


PUB StrToBin(stringptr) : value | character, index
  'Converts a zero terminated string representaton of a binary number to a value
  value:=index:= 0
  repeat until ((character:=byte[stringptr][index++])==0)
     if character=="0" or character=="1"                 ' "0"=48, "1"=49 
        value := value * 2 + (character - "0")               '
  if byte[stringptr] == "-"
     value := - value

PUB GetFloat  : value | tempstr[11]     'Gets a floating point number from the PST (ex. 3.14159HELPIMTRAPPEDINAUNIVERSEFACTORY9302)                                                                      
  GetStr(@tempstr)
  value:= StrToFloat(@tempstr)         'Returns value in IEEE 754 float point

PUB StrToFloat(strptr) : flt | int,exp,sign
  'Converts an input string in the from XX.XX (with an integer, decimal point, and fraction part)
  ' into a floating point number
  ' This code was borrowed from http://forums.parallax.com/forums/default.aspx?f=25&m=280607 (11/21/2008)
  int := exp := sign := 0
  repeat strsize(strptr)                   'string to integer
    case byte[strptr]
      "-":      sign~~
      ".":      exp := 1
      "0".."9": int := int*10 + byte[strptr] - "0"
                if exp
                  exp++                    'count dec places
      other:    quit
    strptr++
  if sign
    int := -int
  flt := FFloat(int)
  if exp
    repeat exp-1
      flt := FDiv(flt,10.0)                'adjust float

PUB Char(bytechr)
  'This method was borrowed directly from the "Parallax Serial Terminal Plus" object
  'Send single-byte character.  Waits for room in transmit buffer if necessary.
  { 
  Parameter:
    bytechr - character (ASCII byte value)
              to send.
  Examples:
    'Send "A" to Parallax Serial Terminal
    pst.Char("A")
    'Send "A" to Parallax Serial Terminal
    'using its ASCII value
    pst.Char(65)              
  }

  ifnot cog
    start

  repeat until (tx_tail <> ((tx_head + 1) & 63))
  tx_buffer[tx_head] := bytechr
  tx_head := (tx_head + 1) & 63

  if rxtx_mode & %1000
    CharIn

PUB CharIn : bytechr
  'This method was borrowed directly from the "Parallax Serial Terminal Plus" object
  'Send single-byte character.  Waits for room in transmit buffer if necessary.

  {Returns:
    A byte value (0 to 255) which
    represents a character that has been typed 
    into the Parallax Serial Terminal.
   
  Example:
    ' Get a character that is typed into the
    ' Parallax Serial Terminal, and copy it to
    ' a variable named c.
    c := pst.CharIn
  }

  ifnot cog
    start

  repeat while (bytechr := RxCheck) < 0
    
    
PUB tx(txbyte)                                          'Sends byte (may wait for room in buffer)
  repeat until (tx_tail <> (tx_head + 1) & $F)
  tx_buffer[tx_head] := txbyte
  tx_head := (tx_head + 1) & $F
  if rxtx_mode & %1000
    rx

PUB rx : rxbyte                                         'Receives byte (may wait for byte)
  repeat while (rxbyte := rxcheck) < 0                  'rxbyte returns $00..$FF

PUB rxflush                                             'Flush receive buffer 
  repeat while rxcheck => 0
    
PUB rxcheck : rxbyte                                    'Check if byte received (never waits) 
  rxbyte--                                              ' rxbyte returns -1 if no byte received, $00..$FF if byte
  if rx_tail <> rx_head
    rxbyte := rx_buffer[rx_tail]
    rx_tail := (rx_tail + 1) & $F

PUB rxtime(ms) : rxbyte | t                             'Wait ms milliseconds for a byte to be received
  t := cnt                                              ' returns -1 if no byte received, $00..$FF if byte 
  repeat until (rxbyte := rxcheck) => 0 or (cnt - t) / (clkfreq / 1000) > ms

PUB getstr(stringptr) | index
  'Gets zero terminated string and stores it, starting at the stringptr memory address             
  index~                                                                                             
  repeat until (byte[stringptr][index++] := rx) == CR    'CR=Carriage Return=13 (Enter key)                                            
    if (byte[stringptr][index]) == BKSP          'BKSP=8=Backspace (Backspace key)                                              
      index--                                                                                        
  byte[stringptr][--index]~                                                                          

PUB hex(value, digits)
  'Prints a hexadecimal number
  value <<= (8 - digits) << 2
  repeat digits
    tx(lookupz((value <-= 4) & $F : "0".."9", "A".."F"))

PUB GetHex : value | tempstr[11]
  'Gets hexadecimal character representation of a number from the terminal and returns the corresponding value                                                                                   
  GetStr(@tempstr)                                                                       
  value := StrToHex(@tempstr)                                                            

PUB StrToHex(stringptr) : value | character, index
  'Converts a zero terminated string representaton of a hexadecimal number to a value                                                                                          
  value := index := 0                                                                             
  repeat until ((character:= byte[stringptr][index++]) == 0)                                          
     if (character => "0" and character =< "9")                                                             
        value := value * 16 + (character - "0")                                                        
     elseif (character => "A" and character =< "F")                                                         
        value := value * 16 + (10 + character - "A")                                                   
     elseif(character => "a" and character =< "f")                                                          
        value := value * 16 + (10 + character - "a")                                                   
  if byte[stringptr] == "-"                                                                       
     value := - value                                                                             

PUB FFloat(integer) : single | s, x, m
  'Converts an integer number to a floating-point-formatted number
  if m := ||integer             'absolutize mantissa, if 0, result 0
    s := integer >> 31          'get sign
    x := >|m - 1                'get exponent
    m <<= 31 - x                'msb-justify mantissa
    m >>= 2                     'bit29-justify mantissa
    return Pack(@s)             'pack result

PUB FDiv(singleA, singleB) : single | sa, xa, ma, sb, xb, mb
  'Divide singleA by singleB (which are two floating-point values)
  Unpack(@sa, singleA)          'unpack inputs
  Unpack(@sb, singleB)
  sa ^= sb                      'xor signs
  xa -= xb                      'subtract exponents
  repeat 30                     'divide mantissas
    result <<= 1
    if ma => mb
      ma -= mb
      result++        
    ma <<= 1
  ma := result
  return Pack(@sa)              'pack result

PRI Pack(pointer) : single | s, x, m
'Pack floating-point from (sign, exponent, mantissa) at pointer

  longmove(@s, pointer, 3)      'get (s,x,m) structure into locals

  if m                          'if mantissa 0, result 0
  
    result := 33 - >|m          'determine magnitude of mantissa
    m <<= result                'msb-justify mantissa without leading 1
    x += 3 - result             'adjust exponent

    m += $00000100              'round up mantissa by 1/2 lsb
    if not m & $FFFFFF00        'if rounding overflow,
      x++                       '..increment exponent
    
    x := x + 127 #> -23 <# 255  'bias and limit exponent

    if x < 1                    'if exponent < 1,
      m := $8000_0000 +  m >> 1 '..replace leading 1
      m >>= -x                  '..shift mantissa down by exponent
      x~                        '..exponent is now 0

    return s << 31 | x << 23 | m >> 9 'pack result

PRI Unpack(pointer, single) | s, x, m
'Unpack floating-point into (sign, exponent, mantissa) at pointer
  s := single >> 31             'unpack sign
  x := single << 1 >> 24        'unpack exponent
  m := single & $007F_FFFF      'unpack mantissa

  if x                          'if exponent > 0,
    m := m << 6 | $2000_0000    '..bit29-justify mantissa with leading 1
  else
    result := >|m - 23          'else, determine first 1 in mantissa
    x := result                 '..adjust exponent
    m <<= 7 - result            '..bit29-justify mantissa

  x -= 127                      'unbias exponent
  longmove(pointer, @s, 3)      'write (s,x,m) structure from locals

DAT  
'***********************************
'* Assembly language serial driver *
'***********************************
' This asynchronous serial communication driver assembly code was written by Chip Gracey et al

                        org 
entry                   mov     t1,par                'get structure address
                        add     t1,#4 << 2            'skip past heads and tails

                        rdlong  t2,t1                 'get rx_pin
                        mov     rxmask,#1
                        shl     rxmask,t2

                        add     t1,#4                 'get tx_pin
                        rdlong  t2,t1
                        mov     txmask,#1
                        shl     txmask,t2

                        add     t1,#4                 'get rxtx_mode
                        rdlong  rxtxmode,t1

                        add     t1,#4                 'get bit_ticks
                        rdlong  bitticks,t1

                        add     t1,#4                 'get buffer_ptr
                        rdlong  rxbuff,t1
                        mov     txbuff,rxbuff
                        add     txbuff,#16

                        test    rxtxmode,#%100  wz    'init tx pin according to mode
                        test    rxtxmode,#%010  wc
        if_z_ne_c       or      outa,txmask
        if_z            or      dira,txmask

                        mov     txcode,#transmit      'initialize ping-pong multitasking
'
'
' Receive
'
receive                 jmpret  rxcode,txcode         'run chunk of tx code, then return

                        test    rxtxmode,#%001  wz    'wait for start bit on rx pin
                        test    rxmask,ina      wc
        if_z_eq_c       jmp     #receive

                        mov     rxbits,#9             'ready to receive byte
                        mov     rxcnt,bitticks
                        shr     rxcnt,#1
                        add     rxcnt,cnt                          

:bit                    add     rxcnt,bitticks        'ready next bit period

:wait                   jmpret  rxcode,txcode         'run chunk of tx code, then return

                        mov     t1,rxcnt              'check if bit receive period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        test    rxmask,ina      wc    'receive bit on rx pin
                        rcr     rxdata,#1
                        djnz    rxbits,#:bit

                        shr     rxdata,#32-9          'justify and trim received byte
                        and     rxdata,#$FF
                        test    rxtxmode,#%001  wz    'if rx inverted, invert byte
        if_nz           xor     rxdata,#$FF

                        rdlong  t2,par                'save received byte and inc head
                        add     t2,rxbuff
                        wrbyte  rxdata,t2
                        sub     t2,rxbuff
                        add     t2,#1
                        and     t2,#$0F
                        wrlong  t2,par

                        jmp     #receive              'byte done, receive next byte
'
'
' Transmit
'
transmit                jmpret  txcode,rxcode         'run chunk of rx code, then return

                        mov     t1,par                'check for head <> tail
                        add     t1,#2 << 2
                        rdlong  t2,t1
                        add     t1,#1 << 2
                        rdlong  t3,t1
                        cmp     t2,t3           wz
        if_z            jmp     #transmit

                        add     t3,txbuff             'get byte and inc tail
                        rdbyte  txdata,t3
                        sub     t3,txbuff
                        add     t3,#1
                        and     t3,#$0F
                        wrlong  t3,t1

                        or      txdata,#$100          'ready byte to transmit
                        shl     txdata,#2
                        or      txdata,#1
                        mov     txbits,#11
                        mov     txcnt,cnt

:bit                    test    rxtxmode,#%100  wz    'output bit on tx pin 
                        test    rxtxmode,#%010  wc    'according to mode
        if_z_and_c      xor     txdata,#1
                        shr     txdata,#1       wc
        if_z            muxc    outa,txmask        
        if_nz           muxnc   dira,txmask
                        add     txcnt,bitticks        'ready next cnt

:wait                   jmpret  txcode,rxcode         'run chunk of rx code, then return

                        mov     t1,txcnt              'check if bit transmit period done
                        sub     t1,cnt
                        cmps    t1,#0           wc
        if_nc           jmp     #:wait

                        djnz    txbits,#:bit          'another bit to transmit?

                        jmp     #transmit             'byte done, transmit next byte
'
'
' Uninitialized data
'
t1                      res     1
t2                      res     1
t3                      res     1

rxtxmode                res     1
bitticks                res     1

rxmask                  res     1
rxbuff                  res     1
rxdata                  res     1
rxbits                  res     1
rxcnt                   res     1
rxcode                  res     1

txmask                  res     1
txbuff                  res     1
txdata                  res     1
txbits                  res     1
txcnt                   res     1
txcode                  res     1

{{
┌──────────────────────────────────────────────────────────────────────────────────────┐
│                           TERMS OF USE: MIT License                                  │                                                            
├──────────────────────────────────────────────────────────────────────────────────────┤
│Permission is hereby granted, free of charge, to any person obtaining a copy of this  │
│software and associated documentation files (the "Software"), to deal in the Software │ 
│without restriction, including without limitation the rights to use, copy, modify,    │
│merge, publish, distribute, sublicense, and/or sell copies of the Software, and to    │
│permit persons to whom the Software is furnished to do so, subject to the following   │
│conditions:                                                                           │                                            │
│                                                                                      │                                               │
│The above copyright notice and this permission notice shall be included in all copies │
│or substantial portions of the Software.                                              │
│                                                                                      │                                                │
│THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,   │
│INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A         │
│PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT    │
│HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION     │
│OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE        │
│SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                │
└──────────────────────────────────────────────────────────────────────────────────────┘
}}