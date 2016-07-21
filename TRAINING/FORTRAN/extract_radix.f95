PROGRAM extract_radix
IMPLICIT NONE

REAL:: a,b,c !coefficienti
REAL:: rad1,rad2 !radici
REAL:: det !determinante

WRITE(*,*) "Inserisci i coefficienti a,b,c, dell'espressione separati da spazio"
READ(*,*) a,b,c

det = b**2-4*a*c
IF(det<0.) THEN
WRITE(*,*) 'Radici complesse'
ELSE IF(ABS(det)<=1.E-6) THEN !Contengo l'errore di macchina.... Piu' o meno...
WRITE(*,*) "Due radici reali coincidenti, il qui valore e': ", (-b)/(2*a)
ELSE
WRITE(*,*) "Due radici reali, i cui valori sono rispettivamente",(-b+SQRT(det))/(2*a)," e ",(-b-SQRT(det))/(2*a)
END IF

STOP
END PROGRAM extract_radix