%Exerc�cio Computacional 1
format long g
clear all
clc
close all

%Par�metros do transformador
Pn = 6000; %Pot�ncia Nominal [VA]
V1 = 250; %Tens�o no prim�rio (BT)[V]
V2 = 500; %Tens�o no secund�rio (AT)[V]
a = V2/V1; %Ganho
f = 60; %Frequ�ncia de opera��o [Hz]
Fp = 1; %Fator de Pot�ncia da carga (cos phi)

%Ensaio em vazio
P0 = 80; %Pot�ncia em vazio[W]
V0 = 250; %Tens�o em vazio [V] 
I0 = 1; %Corrente em vazio [A]
Rp = (V0^2)/P0; %Resistencia de perda do ferro [Ohm]
Ip = V0/Rp; %Corrente de perda do ferro [A]
Im = sqrt(I0^2 - Ip^2); %Corrente de magnetiza��o [A]
Xm = V0/Im; %Reat�ncia de magnetiza��o [Ohm]

%Ensaio em curto circuito (AT)
Pc = 100; %Pot�ncia em curto[W]
Vc = 20; %Tens�o em curto [V] 
Ic = 12; %Corrente em curto [A]
Rcc = Pc/(Ic^2); %Resist�ncia em curto [Ohm]
Zc = Vc/Ic; %Imped�ncia em curto [Ohm]
Xcc = sqrt(Zc^2 - Rcc^2); %Reat�ncia em curto [Ohm]

X2 = Xcc/2; %Reat�ncia de dispers�o do secund�rio [Ohm]
X2_ = X2*((1/a)^2); %Reat�ncia de dispers�o do secund�rio refletida no prim�rio [Ohm]
X1_ = Xcc/2; %Reat�ncia de dispers�o do prim�rio referida no secund�rio (ensaio em curto)
X1 = X2_; %Reatancia de dispers�o do prim�rio

R2 = Rcc/2; %Resist�ncia do secund�rio [Ohm]
R2_ = R2*((1/a)^2); %Resist�ncia do secund�rio refletida no prim�rio [Ohm]
R1_ = Rcc/2; %Resist�ncia do prim�rio referida no secund�rio (ensaio em curto)
R1 = R2_; %Resist�ncia do prim�rio


%Determina��o de E2' = V2' com circuito aberto atrav�s da 2� lei de Kirchhoff
%[ZsAb]*[IsAb] = [VsAb]
ZsAb = [(R1+j*X1)   Rp   0;    %Matriz de imped�ncias com secund�rio aberto
            0      -Rp   j*Xm;
            1      -1    -1;];
VsAb = [V1; 0; 0;]; %Matriz de tens�es com secund�rio aberto
IsAb = linsolve(ZsAb, VsAb); %Matriz de correntes com secund�rio aberto
E2_Ab = abs(IsAb(2)*Rp); %Calculo do m�dulo de E2'

carreg1 = []; %Vetor com os valores de carregamento do transf. em fun��o da Pot. Nom. [%]
Reg11 = []; %Vetor com os valores da regula��o para determinado carregamento [%]
Rend1 = []; %Vetor com os valores de rendimento para determinado carregamento [%]

for Rc = 180:-0.25:30 %Varia��o da carga para gerar varia��o da pot�ncia
    Xc = (Rc/Fp)*sin(acos(Fp)); %Calculo da reat�ncia da carga para FP = 1
    Zc = (Rc + j*Xc);%Imped�ncia da carga
    Zc_ = ((1/a)^2)*Zc;
    %Resolu��o do circuito atrav�s da 2� lei de Kirchhoff
    %[Zs]*[Is] = [Vs]
    Zs = [(R1+j*X1)      Rp         0       0;    %Matriz de imped�ncias
         0              -Rp        j*Xm     0;
         0               0        -j*Xm     R2_+j*X2_+Zc_;
         1              -1        -1        -1;];
    Vs = [V1; 0; 0; 0;]; %Vetor coluna de tens�es 
    Is = linsolve(Zs, Vs); %Vetor coluna de correntes
    V2_= Zc_*Is(4); %Calculo 
    P1 = real(V1*conj(Is(1))); %Calculo de P1 (Pot�ncia fornecida) [W]
    P2 = real(V2_*conj(Is(4))); %Calculo de P2 (Pot�ncia �til) [W]
    
    carreg1(end+1) = (P1/Pn)*100; %Aloca��o do valor de carregamento do transf.
    Reg11(end+1) = ((abs(E2_Ab)-abs(V2_))/abs(V2_))*100; %Calculo da regula��o
    Rend1(end+1) = (P2/P1)*100; %Calculo do rendimento
