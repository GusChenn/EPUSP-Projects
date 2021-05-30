load('modlin_val_data.mat');

%Valor original de T: 0.306
%Valor que utilizamos: 0.350 
Taux = 0.350;

%plota os gráficos feitos na aula:
f1 = figure;
plot(t, Vm, t, Vp);
grid on;

f2 = figure;
plot(t, Vm, t, Vt, t, Vtsim);
title('Gráfico V x t');
legend('Vm','Vt','Vtsim');
grid on;

%Resultados da validação de K e Kt
f5 = figure;
subplot(3,1,1);
plot(t, Vmsim);
title('Sinal de entrada');
xlabel('Tempo [s]');
ylabel('Vm [V]');
grid on;

subplot(3,1,2);
plot(t, Vtsim, 'color', 'red');
title('Resposta de velocidade do modelo');
xlabel('Tempo [s]');
ylabel('Vt [V]');
grid on;

Vtdif = zeros(2701,1);
for n=1:1:2701
    Vtdif(n) = Vtsim(n)-Vt(n);
end;

subplot(3,1,3);
plot(t, Vtdif, 'color', 'black');
title('Erro de modelagem');
xlabel('Tempo [s]');
ylabel('Vtsim - Vt [V]');
grid on;

%resultados da validação de K e Kp
Vpaux = zeros(146,1);
Vmaux = zeros(146,1);
taux = zeros(146,1);

for n=1:1:146
    Vpaux(n) = Vp(n);
    taux(n) = t(n);
    Vmaux(n) = Vm(n);
end;

f6 = figure;
subplot(3,1,1);
plot(taux, Vpsim, taux, Vmsim2);
axis([0 1.45 0 1.5]);
title('Resposta de posição do modelo');
xlabel('Tempo [s]');
ylabel('Vpsim [V]');
grid on;

subplot(3,1,2);
plot(taux, Vpaux, taux, Vmaux);
axis([0 1.45 0 1.5]);
title('Medição da posição no motor');
xlabel('Tempo [s]');
ylabel('Vp [V]');
grid on;

Vpdif = zeros(146,1);
for n=1:1:146
    Vpdif(n) = Vpsim(n) - Vp(n);
end;

subplot(3,1,3);
plot(taux, Vpdif, 'color', 'black');
title('Erro de modelagem');
xlabel('Tempo [s]');
ylabel('Vpsim - Vp [V]');
grid on;

f7 = figure;
plot(taux, Vpaux, taux, Vpsim);
legend('Vp', 'Vpsim', 'location', 'sw');
grid on;

