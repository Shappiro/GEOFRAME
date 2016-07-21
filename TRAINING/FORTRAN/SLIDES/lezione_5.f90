!	Facoltà di Ingegneria
!	Corso di Programmazione e Algoritmi
!	Ing. A. Siviglia
!
!	esercizio 2 lezione n. 5 del 15/04/2010
!	Riepilogo ciclo do e utilizzo array

PROGRAM L_5_C1
!
! Questo codice calcola la media e la standard deviation
! di n (incognito) numeri contenuti nel file dati.dat
! e scrive i risultati usando formato esponenziale nel 
! file output.dat 
!----------------------------------------------------------------------
!		dichiarazione delle variabili
  IMPLICIT NONE                       ! nessuna dichiarazione implicita
  INTEGER :: i                        ! contatore ciclo do
  INTEGER :: ierror                   ! I/O status
  INTEGER :: icont                    ! contatore dati nel file 
  INTEGER :: n                        ! massimo valore di dati su cui fare i conti
  INTEGER, PARAMETER :: MAX_SIZE =100 !valori massimi nell'array
  REAL, DIMENSION(MAX_SIZE) :: x = (/(i, I=1,MAX_SIZE)/)     !array x e inizializzazione
                                                             !con do implicito 
  REAL :: media,dev_std              !variabili media e deviazione_standard
  REAL :: somma 
!
! Apertura file dati.dat il file esiste gia' e si puo' solo leggere
!
  OPEN(UNIT=3,FILE='dati.dat',STATUS='old',ACTION='read',IOSTAT=ierror)

  openif: IF(ierror == 0)THEN
     ! il file e stato aperto corretamente: leggi i valori

     !Leggo il file dati.dat in cui non so quanti dati sono contenuti
     icont = 1  !inizializzazione contatore
     dati_in: DO
        READ(3,*,IOSTAT=ierror) x(icont)
        IF(ierror /=0) EXIT
        icont = icont +1
     END DO dati_in
!CHIUDO IL FILE DI DATI
     CLOSE(3)

!IL CICLO DO E' TERMINATO: E' PERCHE' C'E'E STATO UN ERRORE IN LETTURA
!O PERCHE' SI E' RAGGIUNTA LA FINE DEL FILE CORRETAMENTE?
     readif: IF(ierror > 0) THEN
        WRITE(*,*) 'errore nella linea',icont 
     ELSE readif ! la fine dei dati e' stata raggiunta corretamente
        WRITE(*,1010) icont
     END IF readif
1010 FORMAT(' ',"La fine dei dati e' stata raggiunta. Ci sono:",1x,I6,1x,"dati nel file")

!Assegno il numero di dati letti a n
     n = icont-1
  !
  !controllo: se n > MAX_SIZE necessito di un range dell'array x piu' grande
  !  
     IF( n > MAX_SIZE) THEN
        WRITE(*,*) 'MAX_SIZE array x superato'
        STOP
     END IF

     somma = 0.
  !calcolo della media
     DO i =1,n
        somma = somma + x(i)
     END DO
     
     media = somma/real(n)

     somma = 0.
  !calcolo della deviazione standard
     DO i =1,n
        somma = somma + (x(i)-media)**2
     END DO

     dev_std = sqrt(somma/real(n))
! I dati della deviazione standard sono immessi in un file con un certo formato
     OPEN(UNIT=4,FILE='output.dat',STATUS='replace',ACTION='write')
     WRITE(4,1030) media
     WRITE(4,1040) dev_std
     CLOSE(4)
1030 FORMAT("La media dei dati letti vale:",1x,E10.3)
1040 FORMAT("La deviazione standars dei dati letti vale:",1x,ES10.3)

  ELSE openif

     WRITE(*,*) "Errore nell'apertura del file: controllare i dati"

  END IF openif
     
  STOP
END PROGRAM L_5_C1
