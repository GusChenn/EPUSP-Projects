load('modnl_val_data.mat');

f1 = figure;
plot(t, Vm, 'color', 'blue');
hold on;
plot(t, Vt, 'color', 'red');
legend('Vm','Vt')
grid on;
title('Dados Vm e Vt');

f2 = figure;
plot(tsim, Vmsim, tsim, Vtsim);
title('Resultados da validação');
legend('Vmsim','Vtsim');
grid on;

erro = zeros(2901,1);
for k=1:1:2901
    erro(k) = Vt(k) - Vtsim(k);
end;

f3 = figure;
plot(tsim, erro);
grid on;
legend('Erro');