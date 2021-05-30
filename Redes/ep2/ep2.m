% PTC3360 - 2019
% EP2: Simulacao de M-PAM

% Script para ser completado

clear

M=4;
EbN=7;                  % Relacao Eb/N (dB)
num=1e5;                  % Numero de si?mbolos gerados
Ep = 1;
Eb = (M^2-1)/(3*log2(M));
N = Eb/(10^(EbN/10));
NUSP = 10772925;
%--------------------

randn('seed',NUSP);
rand('seed',NUSP);

% Vetor com N variaveis aleatorias (v.a.) uniformes entre 0 e M
v=M*rand(1,num);

% v.a. discreta (0,1,....M-1)
v=fix(v);

% Amplitudes M-PAM
for i=1:1:M
    a(i)=(2*i-M-1);
end;

% Parcela do sinal na saida amostrada do filtro casado 
for i=1:1:num;
    for j=1:1:M
        if(v(i)==j-1)
            xo(i) = a(j);
        end;
    end;
end;

% Potencia do rui?do na sai?da amostrada do filtro casado
sig2=N/2;

% Parcela do rui?do na sai?da amostrada do filtro casado
no=sqrt(sig2)*randn(1,num);
 
% Sai?da amostrada do filtro casado
r=xo+no;

% Densidade de probabilidade de r
figure(1)
[n,b]=hist(r,100);  
fr=n;
bar(b,fr);
 
% Detecao dos si?mbolos
ad=zeros(1,num);
% Simbolo externo
ad(r<2-M)=-(M-1);
% Si?mbolos internos
%limiares: 
for i=1:M-1
    limiar(i) = (2*i - M);
end;

for i=2:M-1
    for j=1:num
        if r(j) > limiar(i-1);
            if r(j) < limiar(i);
                ad(j) = a(i);
            end;
        end;
    end;
end;

% Si?mbolo externo
ad(r>M-2)=M-1;

% Erros de si?mbolo
errs=(xo ~= ad);
% N?mero de erros de simbolo
soma = sum(errs)


% Probabilidade de erro de simbolo medida
PeM= soma/num; 

% Probabilidade de erro de bit resultante, admitindo um erro de bit por erro de simbolo
Pe=PeM/log2(M);
 
% Probabilidade de erro de bit calculada
% Argumento de Q(.)
w=sqrt((6*log2(M)*10^(EbN/10))/(M^2-1));
PeMc=2*(M-1)*q(w)/M;
Pec=PeMc/log2(M);
