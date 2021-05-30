clear all;
close all;
clc

% -----------------------------------------------
% Dados do problema
% -----------------------------------------------

modVg = 14.49 * 10^3;
Zeq = 1i*1.15;
Zlinha = 0.2779 + 1i*0.3921;
comp12 = 10;
comp23 = 16;

alfa = 1 * exp(1i*2*pi/3);
Vg = (modVg/sqrt(3))*[1, alfa*alfa, alfa];

% Barra 1 : Carga Estrela Aterrada

Z1a = 83.91 + 1i*33.01;
Z1b = 117.47 + 1i* 46.21;
Z1c = 73.42 + 1i*28.89;
Z1 = [Z1a, Z1b, Z1c];

% Barra 2 : Carga Delta

Z2ab = 617.56 + 1i*231.35;
Z2bc = 540.36 + 1i*202.43;
Z2ca = 385.97 + 1i*144.59;
Z2 = [Z2ab, Z2bc, Z2ca];

% Barra 3 : Carga Estrela Aterrada por Impedancia

Z3a = 165.26 + 1i*60.83;
Z3b = 198.32 + 1i*73;
Z3c = 123.95 + 1i*45.62;
Zn = 5.6 + 1i*2.06;
Z3 = [Z3a, Z3b, Z3c];

% -----------------------------------------------
% -------- Equacionamento do problema -----------
% -----------------------------------------------

% ---------- Matriz de admitancias --------------

Y = zeros(10,10);
for i = 1:3 
    Y(i,i) = 1/Zeq + 1/Z1(i) + 1/(Zlinha*comp12);
end
Y(4,4) = 1/(Zlinha*comp12) + 1/(Zlinha*comp23) + 1/Z2(1) + 1/Z2(3);
Y(5,5) = 1/(Zlinha*comp12) + 1/(Zlinha*comp23) + 1/Z2(1) + 1/Z2(2);
Y(6,6) = 1/(Zlinha*comp12) + 1/(Zlinha*comp23) + 1/Z2(2) + 1/Z2(3);
for i = 7:9 
    Y(i,i) = 1/Z3(i-6) + 1/(Zlinha*comp23);
end
Y(10,10) =1/Z3(1) + 1/Z3(2) + 1/Z3(3) + 1/Zn;

for i = 0:2
    Y(4+i,1+i) = -1/(Zlinha*comp12);
end
Y(5,4) = -1/Z2(1);
Y(6,4) = -1/Z2(3);
Y(6,5) = -1/Z2(2);
for i = 0:2
    Y(7+i,4+i) = -1/(Zlinha*comp23);
end
for i = 0:2
    Y(10,7+i) = -1/Z3(i+1);
end

for m = 1:10
    for n = 1:10
        Y(m,n) = Y(n,m);
    end
end

% ------------ Vetor de correntes --------------- 

I = zeros(10,1);
for i = 1:3
    I(i) = Vg(i)/Zeq;
end

% ----------- Calculo das tensoes ---------------

V = inv(Y)*I;

% ----------- Calculo da potencia ---------------

P1 = (abs(V(1))^2)/real(Z1(1)) + (abs(V(2))^2)/real(Z1(2)) + (abs(V(3))^2)/real(Z1(3));
P2 = (abs(V(4)-V(5))^2)/real(Z2(1)) + (abs(V(5)-V(6))^2)/real(Z2(2)) + (abs(V(6)-V(4))^2)/real(Z2(3));
P3 = (abs(V(7))^2)/real(Z3(1)) + (abs(V(8))^2)/real(Z3(2)) + (abs(V(9))^2)/real(Z3(3)) + (abs(V(10))^2)/real(Zn);

% ------------------ Perdas ---------------------

Perdas12 = 0;
Perdas23 = 0;

for i = 1:3
    Perdas12 = Perdas12 + (abs(V(i)-V(i+3))^2)/real(Zlinha*comp12);
    Perdas23 = Perdas23 + (abs(V(i+3)-V(i+6))^2)/real(Zlinha*comp23);
end