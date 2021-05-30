%dados dos experimentos anteriores (trocar para os seus)
K = 54.96;
KNL = 59.7881;
KKt = 0.93;
KtL = KKt/K;
KtNL = KKt/KNL;
Kt = KtL;
Kp = 1.604;
Kc = 2.2;
Kpi = 0.5;
T = 0.27;
Tc = 0.65*T;
U = Kp*pi/2; %equivalente de 90º em Volts
phi = 1.2088;
n = 1/3;
Gma = tf([KKt], [T 0]);
Gd = tf([KKt], [T 0], 'ioDelay', 0.7);

% %Item a
% figure
% bode(Gma);
% title('Diagrama de Bode (sem atraso)');
% figure
% bode(Gd);
% title('Diagrama de Bode (com atraso)');
% 
% %Item b
% figure
% margin(Gma);
% figure
% margin(Gd);
% 
% Kc = 3; %um pouco maior que o limite
% Gp = tf(K*Kp*(n^2), [T 1 0]);
% Gc = tf([To 1],[alfa*To 1]);
% Gma = Kc*Gp*Gc;
% Gmf1 = feedback(Gp, 1);
% Gmf2 = feedback(Gma, 1);

% %item b
% figure;
% step(Gmf1, opt);
% hold on
% step(Gmf2, opt);
% step(tf(1), opt);
% xlim([-1 4]);
% legend('Não compensado', 'Compensado', 'setpoint(90°)');
% hold off

%simulações
% figure
% sim('delay_template', 1);
% plot(t, Vm, t, Vt, t, Vp);
% legend('Vm', 'Vt', 'Vp')
% title('Resultados da simulação do template')

sim('controle_PI', 10);
figure
plot(t, Vm1, t, Vt1, t, Degrau);
legend('Vm', 'Vt')
title('Resposta ao degrau - Controlador PI')

sim('controle_IMC', 10);
figure
plot(t, Vm, t, Vt, t, Degrau);
legend('Vm', 'Vt')
title('Resposta ao degrau - Controlador IMC')