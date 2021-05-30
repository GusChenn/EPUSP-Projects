clear title xlabel ylabel
%1. Gera��o dos n�meros A, B, C, D:
% nusp(1) = 10772925;
% nusp(2) = 10773307;
% nusp(3) = 10823852;
% nusp(4) = 10773930;
% nusp(5) = 10880975;
% nusp(6) = 9912532;

A = (9)/6;
B = (7+7+8+7+8+1)/600;
C = (7+7+2+7+8+2)/600;
D = (2+3+3+3+5)/60;

%2. Declara��o de dados: 
%A posi��o do valor no vetor equivale ao n�mero da medi��o
mi = [34.8, 37.8, 38.7, 35.5, 33.9, 35.1]; %[kg]
mf = [136.1, 162.5, 151.1, 148.8, 173.7, 35.1]; %[kg]
mf = mf + A;
mf(6) = 35.1;
deltaT = [67.8, 57.8, 44.2, 38.9, 43, 60]; %[s]
n = 6; %[medi��es]
g = 9.81; %[m/s^2]
gamaAgua = 1000; %[kgf/m^3]
gamaHg = 133280; %[N/m^3]
rhoAgua = 1000; %[kg/m^3]
rhoHg = 13600; %[kg/m^3]
uAgua = 0.001; %[Pa.s]
h = [0, 9.8, 20.1, 29.2, 36.6, 44.3];
h = h + D;
D1 = 3.8; %[cm]
D2 = 1.935; %[cm]

%2. C�lculo das vaz�es: sabendo que Q = (mf - mi)/deltaT*gamaAgua:
Qpesagem = zeros(6,1);
for i=1:1:n
    Qpesagem(i) = (mf(i) - mi(i))/(deltaT(i)*gamaAgua); %[m^3/s]
end;

%corre��o da posi��o do teste com vaz�o nula: colocando posi��o 6 do vetor
%na posi��o 1 e empurrando todos os outros valores pra frente

temp = Qpesagem(6);
for i=n:-1:2
    Qpesagem(i) = Qpesagem(i-1);
end;
Qpesagem(1) = temp;

%3. Quest�o a: gr�fico h = h(Q):
f1 = figure;
plot(Qpesagem, h);
hold on;
grid on;
plot(Qpesagem, h, 'o', 'color', 'blue')
title('Curva h = h(Q)');
xlabel('Q [10^-^3 m^3/s]');
ylabel('h [cm]');
hold off;

%4. Quest�o B: C�lculo de V1, Re e C:
S1 = pi*(D1/2)^2;
S2 = pi*(D2/2)^2;
V1 = zeros(n,1);
Re = zeros(n,1);
C = zeros(n,1);
gamaAgua = 9800; %[N/m^3]

for i=1:n
    V1(i) = Qpesagem(i)/(S1*1e-4);
    Re(i) = rhoAgua*V1(i)*D1*1e-2/uAgua;
    C(i) = Qpesagem(i)/(S2*1e-4*sqrt(2*h(i)*1e-2*((gamaHg - gamaAgua)/rhoAgua)));
end;
%c�lculo de C m�dio:
Cmedio = mean(C(2:6));
CmedioVetor = Cmedio * ones(5,1);

%5. Quest�o B: Curva C = C(Re):
f2 = figure;
plot(Re(2:6), C(2:6));
title('Curva C = C(Re)')
xlabel('Re [10^4]');
ylabel('C');
ylim([0.7 1.3]);
xlim([5e4 115e3]);
hold on;
grid on;
plot(Re(2:6), C(2:6), 'o', 'color', 'blue');
plot(Re(2:6), CmedioVetor,':', 'color', 'black');
hold off;

%6. Quest�o C: C�lculo da nova vaz�o Qquerosene:
rhoQuerosene = 780; %[kg/m^3]
gamaQuerosene = 7644; %[N/m^3]
Qquerosene = zeros(6,1);
for i=1:n
    Qquerosene(i) = C(i)*S2*1e-4*sqrt(2*h(i)*1e-2*((gamaHg - gamaQuerosene)/rhoQuerosene));
end;

%7. Quest�o C: Curva h = h(Qquerosene)
f3 = figure;
plot(Qquerosene, h);
hold on;
grid on;
plot(Qquerosene, h, 'o', 'color', 'blue');
title('Curva h = h(Qquerosene)');
xlabel('Q [10^-^3 m^3/s]');
ylabel('h [cm]');

% Quest�o C: Compara��o:
f4 = figure;
plot(Qpesagem, h);
hold on;
grid on;
plot(Qquerosene, h, 'color', 'red');
plot(Qpesagem, h, 'o', 'color', 'blue');
plot(Qquerosene, h, 'o', 'color', 'red');
legend('Vaz�o com �gua', 'Vaz�o com Querosene', 'location', 'se');
title('Compara��o de vaz�es');
xlabel('Q [10^-^3 m^3/s]');
ylabel('h [cm]');

% Quest�o D: C�lculo da nova vaz�o:
rhoAlcool = 788.3; %[kg/m^3]
gamaAlcool = 7725.34; %[N/m^3]
hAlcool = 0.15;
QAlcool = Cmedio*S2*1e-4*sqrt(2*hAlcool*((gamaHg - gamaAlcool)/rhoAlcool));

% Exporta��o dos gr�ficos:
saveas(f1, 'hQ.png');
saveas(f2, 'cRe.png');
saveas(f1, 'hQquerosene.png');
saveas(f1, 'hQcomparacao.png');
