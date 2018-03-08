//
// automatically generated by spin2cpp v3.6.4 on Thu Mar  8 17:13:03 2018
// /home/volsungasaga/Downloads/spin2cpp/build/spin2cpp --gas --side MainFinal (PST_Control).spin 
//

// ********************************************
// *  Full-Duplex Serial Driver v1.2          *
// *  Author: Chip Gracey, Jeff Martin        *
// *  Copyright (c) 2006-2009 Parallax, Inc.  *
// *  See end of file for terms of use.       *
// ********************************************
/* -----------------REVISION HISTORY-----------------
 v1.2 - 5/7/2009 fixed bug in dec method causing largest negative value (-2,147,483,648) to be output as -0.
 v1.1 - 3/1/2006 first official release.
 */
#include <stdlib.h>
#include <propeller.h>
#undef clkset
#undef cogid
#undef cogstop
#undef locknew
#undef lockret
#undef lockclr
#undef lockset
#undef waitcnt
#undef waitpeq
#undef waitpne
#define _waitcnt(x) __builtin_propeller_waitcnt((x), 0)
#include "FullDuplexSerial.h"

#define INLINE__ static inline
#define Yield__() __asm__ volatile( "" ::: "memory" )
INLINE__ int32_t Rotl__(uint32_t a, uint32_t b) { return (a<<b) | (a>>(32-b)); }
INLINE__ int32_t Rotr__(uint32_t a, uint32_t b) { return (a>>b) | (a<<(32-b)); }
INLINE__ int32_t Lookup__(int32_t x, int32_t b, int32_t a[], int32_t n) { int32_t i = (x)-(b); return ((unsigned)i >= n) ? 0 : (a)[i]; }

extern char _dat_FullDuplexSerial_[] __asm__("..dat_start");
#define _tostr__(...) #__VA_ARGS__
#define _tostr_(...) _tostr__(__VA_ARGS__)
#define _dat_(...) __asm__(_tostr_(__VA_ARGS__) "\n")
#define _lbl_(x) (x - _org_)
#define _org_ ..dat_start
extern int32_t entry[] __asm__("entry");
_dat_(            .section .FullDuplexSerial.dat,"ax"                 );
_dat_(            .compress off                                       );
_dat_(  ..dat_start:                                                  );
                  // ***********************************
                  // * Assembly language serial driver *
                  // ***********************************

#undef _org_
#define _org_ ..org0002
_dat_(..org0002_base = . + 0x0                                        );
_dat_(  entry:                                                        );
                  //
                  //
                  // Entry
                  //
                  // get structure address
_dat_(            mov     _lbl_(t1), par                              );
                  // skip past heads and tails
