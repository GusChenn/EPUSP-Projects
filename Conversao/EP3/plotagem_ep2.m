format long g
clear all
clc
close all

%Declaração de dados:
%------------------------------------------------------------------------------------
s = 0.02;
f = 60; %[Hz]
PutilNom = 10*745.7; %[W]
Vnom = 460/sqrt(3); %[V(Y) transformado em tensão de fase]
p = 2; %[pares de polos]
m = 3; %numero de fases

%parametros do circuito equivalente
R1 = 0.54;
X1 = 2.093;
R2 = 0.488;
X2 = 3.209;
Xm = 51.12;
Prot = 350;
Rutil = R2*(1-s)/s;
%------------------------------------------------------------------------------------

%Cálculo de parâmetros:
ns = f*60/p; %[RPM]
n = ns*(1-s); %[RPM]

%calculo das rotações do rotor e do campo girante:
wr = 2*pi*n/60; %[rad/s]
ws = 2*pi*ns/60; %[rad/s]

%calculo do equivalente de thevenin:
Zth = (1i*Xm*(R1 + 1i*X1))/(R1 + 1i*(X1 + Xm));
Vth = abs((1i*Xm*Vnom)/(R1 + 1i*(X1 + Xm)));
Rth = real(Zth);
Xth = imag(Zth);

%Resolução do circuito:
%calculo de I2
I2 = abs(Vth/(Zth + R2 + 1i*X2 + Rutil));
e1 = abs((R2 + Rutil + 1i*X2)*I2);
I0 = abs(e1/(1i*Xm));

%calculo da corrente absorvida:
I1 = I2 + I0;

%calculo das potencias:
Putil = 3*Rutil*(I2^2)
Pjr = 3*R2*(I2^2);
Pje = 3*R1*(I1^2);

%considerando a potência útil calculada, temos
Pfor = Putil + Pjr + Pje + Prot;

%Calculo do rendimento
Rendimento = Putil/Pfor;

%calculo do torque
Tutil = Putil/wr;
Tmax = 3*((1/(2*ws)) * ((Vth^2)/(Rth + sqrt(Rth^2 + (Xth + X2)^2))));
sMax = R2/sqrt(Rth^2 + (Xth + X2)^2);

%calculo do fator de potencia:
fp = (Rth + (R2/s))/sqrt((Rth + (R2/s))^2 + (Xth + X2)^2) %????????

%curva torque x rotação:
graf1 = figure('name', 'curva Torque x Rotação');
title("Curva Torque x Rotação");
xlabel("Escorregamento [s]");
ylabel("Valor nominal [%]");

%plota linhas auxiliares
k = -1.5:0.0001:1.5;
line([-1.5 1.3], [0 0], 'color', 'k');
line([1 1], [4 -4], 'color', 'k');
hold on;

%calcula e plota a curva T x s
I2plot = abs(Vth./(Zth + (R2./k) + 1i*X2));
PjrPlot = 3*R2.*I2plot.^2;
P12Plot = PjrPlot./k;
y = (P12Plot*wr)/(ws*PutilNom);
torque = plot(k, y, 'color', 'b');
hold on;

%calcula e plota a curva I1 x s
Iplot = (I2plot + I0)/I1;
corrente = plot(k, Iplot, 'color', 'r');
hold on;

%plota os pontos relevantes
po = plot(s,1, "color", "k", 'o','MarkerSize',8);
TmaxPlot = plot(sMax,((Tmax*ws)/PutilNom), "color", "green", 'o','MarkerSize',8);

%recalcula os valores de P12 e I2 com k = 1 (partida)
k = 1;
I2plot = abs(Vth/(Zth + (R2/k) + 1i*X2));
PjrPlot = 3*R2*I2plot^2;
P12Plot = PjrPlot/k;

%plota em porcentagem do valor nominal
Tpartida = plot(1, ((P12Plot*wr)/(ws*PutilNom)), 'color', 'cyan', 'o', 'MarkerSize', 8);
Ipartida = plot(1, ((I2plot + I0)/I1), 'color', 'magenta', 'o', 'MarkerSize', 8);
legend([po, TmaxPlot, Tpartida, Ipartida, torque, corrente],'Ponto de operação', 'Torque máximo', 'Torque de partida', 'Corrente de partida', 'Curva T x s', 'Curva I1 x s', 'location', 'southeast');
grid on;

%curva torque x rotação:
graf2 = figure('name', 'curva 2');
title("Curvas de Rendimento e de Corrente absorvida");
xlabel("Potência nominal [%]");
ylabel("[%]");
hold on;

%calculo do rendimento
j=0:0.001:1.5;
PutilPlot = Putil.*j;
I2_ = sqrt((s.*PutilPlot)/(3*R2*(1-s)));
I1_ = I2_ + I0;
Pjr_ = 3*R2*(I2_.^2);
Pje_ = 3*R1*(I1_.^2);
Pfor_ = PutilPlot + Pjr_ + Pje_ + Prot;
Rendimento_ = PutilPlot./Pfor_;

%plota a curva de rendimento
rend = plot(j, Rendimento_);
hold on;
ponto_rend = plot(1, Rendimento, 'o', 'MarkerSize', 8);
hold on;
Iabsorvida = plot(j, (I1_/I1));
ponto_i = plot(1, 1, 'o', 'MarkerSize', 8);
grid on;

legend([rend, Iabsorvida, ponto_rend, ponto_i], 'Curva de rendimento [%]', 'Curva da corrente absorvida [% do valor nominal]', 'Rendimento nominal', 'Corrente absorvida nominal', 'location', 'southeast');
