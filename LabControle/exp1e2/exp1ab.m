load('KKt_data.mat'); 

%aplica a trnasformação 1/n^2 e converte de RPM para rad/s
display_rads = zeros(59,1);
for k=1:1:59
    display_rads(k) = 9*(pi/30)*DisplayRPM(k);
end;

kt = display_rads\Vt;
kkt = 0.92875;
k = kkt/kt;

f1 = figure;
plot(Vm, Vt);
hold on;
title('Curva Vt x Vm');
%plot(Vm, Vt, 'o');
xlabel('Vm');
ylabel('Vt');
grid on;
plot(Vm, kkt*Vm);
legend('Vt x Vm','Curva aproximada pelo MMQ', 'location', 'SE');

f2 = figure;
plot(display_rads, Vt);
hold on;
title('Curva Vt x Wm');
plot(display_rads, Vt, 'o');
xlabel('Wm');
ylabel('Vt');
grid on;

%resolve o sistema pelo metodo do MMQ, encontrando assim o valor de Kt que minimiza o erro.