end

%Plotagem do gr�fico de rendimento x carregamento
rendimento = figure('name', 'Rendimento x Carregamento Completo');
rendimento = plot(carreg1, Rend1); 
hold on
index = find(carreg1 >= 99.8 & carreg1 <= 100.5, 1); 
pc1 = plot(carreg1(index),Rend1(index),'o','MarkerSize',8); %Marca��o do ponto de plena carga 
grid on
title('Rendimento em fun��o do carregamento do transformador (modelo completo)');
ylabel('Rendimento [%]'); xlabel('Carregamento do transformador [%]');
legend([pc1],'Ponto de plena carga');
xlim([30 130]); ylim([95 98]);
set(gca,'XTick',30:10:130);
hold off

%Plotagem do gr�fico de regula��o x carregamento
regulacao = figure('name', 'Regula��o x Carregamento Completo');
regulacao = plot(carreg1, Reg11);
hold on
pc2 = plot(carreg1(index),Reg11(index),'o','MarkerSize',8); %Marca��o do ponto de plena carga 
grid on
title('Regula��o em fun��o do carregamento do transformador (modelo completo)');
ylabel('Regula��o [%]'); xlabel('Carregamento do transformador [%]');
legend([pc2],'Ponto de plena carga');
xlim([30 130]); ylim([0 3]);
set(gca,'XTick',30:10:130);
hold off

%Resolu��o do problema para o circuito equivalente a fluxo constante

carreg2 = []; %Vetor com os valores de carregamento do transf. em fun��o da Pot. Nom. [%]
Reg21 = []; %Vetor com os valores da regula��o para determinada fase da carga [%]
n21 = []; %Vetor com os valores de rendimento para determinada fase da carga [%]

for Rc = 180:-0.25:30 %Varia��o da carga para gerar varia��o da pot�ncia
    Xc = (Rc/Fp)*sin(acos(Fp)); %Calculo da reat�ncia da carga para FP = 0.9
    Zc = (Rc + j*Xc);%Imped�ncia da carga
    Zc_ = ((1/a)^2)*Zc;
    
    %Resolu��o do circuito atrav�s da 1� lei de Kirchhoff
    V2_ = V1*(1/R1+1/(j*X1)+1/R2_+1/(j*X2_))/(1/R1+1/(j*X1)+1/R2_+1/(j*X2_)+1/Zc_); %Calculo da tens�o V2' [V]
    I2 = V1/(R1+j*X1+R2_+j*X2_+Zc_); %Calculo da corrente I2 [A]
    I1 = V1/Rp + V1/(j*Xm) + I2; %Calculo da corrente I1 [A]
    P1 = real(V1*conj(I1)); %Calculo de P1 (Pot�ncia fornecida) [W]
    P2 = real(V2_*conj(I2)); %Calculo de P2 (Pot�ncia �til) [W]
    ModV2_ = abs(I2*Zc_); %Calculo do m�dulo de V2' [V]
    carreg2(end+1) = (P1/Pn)*100; %Aloca��o do valor de carregamento do transf.
    Reg21(end+1) = ((abs(V1)-ModV2_)/ModV2_)*100; %Calculo da regula��o
    n21(end+1) = (P2/P1)*100; %Calculo do rendimento
end

%Plotagem do gr�fico de rendimento x carregamento
rendimento = figure('name', 'Rendimento x Carrgamento Fluxo Constante');
rendimento = plot(carreg2, n21); 
hold on
index = find(carreg2 >= 99.5 & carreg2 <= 100.5, 1); 
pc1 = plot(carreg2(index),n21(index),'o','MarkerSize',8); %Marca��o do ponto de plena carga 
grid on
title('Rendimento em fun��o do carregamento do transformador (modelo a fluxo constante');
ylabel('Rendimento [%]'); xlabel('Carregamento do transformador [%]');
legend([pc1],'Ponto de plena carga');
xlim([30 130]); ylim([95 99]);
set(gca,'XTick',30:10:130);
hold off

%Plotagem do gr�fico de regula��o x carregamento
regulacao = figure('name', 'Regula��o X Carregamento Fluxo Constante');
regulacao = plot(carreg2, Reg21);
hold on
pc2 = plot(carreg2(index),Reg21(index),'o','MarkerSize',8); %Marca��o do ponto de plena carga 
grid on
title('Regula��o em fun��o do carregamento do transformador (modelo a fluxo constante)');
ylabel('Regula��o [%]'); xlabel('Carregamento do transformador [%]');
legend([pc2],'Ponto de plena carga');
xlim([30 130]); ylim([0 3]);
set(gca,'XTick',30:10:130);
hold off
