%parâmetros dos modelos
alfa = 0.56844;
L = 0.99;
Ku = 27.5;
Tu = 2.1;
N = 10;

% % exercício a
% KP = 1/alfa;
% Ti = 2*L;
% Td = 0.5*L;
% sim('zn1_template', 20)
% plot(t, U, t, Y)
% legend('Vm', 'Vp')

% %exercício b
% KP = 0.1*Ku;
% Ti = Tu/2;
% Td = Tu/8;
% sim('zn2_template', 20)
% plot(t, U, t, Y)
% legend('Vm', 'Vp')

%exercício c
epsulon = 0; %escrito errado mesmo, tá assim no simulink
d = 2.5;
a = 0.28815;
Tu = 0.7;
Ku = 4*d/(pi*a)-7;
KP = (0.6*Ku);
Ti = (Tu/2) + 0.15;
Td = (Tu/8) + 0.04;
sim('relay_template', 20)
plot(t, Vm, t, Vp, t, Degrau)
xlim([0 6]);
legend('Vm', 'Vp', 'Entrada')