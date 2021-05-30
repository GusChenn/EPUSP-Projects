clear all;
close all;
clc
% -------------------------------------------------------------------------
% 1. Dados de simula??o
% -------------------------------------------------------------------------
% 1.1 Caso base
% -------------------------------------------------------------------------
VB1 = 138000/sqrt(3);        % Tens?o nominal na barra B1
PC  = [15 20 40 50]*(1e6)/3; % Pot?ncias das cargas [MW]: B3 (Pcte), B4 (Zcte), B5 (Icte) e B6 (Pcte)
QC  = [10 12 30 35]*(1e6)/3; % Pot?ncias das cargas [MW]: B3 (Pcte), B4 (Zcte), B5 (Icte) e B6 (Pcte)
ZL  = 0.04 + 1i*0.2;         % Imped?ncia da linha [ohms/km]
CT  = [25 40 35 60 20];      % Comprimento dos trechos [km]: B1-B2; B2-B3; B2-B5; B2-B6; B3-B4
% -------------------------------------------------------------------------
% 1.2 Varia??es
% -------------------------------------------------------------------------
VBSE   = [1 1 1 1 88/138 88/138 88/138 88/138]; % Varia??es das tens?es na barra B1
CARGAS = [1 1 0.8 0.8 0.6 0.6 0.48 0.48];       % PU das pot?ncias ativa e reativa
ZLIN   = [1 0.8 1 0.8 1 0.8 1 0.8];             % PU das imped?ncias (reflete no comprimento do trecho)
% -------------------------------------------------------------------------
% 1.3 Solu??o do problema
% -------------------------------------------------------------------------
for aux1=1:length(VBSE);
    % 1.3.1. Mapa das varia??es
    Vb1     = VB1*VBSE(aux1);
    Pcargas = PC*CARGAS(aux1);
    Qcargas = QC*CARGAS(aux1);
    Scargas = Pcargas + 1i*Qcargas;
    Zlinha  = ZL*CT*ZLIN(aux1);
    % 1.3.2. Processo iterativo
    % a) Valores iniciais
    IcargaB3 = conj(Scargas(1)/Vb1);
    IcargaB4 = conj(Scargas(2)/Vb1);
    ZcargaB4 = (Vb1^2)/conj(Scargas(2));
    IcargaB5 = conj(Scargas(3)/Vb1);
    ModIB5   = abs(IcargaB5);
    AngIB5   = angle(IcargaB5);
    IcargaB6 = conj(Scargas(4)/Vb1);
    for aux2=1:40
        IB3B4 = IcargaB4;
        IB2B3 = IcargaB3 + IcargaB4;
        IB2B5 = IcargaB5;
        IB2B6 = IcargaB6;
        IB1B2 = IB2B3+IB2B5+IB2B6;
        VB2   = Vb1 - Zlinha(1)*IB1B2;
        VB3   = VB2 - Zlinha(2)*IB2B3;
        VB5   = VB2 - Zlinha(3)*IB2B5;
        VB6   = VB2 - Zlinha(4)*IB2B6;
        VB4   = VB3 - Zlinha(5)*IB3B4;
        IcargaB3 = conj(Scargas(1)/VB3);
        IcargaB4 = VB4/ZcargaB4;
        IcargaB5 = ModIB5*(cos(angle(VB5)+AngIB5) + 1i*sin(angle(VB5)+AngIB5));
        IcargaB6 = conj(Scargas(4)/VB6);
    end
    fprintf('%f %f %f %f %f %f\n\n',...
        min([abs(VB2) abs(VB3) abs(VB4) abs(VB5) abs(VB6)])/Vb1, ...
        real(Zlinha)*[abs(IB1B2)^2; abs(IB2B3)^2; abs(IB2B5)^2; abs(IB2B6)^2; abs(IB3B4)^2]/1e6, ...
        abs(IB1B2), ...
        abs(IcargaB6), ...
        real(VB3*conj(IcargaB3))/1e6, ...
        real(VB4*conj(IcargaB4))/1e6);        
end