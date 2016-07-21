%-------------------------------------------------------------
% Calcolo del contenuto di acqua lungo una colonna 
% orizzontale di suolo per punti diversi nel tempo, 
% risolvendo l''equazione di Richards (opportunamente
% semplificata) con uno schema iterativo esplicito alle
% differenze finite.
%-------------------------------------------------------------
 
% Pulisce il terminale dalle precedenti variabili
clear
% Trattiene il plot per la creazione di curve sovrapposte
hold
 
%------------------------------------------------
% Condizioni al contorno per il contenuto di acqua
%------------------------------------------------
Theta0=0.3; % Contenuto di acqua mantenuto costante sulla cima della
            % colonna di suolo per tutta la durata della simulazione.
Theta1=0.1; % Contenuto di acqua lungo la colonna a t=0, e anche
            % il contenuto di acqua mantenuto costante al termine della
            % colonna. Notare che Theta1 < Theta0, quindi per diffusione
            % ci aspettiamo che si instauri un flusso dalla cima al piede
            % della colonna.
            
%--------------------------------------
%  Dimensioni del problema @\circled{1}@ 
%--------------------------------------
% Lunghezza della colonna
L=0.1;%meters
% Numero di punti della griglia spaziale
I=100;
% Intervallo spaziale
Delta_x=L/I;
 
% Secondi interessati dalla simulazione
T=60*60*24; % Un giorno
% Numero di punti nella griglia temporale
J=10000;
% Intervallo temporale
Delta_t=T/J;
 
% Coefficiente di diffusione per un terreno semipermeabile
% Vedi FAO @\circled{2}@ 
K=6.3e-9;%m/s
 
Lambda=K*(Delta_t)/((Delta_x)^2);
 
% Check per la convergenza della rappresentazione @\circled{3}@ 
if Lambda<=0||Lambda>0.5 
    disp('Il parametro Lamba deve essere compreso tra 0 e 0.5 affinchè la soluzione sia stabile.')
    disp('Correggi gli intervalli spaziali e temporali per ovviare al problema.');
    err_lambda = strcat('Lambda = ',num2str(Lambda));
    disp(err_lambda);
    pause;    
end
 
%-------------------------------------------------------------------
% Creazione della matrice dei contenuti di acqua per la colonna di suolo
% La variabile temporale è sulle colonne, mentre quella spaziale
% sulle righe  @\circled{4}@ 
%-------------------------------------------------------------------
 

Theta=zeros(I,J); 
Theta(:,1)=Theta1; % Il contenuto di acqua è uguale a Theta1 tranne
                   %che sulla cima della colonna
% Condizioni al contorono sulla cima e sul termine della colonna
Theta(1,:)=Theta0; % Ad ogni tempo, il contenuto di acqua sulla 
                   %cima della colonna è assunto costante
Theta(I,:)=Theta1; % ..Idem per il piede della colonna, ma 
                   % settato a Theta1
 
%-----------------------------------------------
%  Calcolo di Theta(x,t) con schema esplicito @\circled{5}@ 
%-----------------------------------------------
 
for j=2:(J)     
  for i=2:(I-1)
      Theta(i,j)=Lambda*Theta((i-1),(j-1))+(1-2*Lambda)*Theta(i,(j-1))+Lambda*Theta((i+1),(j-1));
  end   
end
 
%----------------------------
%  Visualizza Theta(x,t) @\circled{6}@ 
%----------------------------

x = linspace(0,L,I);
 
% Il grafico viene visualizzato ogni T_int step
T_int=1000;
% Valori massimi e minimi per il grafico
max_Theta=max(Theta)*1.5;
axis([0 L 0 max_Theta(1)])
 
% Etichette
title('Contenuto d''acqua VS distanza dalla cima della colonna di suolo')
xlabel('Distanza dalla cima della colonna (m)')
ylabel('Contenuto d''acqua (\Theta)')
 
for j=1:T_int:J    
    % Grafica il contenuto d'acqua sulla colonna al tempo j
    plot(x,Theta(:,j),'B-');
    
    % Annota il tempo ogni due grafici
    if round((j-1)/(3*T_int))== (j-1)/(3*T_int) 
        % Crea una etichetta per mostrare il tempo per il grafico corrente
        etichetta_tempo = strcat('T = ', num2str(round(j*Delta_t/100)*100),' secs');  
        text(L/4,Theta(I/4,j),etichetta_tempo,'HorizontalAlignment','left','Interpreter','latex');
        % 'BackgroundColor',[.7 .9 .7]);
    end
end
 
%----------------------------------------------------------- 
% Calcola il tasso di infiltrazione sulla cima della colonna @\circled{7}@ 
%-----------------------------------------------------------
inf_rate=K*(Theta(1,:)-Theta(2,:))/(Delta_x);
 
figure
hold
 
title('Tasso di infiltrazione (m/s) VS tempo (s) sulla cima della colonna di suolo')
ylabel('Tasso di infiltrazione (m/s)')
xlabel('Tempo (s)')
 
t = linspace(0,T,J);
plot(t,inf_rate,'B-');
 
%----------------------------------------------------------- 
% Calcolo della infiltrazione cumulata @\circled{8}@ 
%-----------------------------------------------------------
inf_accum=inf_rate;
inf_accum(:)=0;      
 
for j=2:J
    inf_accum(j)=inf_accum(j-1)+Delta_t*inf_rate(j-1);
end
 
figure
hold
 
title('Infiltrazione cumulata (m) VS tempo (s) sulla cima della colonna di suolo')
ylabel('Infiltrazione cumulata (m)')
xlabel('Tempo (s)')
 
plot(t,inf_accum,'R-');
 
% Visualizza la infiltrazione a t=0
hour = 0;
disp (hour);
disp (inf_rate(1)*1000*3600);
disp (inf_accum(1)*1000);

% Visualizza la infiltrazione a t= 6,12,18,24 ore
for hour=6:6:24
j=int32(3600*hour/Delta_t);
disp (hour);
disp (inf_rate(j)*1000*3600);
disp (inf_accum(j)*1000);
 
end
 
