load('Kp_data.mat');

%calculo do valor de T
f1 = figure;
plot(t, Vt);
grid on;
hold on;
plot(t, Vm);