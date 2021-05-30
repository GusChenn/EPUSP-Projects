load('modnl_data.mat');
%load('modnl_val_data.mat');

f1 = figure;
plot(t, Vm, 'color', 'blue');
hold on;
plot(t, Vt, 'color', 'red');
legend('Vm','Vt')
grid on;
title('Dados Vm e Vt');

f2 = figure;
plot(t, Vp);
grid on;

%declaração de dados ja obtidos:
Kt = 0.0169;
Kp = 1.604;

%calculo do valor do primeiro patamar (0 em relação a z)
dadosMedia2 = zeros(300,1);
for k=1:1:300
    dadosMedia2(k) = Vt(k + 300);
end;
Vt1 = mean(dadosMedia2);

%cálculo de Zinf:
dadosMedia = zeros(300,1);
for k=1:1:300
    dadosMedia(k) = Vt(k + 800);
end;
n = 1/3;
Zinf = mean(dadosMedia);
ZinfConvertido = (n^2)*((mean(dadosMedia) - Vt1)/Kt);

%declaração de T (medido do gráfico):
T = 0.27;

%cálculo de K:
deltaV = 2;
K = ZinfConvertido/((n^2)*deltaV);

%cálculo de Fi:
Vm1 = 2;
Wp1 = (n^2)*(Vt1/Kt);
phi = (K*(n^2)*Vm1) - Wp1;

%analise dos resultados:
plot(tsim, Vmsim, tsim, Vtsim);
grid on;
title('Resultado da simulação com degrau duplo');
legend('Vmsim', 'Vtsim');

f3 = figure;
dif = zeros(1001, 1);
for k=1:1:1001
    dif(k) = Vt(k) - Vtsim(k);
end
plot(tsim, dif);
title('Erro da simulação com degrau duplo');
grid on;



