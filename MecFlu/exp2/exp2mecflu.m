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
Pe = [0.141, 0.282, 0.432, 0.580, 0.72, 0];
Pe = Pe .* 1000; %[kgf/m^2]. Essas press�es s�o medidas positivas, mas sabemos que s�o efetivamente negativas.
Ps = [1.7, 1.55, 1.47, 1.38, 1.29, 1.9];
Ps = Ps + B;
Ps = Ps.*10000; %[kgf/m^2]
U = 200; %[V]
I = [3.93, 4.22, 4.45, 4.65, 4.7, 3.25]; %[A]
I = I + C;
W = [1100, 1290, 1390, 1420, 1450, 880]; %[W]
ohm = 1710/60; %[rps]
Drotor = 0.200; %[m]
De = 38.8; %[mm]
Ds = 29.6; %[mm]
n = 6; %[medi��es]
g = 9.81; %[m/s^2]
deltaH = 1.075; %[m]
gamaOleo = 800; %[kgf/m^3]
gamaAgua = 1000; %[kgf/m^3]

%3. C�lculo da tabela de Pap [VA],P [W], Fp e phi:
%Com os dados anteriores, podemos calcular Pap = sqrt(3) * U * I, Fp =
%W/Pap e phi = arcos(Fp):
Pap = zeros(6,1);
Fp = zeros(6,1);
phi = zeros(6,1);
for i=1:1:n
    Pap(i) = sqrt(3)*U*I(i);
    Fp(i) = W(i)/Pap(i);
    phi(i) = acos(Fp(i))*180/pi;
end;

%4. C�lculo das vaz�es: sabendo que Q = (mf - mi)/deltaT*gamaAgua:
Qpesagem = zeros(6,1);
for i=1:1:n
    Qpesagem(i) = (mf(i) - mi(i))/(deltaT(i)*gamaAgua); %[m^3/s]
end;

%5. C�lculo de Ve, Vs e Hm:
%Sabemos que Ve = Q/(pi*(De/2)^2), Vs = Q/(pi*(Ds/2)^2) e Hm = (Ps/gama) -
%(Pe/gama) + (Vs^2)/2*g - (Ve^2)/2*g + deltaH

Ve = zeros(6,1);
Vs = zeros(6,1);
Hm = zeros(6,1);

for i=1:1:n
    Ve(i) = (Qpesagem(i)/(pi*(De/2)^2))*1e6; %[m/s]
    Vs(i) = (Qpesagem(i)/(pi*(Ds/2)^2))*1e6; %[m/s]
    Hm(i) = ((Ps(i) - Pe(i))/gamaAgua) + (((Vs(i)^2) - (Ve(i)^2))/(2*g)) + deltaH; %[m]
end;

%6. C�lculo de Ch, Cq e rendimento:
Ch = zeros(6,1);
Cq = zeros(6,1);
rend = zeros(6,1);

for i=1:1:n
    Ch(i) = ((g*Hm(i))/((ohm^2)*(Drotor^2)));
    Cq(i) = ((Qpesagem(i))/((ohm)*(Drotor^3)));
    rend(i) = 100*(9800*Hm(i)*Qpesagem(i))/(Fp(i)*W(i));
end;

%7. Quest�o A: Plot Hm x Q
f1 = figure;
plot(Qpesagem(1:5), Hm(1:5), 'o', 'color', 'r');
hold on;
plot(Qpesagem(1:5), Hm(1:5), 'color', 'b');
title('Carga manom�trica [Hm] x Vaz�o [Q]');
xlabel('Q [10^-3 m^3/s]');
ylabel('Hm [m]');

%8. Quest�o A: plot potencia x Q
f2 = figure;
plot(Qpesagem(1:5), W(1:5));
hold on;
plot(Qpesagem(1:5), W(1:5), 'o', 'color', 'r');
title('Pot�ncia da bomba [W] x Vaz�o [Q]');
xlabel('Q [10^-3 m^3/s]');
ylabel('P [W]');

% Quest�o B: rendimento x Cq
f3 = figure;
plot(Cq(1:5), rend(1:5));
hold on;
plot(Cq(1:5), rend(1:5), 'o', 'color', 'r');
title('Rendimento [%] x Coeficiente de vaz�o Cq');
xlabel('Cq');
ylabel('Rendimento [%]');

% Quest�o B: Coeficiente manom�trico Ch x Coeficiente de vaz�o Cq:
f4 = figure;
plot(Cq(1:5), Ch(1:5));
hold on;
plot(Cq(1:5), Ch(1:5), 'o', 'color', 'r');
title('Coeficiente manom�trico Ch x Coeficiente de vaz�o Cq');
xlabel('Cq');
ylabel('Ch');

% Quest�o C: C�lculo da nova potencia consumida e gr�fico:
Woleo = (gamaOleo/gamaAgua)*W;
f5 = figure;
plot(Qpesagem(1:5), Woleo(1:5), 'color', 'r');
hold on;
plot(Qpesagem(1:5), Woleo(1:5), 'o', 'color', 'r');
plot(Qpesagem(1:5), W(1:5), 'color', 'b');
plot(Qpesagem(1:5), W(1:5), 'o', 'color', 'b');
title('Compara��o das pot�ncias consumidas');
xlabel('Q [10^-3 m^3/s]');
ylabel('P [W]');

% Quest�o D: Determina��o dos novos par�metros adimensionais:
Hmp = (4/9)*Hm;
QpPesagem = (2/27)*Qpesagem;
Wp = (8/243)*W;

% Quest�o D: Plot Carga manom�trica Hm x Vaz�o Q do prot�tipo
f6 = figure;
plot(QpPesagem(1:5), Hmp(1:5), 'o', 'color', 'magenta');
hold on;
plot(QpPesagem(1:5), Hmp(1:5), 'color', 'black');
title('Carga manom�trica Hm x Vaz�o Q do prot�tipo');
xlabel('Q [10^-3 m^3/s]');
ylabel('Hm [m]');

% Quest�o D: Pot�ncia consumida W x Vaz�o Q do prot�tipo:
f7 = figure;
plot(QpPesagem(1:5), Wp(1:5), 'color', 'black');
hold on;
plot(QpPesagem(1:5), Wp(1:5), 'o', 'color', 'magenta');
title('Pot�ncia da bomba [W] x Vaz�o [Q]');
xlabel('Q [10^-3 m^3/s]');
ylabel('P [W]');

saveas(f1, 'A_HmxQ.png');
saveas(f2, 'A_WxQ.png');
saveas(f3, 'B_rendxCq.png');
saveas(f4, 'B_ChxCq.png');
saveas(f5, 'C_WxQ.png');
saveas(f6, 'D_HmpxQp.png');
saveas(f7, 'D_WpxQp.png');