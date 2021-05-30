load('Kp_data.mat');
f1 = figure;
plot(t, Vp);
grid on;

%medições no gráfico:
deltat = 1.15;
deltaT = 0.04;
Vmax = 4.896;
Vmin = -4.838;

deltaFi = 2*pi*(deltaT/deltat);
Kp = (Vmax - Vmin)/deltaFi;
Kp = 1.606;