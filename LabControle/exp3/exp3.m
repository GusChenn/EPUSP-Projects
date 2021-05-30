%load('respfreq_2V_data.mat');
load('respfreq_4V_data.mat');

%declaração das estimativas iniciais

KKto = 0.92875;
To = 0.350;

[KKt,T] = bodefit(KKto,To,wdata,Gdata,Fdata);

f1 = figure;
G = tf([KKt], [T,1]);

f2 = figure;
bode(G);
grid on;

[mag,phase,wout] = bode(G);

woutAux = zeros(49,1);
magAux = zeros(49,1);
phaseAux = zeros(49,1);

for k=1:1:49
    woutAux(k) = wout(k);
    magAux(k) = 10*log(mag(k));
    phaseAux(k) = phase(k);
end;    

f3 = figure;
subplot(2,1,1);
semilogx(wdata, Gdata, woutAux, magAux);
grid on;

subplot(2,1,2);
semilogx(wdata, Fdata, woutAux, phaseAux);
grid on;