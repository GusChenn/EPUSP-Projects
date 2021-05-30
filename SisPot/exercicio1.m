%exercício 1
format long g
clear all
clc

%problema base:
PC = [9, 12, 24, 30]*(1e6)/3;  %Potências ativas   [B3: Scte, B4: Zcte, B5: Icte, B6: Scte]
QC = [6, 7.2, 18, 21]*(1e6)/3; %Potências reativas [B3: Scte, B4: Zcte, B5: Icte, B6: Scte]
VB1 = 88000/sqrt(3);           %tensão nominal da rede (tensão na barra 1)
CL = [20, 32, 28, 48, 16];      %comprimentos das linhas [B12, B23, B25, B26, B34]
Zl = 0.04 + j*0.2;

%vetor de impedâncias:
VZ = CL*Zl;

%vetor de potências aparentes:
SC = PC + j*QC;

%condições iniciais:
Icarga3 = conj(SC(1)/VB1);
Icarga4 = conj(SC(2)/VB1);
Zcarga4 = (VB1^2)/conj(SC(2));
Icarga5 = conj(SC(3)/VB1);
Icarga6 = conj(SC(4)/VB1);
modCarga5 = abs(Icarga5);
angCarga5 = ang(Icarga5);

%iteração:
for i=0:50
  IB34 = Icarga4;
  IB23 = Icarga4 + Icarga3;
  IB25 = Icarga3;
  IB26 = Icarga6;
  IB12 = Icarga3 + Icarga5 +Icarga6;
  VB2 = VB1 - IB12*(VZ(1));
  VB3 = VB2 - IB23*(VZ(2));
  VB5 = VB2 - IB25*(VZ(3));
  VB6 = VB2 - IB26*(VZ(4));
  VB4 = VB3 - IB34*(VZ(5));
  Icarga3 = conj(SC(1)/VB3);
  Icarga4 = VB4/Zcarga4;
  Icarga5 = modCarga5*(cos(angle(VB5)+angle(Icarga5)) + 1*j*sen(angle(VB5)+angle(Icarga5)))
  Icarga6 = conj(SC(4)/VB6);
end

disp(Icarga3);
disp(VB3);
