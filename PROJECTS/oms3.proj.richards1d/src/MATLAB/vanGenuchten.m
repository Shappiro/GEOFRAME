function [C,K,theta] = vanGenuchten(h,phi)
% Per ogni intervallo di tempo e per ogni cella del dominio

alpha   = phi(1);
theta_S = phi(2);
theta_R = phi(3);
n       = phi(4);
m       = phi(5);
Ksat    = phi(6);

% Contenuto volumetrico di umidità 
theta = (theta_S - theta_R)./(1 + (alpha.*abs(h)).^n).^m + theta_R;

% Saturazione effettiva
Se = ((theta - theta_R)./(theta_S - theta_R));

% Conduttività idraulica
K = Ksat.*Se.^(1/2).*(1 - (1 - Se.^(1/m)).^m).^2;

% Storatività di umidità specifica
C = -alpha.*n.*sign(h).*(1/n - 1).*(alpha.*abs(h)).^(n - 1).*(theta_R - theta_S).*((alpha.*abs(h)).^n + 1).^(1/n - 2);

end