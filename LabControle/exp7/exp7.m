%realimenta��o unit�ria
%dados dos experimentos anteriores (trocar para os seus)
K = 54.89;
KNL = 59.92;
KKt = 0.96;
KtL = KKt/K;
KtNL = KKt/KNL;
Kp = 1.61;
T = 0.27;
U = Kp*pi/2 %equivalente de 90� em Volts
phi = 1.9;
n = 1/3;
opt = stepDataOptions('StepAmplitude',U);
Kcs = [0.5, 1, 1.5]


%c�lculos iniciais (item 1)
Kc = 1;
Wn = sqrt((Kc*K*Kp*n^2)/T)
xi = 1/(2*Wn*T) %l�-se qsi
Mp = exp((-pi*xi)/sqrt(1 - xi^2))
tp = pi/(Wn*sqrt(1 - xi^2))

%c�lculos das fun��es de transfer�ncia (item 2)
Gma = tf(Kc*K*Kp*n^2, [T 1 0])
Gmf = tf(Wn^2, [1 2*xi*Wn Wn^2])

step(Gmf, opt)

%plot dos LGR (item 3)
figure
rlocus(Gma) %plot do LGR de malha aberta
hold on
rlocus(Gmf)% plot dos polos de malha fechada
hold off

%c�lculos + plots para outros Kcs (item 5)
figure
for i = 1:3
    Wn = sqrt((Kcs(i)*K*Kp*n^2)/T)
    xi = 1/(2*Wn*T)
    Mp = exp((-pi*xi)/sqrt(1 - xi^2))
    tp = pi/(Wn*sqrt(1 - xi^2))

    %c�lculos das fun��es de transfer�ncia
    Gmf = tf(Wn^2, [1 2*xi*Wn Wn^2])
    
    step(Gmf, opt)
    hold on
end
legend('Kc = 0.5', 'Kc = 1', 'Kc = 1.5')
title('Respostas ao degrau 90�')
ylabel('Vp(V)')
hold off

%LGR para v�rios Kcs
figure
rlocus(Gma)
hold on
for i = 1:3
    Wn = sqrt((Kcs(i)*K*Kp*n^2)/T)
    xi = 1/(2*Wn*T)
    Mp = exp((-pi*xi)/sqrt(1 - xi^2))
    tp = pi/(Wn*sqrt(1 - xi^2))

    %c�lculos das fun��es de transfer�ncia
    Gmf = tf(Wn^2, [1 2*xi*Wn Wn^2])
    rlocus(Gmf)
end
hold off

%LGR para Kc cr�tico(calcular KC por fora fazendo xi = 1) (item 6)
figure
Kc_crit = 0.0942974;
Wn = sqrt((Kc_crit*K*Kp*n^2)/T);
xi = 1/(2*Wn*T);
Mp = exp((-pi*xi)/sqrt(1 - xi^2));
tp = pi/(Wn*sqrt(1 - xi^2));

%c�lculos das fun��es de transfer�ncia
Gma = tf(Kc_crit*K*Kp*n^2, [T 1 0])
Gmf = tf(Wn^2, [1 2*xi*Wn Wn^2])
rlocus(Gma)
hold on
rlocus(Gmf)
hold off

%plots
load('CtrlPos_P_Kc15.mat', 'Vp', 'Vm', 'Kc') %rodar o programa 3x(trocar o nome do arquivo): Kc05, Kc10 e Kc15
sim('modeloexp7', 10) %n�o precisa fazer nada no multisim, s� abrir o modelo, as vari�veis atualizam sozinhas
figure
hold on
plot(U_sim)
plot(linspace(0, 10, 1001), Vp)
plot(Vp_simL)
plot(Vp_simNL)
legend('Entrada', 'Vp planta', 'Vp linear', 'Vp n�o linear')
title('Controle de posi��o - Resposta ao degrau de 90�')
xlabel('Tempo (s)')
ylabel('Vp(V)')
ylim([-2 5])
pbaspect([2 1 1])
grid on
hold off

figure
hold on
plot(linspace(0, 10, 1001), Vm)
plot(VmL)
plot(VmNL)
legend('Vm planta', 'Vm linear', 'Vm n�o linear')
title('Esfor�o de controle')
xlabel('Tempo (s)')
ylabel('Vm(V)')
ylim([-2 5])
pbaspect([2 1 1])
grid on
hold off

figure
hold on
plot(linspace(0, 10, 1001), U_sim.data - Vp)
plot(U_sim - Vp_simL)
plot(U_sim - Vp_simNL)
legend('Erro da planta', 'Erro linear', 'Erro n�o linear')
title('Erro de posi��o')
xlabel('Tempo (s)')
ylabel('Erro(V)')
ylim([-2 3])
pbaspect([2 1 1])
grid on
hold off