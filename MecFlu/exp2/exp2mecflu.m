clear title xlabel ylabel
%1. Geração dos números A, B, C, D:
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

%2. Declaração de dados: 
%A posição do valor no vetor equivale ao número da medição
mi = [34.8, 37.8, 38.7, 35.5, 33.9, 35.1]; %[kg]
mf = [136.1, 162.5, 151.1, 148.8, 173.7, 35.1]; %[kg]
mf = mf + A;
mf(6) = 35.1;
deltaT = [67.8, 57.8, 44.2, 38.9, 43, 60]; %[s]
Pe = [0.141, 0.282, 0.432, 0.580, 0.72, 0];
Pe = Pe .* 1000; %[kgf/m^2]. Essas pressões são medidas positivas, mas sabemos que são efetivamente negativas.
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
n = 6; %[medições]
g = 9.81; %[m/s^2]
deltaH = 1.075; %[m]
gamaOleo = 800; %[kgf/m^3]
gamaAgua = 1000; %[kgf/m^3]

%3. Cálculo da tabela de Pap [VA],P [W], Fp e phi:
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

%4. Cálculo das vazões: sabendo que Q = (mf - mi)/deltaT*gamaAgua:
Qpesagem = zeros(6,1);
for i=1:1:n
    Qpesagem(i) = (mf(i) - mi(i))/(deltaT(i)*gamaAgua); %[m^3/s]
end;

%5. Cálculo de Ve, Vs e Hm:
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

%6. Cálculo de Ch, Cq e rendimento:
Ch = zeros(6,1);
Cq = zeros(6,1);
rend = zeros(6,1);

for i=1:1:n
    Ch(i) = ((g*Hm(i))/((ohm^2)*(Drotor^2)));
    Cq(i) = ((Qpesagem(i))/((ohm)*(Drotor^3)));
    rend(i) = 100*(9800*Hm(i)*Qpesagem(i))/(Fp(i)*W(i));
end;

%7. Questão A: Plot Hm x Q
f1 = figure;
plot(Qpesagem(1:5), Hm(1:5), 'o', 'color', 'r');
hold on;
plot(Qpesagem(1:5), Hm(1:5), 'color', 'b');
title('Carga manométrica [Hm] x Vazão [Q]');
xlabel('Q [10^-3 m^3/s]');
ylabel('Hm [m]');

%8. Questão A: plot potencia x Q
f2 = figure;
plot(Qpesagem(1:5), W(1:5));
hold on;
plot(Qpesagem(1:5), W(1:5), 'o', 'color', 'r');
title('Potência da bomba [W] x Vazão [Q]');
xlabel('Q [10^-3 m^3/s]');
ylabel('P [W]');

% Questão B: rendimento x Cq
f3 = figure;
plot(Cq(1:5), rend(1:5));
hold on;
plot(Cq(1:5), rend(1:5), 'o', 'color', 'r');
title('Rendimento [%] x Coeficiente de vazão Cq');
xlabel('Cq');
ylabel('Rendimento [%]');

% Questão B: Coeficiente manométrico Ch x Coeficiente de vazão Cq:
f4 = figure;
plot(Cq(1:5), Ch(1:5));
hold on;
plot(Cq(1:5), Ch(1:5), 'o', 'color', 'r');
title('Coeficiente manométrico Ch x Coeficiente de vazão Cq');
xlabel('Cq');
ylabel('Ch');

% Questão C: Cálculo da nova potencia consumida e gráfico:
Woleo = (gamaOleo/gamaAgua)*W;
f5 = figure;
plot(Qpesagem(1:5), Woleo(1:5), 'color', 'r');
hold on;
plot(Qpesagem(1:5), Woleo(1:5), 'o', 'color', 'r');
plot(Qpesagem(1:5), W(1:5), 'color', 'b');
plot(Qpesagem(1:5), W(1:5), 'o', 'color', 'b');
title('Comparação das potências consumidas');
xlabel('Q [10^-3 m^3/s]');
ylabel('P [W]');

% Questão D: Determinação dos novos parâmetros adimensionais:
Hmp = (4/9)*Hm;
QpPesagem = (2/27)*Qpesagem;
Wp = (8/243)*W;

% Questão D: Plot Carga manométrica Hm x Vazão Q do protótipo
f6 = figure;
plot(QpPesagem(1:5), Hmp(1:5), 'o', 'color', 'magenta');
hold on;
plot(QpPesagem(1:5), Hmp(1:5), 'color', 'black');
title('Carga manométrica Hm x Vazão Q do protótipo');
xlabel('Q [10^-3 m^3/s]');
ylabel('Hm [m]');

% Questão D: Potência consumida W x Vazão Q do protótipo:
f7 = figure;
plot(QpPesagem(1:5), Wp(1:5), 'color', 'black');
hold on;
plot(QpPesagem(1:5), Wp(1:5), 'o', 'color', 'magenta');
title('Potência da bomba [W] x Vazão [Q]');
xlabel('Q [10^-3 m^3/s]');
ylabel('P [W]');

saveas(f1, 'A_HmxQ.png');
saveas(f2, 'A_WxQ.png');
saveas(f3, 'B_rendxCq.png');
saveas(f4, 'B_ChxCq.png');
saveas(f5, 'C_WxQ.png');
saveas(f6, 'D_HmpxQp.png');
saveas(f7, 'D_WpxQp.png');