PROGRAM primo_programma
!
! Illustrazione di alcune caratteristiche sintattiche fondamentali
!

! DIchiarazione delle variabili
IMPLICIT NONE
INTEGER:: i,j
INTEGER:: k

! Acquisizione input
WRITE(*,*) 'introduci due interi separati da uno spazio'
READ(*,*) i,j

! Operazioni sulle variabili acquisite
k=i*j

! Scrittura output
WRITE(*,*) 'risultato=', k

! Termine programma
STOP
END PROGRAM primo_programma
