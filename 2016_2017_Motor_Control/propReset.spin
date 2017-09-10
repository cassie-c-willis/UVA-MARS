CON
  LED1 = 16
  LED2 = 17
  LED3 = 18

PUB Main
  dira[LED1] := 1
  dira[LED2] := 1
  dira[LED3] := 1

  !outa[LED1]
  !outa[LED2]
  !outa[LED3]
  waitcnt(clkfreq/5+cnt)
  !outa[LED1]
  !outa[LED2]
  !outa[LED3]
  waitcnt(clkfreq/5+cnt)
  !outa[LED1]
  !outa[LED2]
  !outa[LED3]
  waitcnt(clkfreq/5+cnt)
  !outa[LED1]
  !outa[LED2]
  !outa[LED3]
  waitcnt(clkfreq/5+cnt)
  !outa[LED1]
  !outa[LED2]
  !outa[LED3]
  waitcnt(clkfreq/5+cnt)
  !outa[LED1]
  !outa[LED2]
  !outa[LED3]