_dat_(            add     _lbl_(t1), #(4 << 2)                        );
                  // get rx_pin
_dat_(            rdlong  _lbl_(t2), _lbl_(t1)                        );
_dat_(            mov     _lbl_(rxmask), #1                           );
_dat_(            shl     _lbl_(rxmask), _lbl_(t2)                    );
                  // get tx_pin
_dat_(            add     _lbl_(t1), #4                               );
_dat_(            rdlong  _lbl_(t2), _lbl_(t1)                        );
_dat_(            mov     _lbl_(txmask), #1                           );
_dat_(            shl     _lbl_(txmask), _lbl_(t2)                    );
                  // get rxtx_mode
_dat_(            add     _lbl_(t1), #4                               );
_dat_(            rdlong  _lbl_(rxtxmode), _lbl_(t1)                  );
                  // get bit_ticks
_dat_(            add     _lbl_(t1), #4                               );
_dat_(            rdlong  _lbl_(bitticks), _lbl_(t1)                  );
                  // get buffer_ptr
_dat_(            add     _lbl_(t1), #4                               );
_dat_(            rdlong  _lbl_(rxbuff), _lbl_(t1)                    );
_dat_(            mov     _lbl_(txbuff), _lbl_(rxbuff)                );
_dat_(            add     _lbl_(txbuff), #$10                         );
                  // init tx pin according to mode
_dat_(            test    _lbl_(rxtxmode), #4    wz                   );
_dat_(            test    _lbl_(rxtxmode), #2    wc                   );
_dat_(  if_z_ne_c or      outa, _lbl_(txmask)                         );
_dat_(  if_z      or      dira, _lbl_(txmask)                         );
                  // initialize ping-pong multitasking
_dat_(            mov     _lbl_(txcode), #(_lbl_(transmit)/4)         );
                  // let user know COG started
_dat_(            wrlong  _lbl_(zero), par                            );
_dat_(  receive:                                                      );
                  //
                  //
                  // Receive
                  //
                  // run a chunk of transmit code, then return
_dat_(            jmpret  _lbl_(rxcode), _lbl_(txcode)                );
                  // wait for start bit on rx pin
_dat_(            test    _lbl_(rxtxmode), #1    wz                   );
_dat_(            test    _lbl_(rxmask), ina    wc                    );
_dat_(  if_z_eq_c jmp     #_lbl_(receive)                             );
                  // ready to receive byte
_dat_(            mov     _lbl_(rxbits), #9                           );
_dat_(            mov     _lbl_(rxcnt), _lbl_(bitticks)               );
_dat_(            shr     _lbl_(rxcnt), #1                            );
_dat_(            add     _lbl_(rxcnt), cnt                           );
_dat_(  Receive_bit:                                                  );
                  // ready next bit period
_dat_(            add     _lbl_(rxcnt), _lbl_(bitticks)               );
_dat_(  Receive_wait:                                                 );
                  // run a chuck of transmit code, then return
_dat_(            jmpret  _lbl_(rxcode), _lbl_(txcode)                );
                  // check if bit receive period done
_dat_(            mov     _lbl_(t1), _lbl_(rxcnt)                     );
_dat_(            sub     _lbl_(t1), cnt                              );
_dat_(            cmps    _lbl_(t1), #0    wc                         );
_dat_(  if_nc     jmp     #_lbl_(Receive_wait)                        );
                  // receive bit on rx pin
_dat_(            test    _lbl_(rxmask), ina    wc                    );
_dat_(            rcr     _lbl_(rxdata), #1                           );
_dat_(            djnz    _lbl_(rxbits), #_lbl_(Receive_bit)          );
                  // justify and trim received byte
_dat_(            shr     _lbl_(rxdata), #($20 - 9)                   );
_dat_(            and     _lbl_(rxdata), #$ff                         );
                  // if rx inverted, invert byte
_dat_(            test    _lbl_(rxtxmode), #1    wz                   );
_dat_(  if_nz     xor     _lbl_(rxdata), #$ff                         );
                  // save received byte and inc head
_dat_(            rdlong  _lbl_(t2), par                              );
_dat_(            add     _lbl_(t2), _lbl_(rxbuff)                    );
_dat_(            wrbyte  _lbl_(rxdata), _lbl_(t2)                    );
_dat_(            sub     _lbl_(t2), _lbl_(rxbuff)                    );
_dat_(            add     _lbl_(t2), #1                               );
_dat_(            and     _lbl_(t2), #$f                              );
_dat_(            wrlong  _lbl_(t2), par                              );
                  // byte done, receive next byte
_dat_(            jmp     #_lbl_(receive)                             );
_dat_(  transmit:                                                     );
                  //
                  //
                  // Transmit
                  //
                  // run a chunk of receive code, then return
_dat_(            jmpret  _lbl_(txcode), _lbl_(rxcode)                );
                  // check for head <> tail
_dat_(            mov     _lbl_(t1), par                              );
_dat_(            add     _lbl_(t1), #(2 << 2)                        );
_dat_(            rdlong  _lbl_(t2), _lbl_(t1)                        );
_dat_(            add     _lbl_(t1), #(1 << 2)                        );
_dat_(            rdlong  _lbl_(t3), _lbl_(t1)                        );
_dat_(            cmp     _lbl_(t2), _lbl_(t3)    wz                  );
_dat_(  if_z      jmp     #_lbl_(transmit)                            );
                  // get byte and inc tail
_dat_(            add     _lbl_(t3), _lbl_(txbuff)                    );
_dat_(            rdbyte  _lbl_(txdata), _lbl_(t3)                    );
_dat_(            sub     _lbl_(t3), _lbl_(txbuff)                    );
_dat_(            add     _lbl_(t3), #1                               );
_dat_(            and     _lbl_(t3), #$f                              );
_dat_(            wrlong  _lbl_(t3), _lbl_(t1)                        );
                  // ready byte to transmit
_dat_(            or      _lbl_(txdata), #$100                        );
_dat_(            shl     _lbl_(txdata), #2                           );
_dat_(            or      _lbl_(txdata), #1                           );
_dat_(            mov     _lbl_(txbits), #$b                          );
_dat_(            mov     _lbl_(txcnt), cnt                           );
_dat_(  Transmit_bit:                                                 );
                  // output bit on tx pin according to mode
_dat_(            test    _lbl_(rxtxmode), #4    wz                   );
_dat_(            test    _lbl_(rxtxmode), #2    wc                   );
_dat_(  if_z_and_c xor     _lbl_(txdata), #1                          );
_dat_(            shr     _lbl_(txdata), #1    wc                     );
_dat_(  if_z      muxc    outa, _lbl_(txmask)                         );
_dat_(  if_nz     muxnc   dira, _lbl_(txmask)                         );
                  // ready next cnt
_dat_(            add     _lbl_(txcnt), _lbl_(bitticks)               );
_dat_(  Transmit_wait:                                                );
                  // run a chunk of receive code, then return
_dat_(            jmpret  _lbl_(txcode), _lbl_(rxcode)                );
                  // check if bit transmit period done
_dat_(            mov     _lbl_(t1), _lbl_(txcnt)                     );
_dat_(            sub     _lbl_(t1), cnt                              );
_dat_(            cmps    _lbl_(t1), #0    wc                         );
_dat_(  if_nc     jmp     #_lbl_(Transmit_wait)                       );
                  // another bit to transmit?
_dat_(            djnz    _lbl_(txbits), #_lbl_(Transmit_bit)         );
                  // byte done, transmit next byte
_dat_(            jmp     #_lbl_(transmit)                            );
_dat_(  zero:                                                         );
                  //
_dat_(            .long   0                                           );
_dat_(  t1:                                                           );
                  //
                  //
                  // Uninitialized data
                  //
_dat_(            .res    1                                           );
_dat_(  t2:                                                           );
_dat_(            .res    1                                           );
_dat_(  t3:                                                           );
_dat_(            .res    1                                           );
_dat_(  rxtxmode:                                                     );
_dat_(            .res    1                                           );
_dat_(  bitticks:                                                     );
_dat_(            .res    1                                           );
_dat_(  rxmask:                                                       );
_dat_(            .res    1                                           );
_dat_(  rxbuff:                                                       );
_dat_(            .res    1                                           );
_dat_(  rxdata:                                                       );
_dat_(            .res    1                                           );
_dat_(  rxbits:                                                       );
_dat_(            .res    1                                           );
_dat_(  rxcnt:                                                        );
_dat_(            .res    1                                           );
_dat_(  rxcode:                                                       );
_dat_(            .res    1                                           );
_dat_(  txmask:                                                       );
_dat_(            .res    1                                           );
_dat_(  txbuff:                                                       );
_dat_(            .res    1                                           );
_dat_(  txdata:                                                       );
_dat_(            .res    1                                           );
_dat_(  txbits:                                                       );
_dat_(            .res    1                                           );
_dat_(  txcnt:                                                        );
_dat_(            .res    1                                           );
_dat_(  txcode:                                                       );
_dat_(            .res    1                                           );
//
// due to a gas bug, we need the .org constants to be unknown during the first pass
// so they have to be defined here, after all asm is done
//
_dat_(  .equ ..org0002, ..org0002_base                                );
_dat_(            .compress default                                   );
_dat_(            .text                                               );

int32_t FullDuplexSerial::start(int32_t rxpin, int32_t txpin, int32_t mode, int32_t baudrate)
{
  int32_t okay = 0;
  // Start serial driver - starts a cog
  // returns false if no cog available
  //
  // mode bit 0 = invert rx
  // mode bit 1 = invert tx
  // mode bit 2 = open-drain/source tx
  // mode bit 3 = ignore tx echo on rx
  stop();
  txlock = __builtin_propeller_locknew();
  strlock = __builtin_propeller_locknew();
  memset( (void *)(&rx_head), 0, sizeof(int32_t)*4);
  rx_pin = rxpin;
  tx_pin = txpin;
  rxtx_mode = mode;
  bit_ticks = CLKFREQ / baudrate;
  buffer_ptr = (int32_t)(rx_buffer);
  okay = cog = cognew((int32_t)(entry), (int32_t)(&rx_head)) + 1;
  return okay;
}

void FullDuplexSerial::stop(void)
{
  int32_t 	_tmp__0031;
  // Stop serial driver - frees a cog
  if (cog) {
    __builtin_propeller_cogstop(( ( (_tmp__0031 = cog), (cog = 0) ), _tmp__0031 ) - 1);
    __builtin_propeller_lockret(txlock);
    __builtin_propeller_lockret(strlock);
  }
  memset( (void *)(&rx_head), 0, sizeof(int32_t)*9);
}

void FullDuplexSerial::txflush(void)
{
  // Flush transmit buffer
  while (tx_tail != tx_head) {
    Yield__();
  }
}

void FullDuplexSerial::rxflush(void)
{
  // Flush receive buffer
  while (rxcheck() >= 0) {
    Yield__();
  }
}

int32_t FullDuplexSerial::rxcheck(void)
{
  int32_t rxbyte = 0;
  // Check if byte received (never waits)
  // returns -1 if no byte received, $00..$FF if byte
  rxbyte = -1;
  if (rx_tail != rx_head) {
    rxbyte = rx_buffer[rx_tail];
    rx_tail = (rx_tail + 1) & 0xf;
  }
  return rxbyte;
}

int32_t FullDuplexSerial::rxready(void)
{
  // find out if a byte is ready to receive
  // returns 0 if none ready
  return -(rx_head != rx_tail);
}

int32_t FullDuplexSerial::rxtime(int32_t ms)
{
  int32_t 	t;
  int32_t rxbyte = 0;
  // Wait ms milliseconds for a byte to be received
  // returns -1 if no byte received, $00..$FF if byte
  t = CNT;
  while (!(((rxbyte = rxcheck()) >= 0) || (((CNT - t) / (CLKFREQ / 1000)) > ms))) {
    Yield__();
  }
  return rxbyte;
}

int32_t FullDuplexSerial::rx(void)
{
  int32_t rxbyte = 0;
  // Receive byte (may wait for byte)
  // returns $00..$FF
  while ((rxbyte = rxcheck()) < 0) {
    Yield__();
  }
  return rxbyte;
}

void FullDuplexSerial::tx(int32_t txbyte)
{
  // Send byte (may wait for room in buffer)
  while (__builtin_propeller_lockset(txlock)) {
    Yield__();
  }
  while (!(tx_tail != ((tx_head + 1) & 0xf))) {
    Yield__();
  }
  tx_buffer[tx_head] = txbyte;
  tx_head = (tx_head + 1) & 0xf;
  __builtin_propeller_lockclr(txlock);
  if (rxtx_mode & 0x8) {
    rx();
  }
}

void FullDuplexSerial::str(int32_t stringptr)
{
  int32_t 	_idx__0032, _limit__0033;
  // Send string                    
  while (__builtin_propeller_lockset(strlock)) {
    Yield__();
  }
  for(( (_idx__0032 = 0), (_limit__0033 = strlen((const char *)stringptr)) ); _idx__0032 < _limit__0033; _idx__0032++) {
    tx(((char *)(stringptr++))[0]);
  }
  __builtin_propeller_lockclr(strlock);
}

int32_t FullDuplexSerial::dec(int32_t value)
{
  int32_t 	i, x, _idx__0034;
  int32_t result = 0;
  // Print a decimal number
  // Check for max negative
  x = -(value == (int32_t)0x80000000U);
  if (value < 0) {
    // If negative, make positive; adjust for max negative
    value = abs((value + x));
    // and output sign
    tx('-');
  }
  // Initialize divisor
  i = 1000000000;
  for(_idx__0034 = 0; _idx__0034 < 10; _idx__0034++) {
    // Loop for 10 digits
    if (value >= i) {
      // If non-zero digit, output digit; adjust for max negative
      tx(((value / i) + '0') + (x * -(i == 1)));
      // and digit from value
      value = value % i;
      // flag non-zero found
      result = -1;
    } else {
      if ((result) || (i == 1)) {
        // If zero digit (or only digit) output it
        tx('0');
      }
    }
    // Update divisor
    i = i / 10;
  }
  return result;
}

void FullDuplexSerial::hex(int32_t value, int32_t digits)
{
  int32_t 	_idx__0035, _limit__0036;
  static int32_t look__0039[] = {48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70, };

  // Print a hexadecimal number
  value = value << ((8 - digits) << 2);
  for(( (_idx__0035 = 0), (_limit__0036 = digits) ); _idx__0035 < _limit__0036; _idx__0035++) {
    tx(Lookup__(((value = Rotl__(value, 4)) & 0xf), 0, look__0039, 16));
  }
}

void FullDuplexSerial::bin(int32_t value, int32_t digits)
{
  int32_t 	_idx__0037, _limit__0038;
  // Print a binary number
  value = value << (32 - digits);
  for(( (_idx__0037 = 0), (_limit__0038 = digits) ); _idx__0037 < _limit__0038; _idx__0037++) {
    tx(((value = Rotl__(value, 1)) & 0x1) + '0');
  }
}

/* 

┌──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┐
│                                                   TERMS OF USE: MIT License                                                  │                                                            
├──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┤
│Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation    │ 
│files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,    │
│modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software│
│is furnished to do so, subject to the following conditions:                                                                   │
│                                                                                                                              │
│The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.│
│                                                                                                                              │
│THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE          │
│WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR         │
│COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,   │
│ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.                         │
└──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
 */
