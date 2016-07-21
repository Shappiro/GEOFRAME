PROGRAM evaluate_temperature
IMPLICIT NONE

INTEGER :: temperature

WRITE(*,*) 'Inserisci una temperatura'
READ(*,*) temperature

SELECT CASE(temperature) !deve essere un numero intero -.-'
    CASE(:-1) 
        WRITE(*,*) 'Siamo sotto il punto di congelamento'
    CASE(1:10) 
        WRITE(*,*) 'Freddo'
    CASE (11:25) 
        WRITE(*,*) 'Optimum'
    CASE (0) 
        WRITE(*,*) 'Punto di congelamento'
    CASE DEFAULT 
        WRITE(*,*) 'DEFAULTEXPR'
END SELECT

STOP
END PROGRAM evaluate_temperature