%Dados:
K = 54.96; %check
KNL = 59.7881; %check
KKt = 0.93; %check
KtL = KKt/K; %check
KtNL = KKt/KNL; %check
Kp = 1.604; %check
T = 0.27; %check
U = Kp*pi/2; %equivalente de 90º em Volts
phi = 1.2088; %check
n = 1/3; %check
opt = stepDataOptions('StepAmplitude',U);

%1. Cálculo dos intervalos de Kr

limKr = (T*Kp*n^2)/KtNL;
KrLGR1 = [3.294, 6.649, 10];
KrLGR2 = [0.5, 1.49, 2.89];

%2. Plots dos LGR1 ma:
for i=1:1:3
    Gma = tf([K*KtNL*KrLGR1(i), K*Kp*n^2], [T, 1, 0]);
    figure('Name', int2str(KrLGR1(i)));
    rlocusplot(Gma);
    grid on;
end;

%3. Plots dos LGR2 ma separados:
for i=1:1:3
    Gma = tf([K*KtNL*KrLGR2(i), K*Kp*n^2], [T, 1, 0]);
    figure('Name', int2str(KrLGR2(i)));
    rlocusplot(Gma);
    grid on;
end;

%4. Plots dos LGR2 ma juntos:
figure('Name', 'LGR2 MA');

for i=1:1:3
    Gma = tf([K*KtNL*KrLGR2(i), K*Kp*n^2], [T, 1, 0]);
    rlocusplot(Gma);
    grid on;
    hold on;
end;
