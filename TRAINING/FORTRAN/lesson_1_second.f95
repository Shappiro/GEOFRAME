PROGRAM somethingtodo

! Variable declaration
IMPLICIT NONE
INTEGER:: a,b
REAL:: c,d,raggio
DOUBLE PRECISION,PARAMETER:: pi=3.141592
CHARACTER(LEN=*),PARAMETER:: str1='ciao'
CHARACTER(LEN=*),PARAMETER:: str2='bello'


WRITE(*,*) 'Inserisci due numeri interi da dividere separati da spazio'
READ(*,*) a,b
WRITE(*,*) 'Il risultato della divisione è: ', a/b ! Divisione senza resto: non commuta in reale

WRITE(*,*) 'Inserisci due numeri reali separati da spazio'
READ(*,*) c,d
WRITE(*,*) 'Il risultato della divisione è: ', c/d

WRITE(*,*) 'Inserisci il raggio di una sfera'
READ(*,*) raggio
WRITE(*,*) 'Il volume della sfera è', ((4./3.)*pi)*(raggio**3) !Non è chiarissima la precedenza degli operatori

STOP
END PROGRAM somethingtodo