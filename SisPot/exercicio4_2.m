%exercício 4
format long g
clear all
clc

%estratégia:
%1. calcular/ declarar todas as impedâncias do circuito
%2. calcular as admitância
%3. montar as matrizes de admitâncias, fontes e cálculo da matriz de impedâncias
%4. resolver a eq matricial
%5 encontrar valores pedidos no enunciado

%1. problema base
%-------------------------------
Vg = 14490;
comp = [10000, 16000];
Zeq = j*1.15;
Zpt = 0.2779 + j*0.3921;
%carga 1
Z1a = 83.91 + j*33.01;
Z1b = 117.47 + j*46.21;
Z1c = 73.42 + j*28.89;
%carga 2
Z2ab = 617.56 + j*231.35;
Z2bc = 540.36 + j*202.43;
Z2ca = 385.97 + j*144.59;
%carga 3
Z3a = 165.26 + j*60.83;
Z3b = 198.32 + j*73;
Z3c = 123.95 + j*45.62;
Z3n = 5.6 + j*2.06;
%--------------------------------

%2. cálculo das admitâncias
Yeq = 1/Zeq;
%carga 1
Y1a = 1/Z1a;
Y1b = 1/Z1b;
Y1c = 1/Z1c;
%carga 2
Y2ab = 1/Z2ab;
Y2bc = 1/Z2bc;
Y2ca = 1/Z2ca;
%carga 3
Y3a = 1/Z3a;
Y3b = 1/Z3b;
Y3c = 1/Z3c;
Y3n = 1/Z3n;
%condutor
Ycond = 1 ./ (comp * Zpt);

%3. declaração da matriz
matrizY = [Y1a+Yeq+Ycond(1)  0  0  -Ycond(1)  0  0  -(Ycond(1)+Ycond(2))  0  0  0;
           0  Y1b  0  0  0  0  0  0  0  0;
           0  0  Y1c  0  0  0  0  0  0  0;
           -Ycond(1)  0  0  Ycond(1)+Ycond(2)+Y2ab+Y2ca  -Y2ab  -Y2ca  -Ycond(2)  0  0  0;
           0  0  0  -Y2ab  Y2ab+Y2bc  -Y2bc  0  0  0  0;
           0  0  0  -Y2ca  -Y2bc  Y2bc+Y2ca  0  0  0  0;
           -(Ycond(1)+Ycond(2))  0  0  -Ycond(2)  0  0  Ycond(2)+Y3a  0  0  -Y3a;
           0  0  0  0  0  0  0  Y3b  0  -Y3b;
           0  0  0  0  0  0  0  0  Y3c  -Y3c;
           0  0  0  0  0  0  -Y3a  -Y3b  -Y3c  Y3a+Y3b+Y3c+Y3n;];

vetorFontes = [Yeq*Vg/sqrt(3)*exp(i*0); Yeq*Vg/sqrt(3)*exp(i*-120); Yeq*Vg/sqrt(3)*exp(i*120); 0; 0; 0; 0; 0; 0; 0];
matrizZ = inv(matrizY);

%4. cálculo das tensões nos nós definidos
V = linsolve(matrizZ, vetorFontes);
