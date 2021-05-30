%declara��o de vari�veis
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
%Gr�ficos do item f
Kpi = 2.059; %trocar Kpi pelos 3 valores
sim('modeloexp6', 10); %n�o precisa fazer nada no multisim, s� abrir o modelo, as vari�veis atualizam sozinhas
figure;
hold on;
plot(U_sim);
plot(Vt_simL);
plot(Vt_simNL);
legend('Degrau de entrada', 'Vt linear', 'Vt n�o linear');
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
legend('Vm linear', 'Vm n�o linear');
title('Esfor�o de controle');
xlabel('t [s]');
ylabel('Vm [V]');
ylim([-1 5]);
pbaspect([2 1 1]);
grid on;
hold off;

Kpi = 2.059;
sim('modeloexp6', 10); %n�o precisa fazer nada no multisim, s� abrir o modelo, as vari�veis atualizam sozinhas
figure;
plot(VmL);
%plot(VmNL)
hold on;
Kpi = 1.235;
sim('modeloexp6', 10); %n�o precisa fazer nada no multisim, s� abrir o modelo, as vari�veis atualizam sozinhas
plot(VmL);
%plot(VmNL)
Kpi = 0.618;
sim('modeloexp6', 10); %n�o precisa fazer nada no multisim, s� abrir o modelo, as vari�veis atualizam sozinhas
plot(VmL);
%plot(VmNL)
legend('Kpi = 2.059', 'Kpi = 1.235', 'Kpi = 0.618');
title('Esfor�o de controle - Compara��o modelo linear');
xlabel('t [s]');
ylabel('Vm [V]');
ylim([-1 4]);
pbaspect([2 1 1]);
grid on;
