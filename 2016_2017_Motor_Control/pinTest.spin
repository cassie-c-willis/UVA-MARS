CON

testPin = 9


PUB Main

dira[testPin] := 1

repeat
        !outa[testPin]  
        waitcnt(clkfreq + cnt)

