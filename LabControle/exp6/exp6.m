%declaração de variáveis
K = 54.96;
KNL = 59.78;
KKt = 0.96;
KtL = KKt/K;
KtNL = KKt/KNL;
T = 0.27;
U = 1.59; %equivalente de 100RPM em Volts
phi = 1.2088;

%plots
%LGRs do item e
Ti = T;
G = tf([Ti 1], [Ti*T Ti 0]);
rlocus(G);
%Gráficos do item f
Kpi = 2.059; %trocar Kpi pelos 3 valores
sim('modeloexp6', 10); %não precisa fazer nada no multisim, só abrir o modelo, as variáveis atualizam sozinhas
figure;
hold on;
plot(U_sim);
plot(Vt_simL);
plot(Vt_simNL);
legend('Degrau de entrada', 'Vt linear', 'Vt não linear');
title('Resposta ao degrau de 100RPM');
xlabel('t [s]');
ylabel('Vt [V]');
ylim([-1 4]);
pbaspect([2 1 1]);
grid on;
hold off;

figure;
hold on;
plot(VmL);
plot(VmNL);
legend('Vm linear', 'Vm não linear');
title('Esforço de controle');
xlabel('t [s]');
ylabel('Vm [V]');
ylim([-1 5]);
pbaspect([2 1 1]);
grid on;
hold off;

Kpi = 2.059;
sim('modeloexp6', 10); %não precisa fazer nada no multisim, só abrir o modelo, as variáveis atualizam sozinhas
figure;
plot(VmL);
%plot(VmNL)
hold on;
Kpi = 1.235;
sim('modeloexp6', 10); %não precisa fazer nada no multisim, só abrir o modelo, as variáveis atualizam sozinhas
plot(VmL);
%plot(VmNL)
Kpi = 0.618;
sim('modeloexp6', 10); %não precisa fazer nada no multisim, só abrir o modelo, as variáveis atualizam sozinhas
plot(VmL);
%plot(VmNL)
legend('Kpi = 2.059', 'Kpi = 1.235', 'Kpi = 0.618');
title('Esforço de controle - Comparação modelo linear');
xlabel('t [s]');
ylabel('Vm [V]');
ylim([-1 4]);
pbaspect([2 1 1]);
grid on;
