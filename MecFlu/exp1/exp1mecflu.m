clear title xlabel ylabel
%1. Geração dos números A, B, C, D:
% nusp(1) = 10772925;
% nusp(2) = 10773307;
% nusp(3) = 10823852;
% nusp(4) = 10773930;
% nusp(5) = 10880975;
% nusp(6) = 9912532;

A = (7+7+2+7+8+2)/6;
B = (7+7+8+7+8+1)/6;
c = (9)/6;
D = (2+3+3+3+5)/6;

%2. Declaração de dados
mi = 7 + A; %[kg]
mf = 102 + B; %[kg]
g = 9.81;
h0 = 180 + c; %[mm]
deltaT = 45; %[s]

h(1) = 240+ D; %[mm]
h(2) = 275 + D; %[mm]
h(3) = 290 + D; %[mm]
h(4) = 300 + D; %[mm]
h(5) = 305+ D; %[mm]
h(6) = 305 + D; %[mm]
h(7) = 300 + D; %[mm]
h(8) = 290 + D; %[mm]
h(9) = 275 + D; %[mm]
h(10) = 240 + D; %[mm]

h = h./1000;
rhoAgua = 1000; %[kg/m^3]
rhoAr = 1.2754; %[kg/m^3]
%3. Calculo do perfil de velocidades
%3.1. calculo das alturas reais

%3.2. calculo do perfil de velocidades
perfilV = zeros(12,1);
for k=1:1:10
    perfilV(k+1) = sqrt(g*h(k));
end;
perfilV(1) = 0;
perfilV(12) = 0;

%4. Levantamento da curva v(r^2) e calculo de Q
%4.1. Levantamendo da curva: média dos pontos equidistantes
perfilVmeio = zeros(6,1);
perfilVmeio(6) = 0;
perfilVmeio(5) = (perfilV(11) + perfilV(2))/2;
perfilVmeio(4) = (perfilV(10) + perfilV(3))/2;
perfilVmeio(3) = (perfilV(9) + perfilV(4))/2;
perfilVmeio(2) = (perfilV(8) + perfilV(5))/2;
perfilVmeio(1) = (perfilV(7) + perfilV(6))/2;

R = 27e-3;

r1 = zeros(12,1);
r1(1) = -R;
r1(2) = -R + 2.7e-3;
for k=3:1:11
    r1(k) = -R + 2.7e-3 +((k-2)*5.4e-3);
end;
r1(12) = R;
r2 = r1(7:12).^2;

f1 = figure;
stem(r1, perfilV, 'x');
title('Perfil de velocidades');
xlabel('r [m]');
ylabel('v [m/s]');
ylim([1.4 1.8]);
xlim([-0.03 0.03]);
grid on;
text(r1, perfilV, num2str(perfilV), 'vert','bottom','horiz','center');

f2 = figure;
stem(r2, perfilVmeio, 'x');
title('Curva v(r^2)');
xlabel('r^2 [m^2]');
ylabel('v [m/s]');
grid on;

%4.1. Cálculo de A1 e de Qmedido e comparação com a vazão pelo método da balança
A1aux = cumtrapz(r2, perfilVmeio);
A1 = A1aux(5);
Qpesagem = (mf - mi)/(deltaT*rhoAgua);
Qmedido = pi*A1;
ErroQ = (Qmedido - Qpesagem)/Qmedido;

%5. Cálculo da velocidade média medida e pelo método da balança
S = pi*R^2;
Vmedido = Qmedido/S;
Vpesagem = Qpesagem/S;
ErroV = (Vmedido - Vpesagem)/Vmedido;

%6. Levantamento curva v^3(r^2), calculo do fluxo de Ec e calculo de alpha:
%6.1. Levantamento da curva
perfilV3 = (perfilVmeio).^3;
f3 = figure;
stem(r2, perfilV3, 'x');
title('Curva v^3(r^2)');
xlabel('r^2 [m^2]');
ylabel('v^3 [(m/s)^3]');
grid on;

%6.2. Calculo do fluxo de Ec
A2aux = cumtrapz(r2, perfilV3);
A2 = A2aux(5);
C = pi*A2*rhoAgua/2; %[kg/m]
    
%6.3. Calculo do alpha
alpha = A2/((Vmedido^3)*(R^2)); %[(s/m)^3]

%7. Levantamento da curva v^2(r^2), calculo do fluxo de quantidade de
%movimento na seção e do coeficiente de quantidade de movimento beta
%7.1. Levantamento da curva v^2(r^2)
perfilV2 = (perfilVmeio).^2;
f4 = figure;
stem(r2, perfilV2, 'x');
title('Curva v^2(r^2)');
xlabel('r^2 [m^2]');
ylabel('v^2 [(m/s)^2]');
grid on;

%7.2. Calculo do fluxo de quantidade de movimento na seção
A3aux = cumtrapz(r2, perfilV2);
A3 = A3aux(5);
X = pi*rhoAgua*A3; %[kg/m]

%7.3. Calculo do coeficiente de quantidade de movimento
beta = A3/((R^2)*(Vmedido^2)); %[(s/m)^2]

%8. Calculo de alpha e beta pelas outras relações
perfilValt = perfilVmeio./Vmedido;
perfilValt3 = perfilValt.^3;
perfilValt2 = perfilValt.^2;
A2alt = cumtrapz(r2, perfilValt3);
A3alt = cumtrapz(r2, perfilValt2);

alphaAlt = (pi*A2alt(end))/S;
betaAlt = (pi*A3alt(end))/S;

ErroAlpha = (alpha - alphaAlt)/alpha;
ErroBeta = (beta - betaAlt)/beta;
%9. Determinação de n pelo gráfico
r1bilog = r1(7:11);
VmaxMedido = max(perfilV);
perfilVbilog = log(perfilVmeio(1:5));
rbilog = log((R - r1bilog)/R);
plot(rbilog, perfilVbilog);
title('Gráfico bilogarítmo: log (V) x (1/n)*log((R-r)/R) + log(Vmax)');
xlabel('log((R-r)/R)');
ylabel('log(V)');
grid on;

%Valores obtidos da regressão linear do gráfico anterior (y = p1x + p2)
p1 = 0.054843;
p2 = 0.56284;

%Das manipulações algébricas, sabemos que e^p2 = Vmax e 1/n = p1
VmaxCalculado = exp(p2);
ErroVmax = (VmaxMedido - VmaxCalculado)/VmaxMedido;
n = 1/p1;