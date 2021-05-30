%dados dos experimentos anteriores (trocar para os seus)
K = 54.96;
KNL = 59.7881;
KKt = 0.93;
KtL = KKt/K;
KtNL = KKt/KNL;
Kt = KtL;
Kp = 1.604;
Kc = 2.2;
T = 0.27;
U = 1.59; %equivalente de 90� em Volts
phi = 1.2088;
n = 1/3;
s = tf('s');
To = 0.134; %encontrar pelo relat�rio
alfa = 0.2818;%encontrar pelo relat�rio
opt = stepDataOptions('StepAmplitude', U) 
 
%Item a
Gp = tf(Kc*K*Kp*(n^2), [T 1 0]);
%bode(Gp);

Kc = 3; %um pouco maior que o limite
Gp = tf(K*Kp*(n^2), [T 1 0]);
Gc = tf([To 1],[alfa*To 1]);
Gma = Kc*Gp*Gc;
Gmf1 = feedback(Gp, 1);
Gmf2 = feedback(Gma, 1);
Gmf3 = feedback(Gma, 1);
%bode(Gc);

% % %item b
% figure;
% step(Gmf1, opt);
% hold on
% step(Gmf2, opt);
% step(tf(1), opt);
% xlim([-1 4]);
% legend('N�o compensado', 'Compensado', 'Setpoint (90�)', 'location', 'se');
% hold off

% %item c
% figure;
% step(Gmf1/s);
% hold on;
% step(Gmf2/s);
% step(tf(1, [1 0]));
% ylim([0 5]);
% xlim([0 5]);
% legend('N�o compensado', 'Compensado', 'Rampa unit�ria');
% hold off

% %simula��es
sim('modeloexp10', 10)%dessa vez precisa mudar a entrada, j� tem os dois blocos � s� trocar a liga��o
figure
hold on
plot(U_sim)
plot(Vp_simL);
plot(Vp_simNL);
plot(Vp_simLNC);
plot(Vp_simNLNC);
% plot(Vm_simL);
% plot(Vm_simNL);
% plot(Vm_simLNC);
% plot(Vm_simNLNC);
legend('Entrada', 'Vp L compensado', 'Vp NL compensado', 'Vp L n�o compensado', 'Vp NL n�o compensado', 'Vm L compensado', 'Vm NL compensado', 'Vm L n�o compensado', 'Vm NL n�o compensado', 'location', 'e')
title('Resposta � Rampa - Compensado') %trocar o nome na hora de plotar tbm degrau de 90�-rampa unit�ria
xlabel('Tempo (s)')
ylabel('Vp(V)')
ylim([-0.3 2.4])
xlim([0.9 6])
pbaspect([2 1 1])
grid on
hold off