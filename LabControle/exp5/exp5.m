%realimentação unitária
%declaração de variaveis
K = 54.96;
KNL = 59.92;
KKt = 0.96;
Kp = 1.604;
Kt = 0.0169;
T = 0.27;
U = 1.59; %equivalente de 100RPM em Volts
phi = 1.2088;

%cálculos das funções de transferência e dos parâmetros da experiência
Tmf = T/(1 + KKt);

Gmd = tf([KKt], [T 1]);
Gmf = tf([KKt], [T 1 + KKt]);

step(Gmf);

%controlador proporcional
Kc = 2.5; %trocar para 1.5 e 2.5, pegar os valores do console mesmo
TmfKc = T/(1 + Kc*KKt);
figure;
rlocus(tf([Kc*KKt], [T 1])); %plot do LGR de malha aberta
hold on;
rlocus(tf([Kc*KKt], [T 1 + Kc*KKt]));% plot do polo de malha fechada
hold off;


%plots
load('CtrlVel_P_Kc10.mat', 'Vt', 'Vm', 'Kc'); %rodar o programa 3x: Kc10, Kc15 e Kc25
sim('modeloexp5', 10); %não precisa fazer nada no multisim, só abrir o modelo, as variáveis atualizam sozinhas
figure;
hold on;
plot(U_sim);
plot(linspace(0, 10, 1001), Vt);
plot(Vt_simL);
plot(Vt_simNL);
legend('Entrada', 'Vt planta', 'Vt linear', 'Vt não linear');
title('Resposta ao degrau de 100RPM');
xlabel('Tempo (s)');
ylabel('Vt(V)');
ylim([-1 5]);
pbaspect([2 1 1]);
grid on;
hold off;

figure;
hold on;
plot(linspace(0, 10, 1001), Vm);
plot(VmL);
plot(VmNL);
legend('Vm planta', 'Vm linear', 'Vm não linear');
title('Esforço de controle');
xlabel('Tempo (s)');
ylabel('Vm(V)');
ylim([-1 5]);
pbaspect([2 1 1]);
grid on;
hold off;

figure;
hold on;
plot(linspace(0, 10, 1001), U_sim.data - Vt);
plot(U_sim - Vt_simL);
plot(U_sim - Vt_simNL);
legend('Erro da planta', 'Erro linear', 'Erro não linear');
title('Erro de velocidade');
xlabel('Tempo (s)');
ylabel('Erro(V)');
ylim([-1 3]);
pbaspect([2 1 1]);
grid on;
hold off;