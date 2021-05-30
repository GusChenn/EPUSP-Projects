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

%5. funções step:
KrVec = [0.5, 1.49, 2.89, 3.294, 6.65, 10];
KcLGR2 = [0.0104, 13.4, 28.4, 47.9, 53.2;
          0.0728, 0.337, 2.37, 4.6, 5.46;
          0.137, 0.275, 0.477, 0.668, 0.826];
KcLGR1 = [0.0748, 0.454, 0.969;
          0.0758, 0.145, 0.365;
          0.0895, 0.0685, 0.2];
 
%plot dos steps dos LGR2
for i=1:1:3
    figure;
    for j=1:1:5
        Gmf = tf(K*KcLGR2(i, j)*Kp*n^2, [T, (1 + K*KcLGR2(i, j)*KtNL*KrVec(i)), K*KcLGR2(i, j)*Kp*n^2]);
        step(Gmf);
        hold on;
    end;
    grid on;
    hold off;
    legend('Kc1', 'Kc2', 'Kc3', 'Kc4', 'Kc5');
end;

%plot dos steps dos LGR1
for i=3:1:5
    figure;
    for j=1:1:3
        Gmf = tf(K*KcLGR1(i-2, j)*Kp*n^2, [T, (1 + K*KcLGR1(i-2, j)*KtNL*KrVec(i)), K*KcLGR1(i-2, j)*Kp*n^2]);
        step(Gmf, 15);
        hold on;
    end;
    grid on;
    hold off; 
    legend('Kc1', 'Kc2', 'Kc3');
end;
