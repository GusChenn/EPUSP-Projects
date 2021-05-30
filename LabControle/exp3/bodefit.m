function [KKt,T] = bodefit(KKto,To,wdata,Gdata,Fdata)
% BODEFIT   Ajusta uma função de transferência do tipo KKt/(1+sT) a um
%           conjunto de dados contendo a sua resposta em frequência.
%
%           Uso:    [KKt,T] = bodefit(KKto,To,wdata,Gdata,Fdata)
%
%           onde:   KKto é uma condição inicial para o ganho
%                   To é uma condição inicial para a cte. de tempo
%                   wdata, Gdata, Fdata são os pontos levantados
%
%                   KKt é o valor ajustado para o ganho
%                   T é o valor ajustado para a cte. de tempo
%
%           wdata (em rad/s), Gdata (em dB) e Fdata (em graus) são
%           compatíveis com as variáveis geradas por RESPFREQ.

%           RPM/V2016a

% Prepara os dados
wdata=wdata(:); Gdata=Gdata(:); Fdata=Fdata(:); % converte em vetores coluna
Gdata = 10.^(Gdata/20);                         % converte dB em linear
Fdata = Fdata*pi/180;                           % converte graus em rad
V = Gdata .* (cos(Fdata) + j.*sin(Fdata));      % converte G,F em fasor

% Prepara otimização
% (em caso de problemas de convergência pode se alterar as opções abaixo)
options = optimset('Display','off','TolFun',1e-3,'TolX',1e-3);
xo = [KKto To];                                 % condição inicial

% Otimização
% Digite " >> doc fminsearch " no Matlab para saber mais sobre o algoritmo
xf =  fminsearch(@(x) erquad(x,wdata,Gdata,Fdata,V),xo,options);
KKt = xf(1); T = xf(2);                         % os resultados finais

end

function erq = erquad(KKtT,wdata,Gdata,Fdata,V)
% Calcula a raiz quadrada do erro quadrático entre a função de
% transferência candidata e os pontos levantados
% chamada pelo comando FMINSEARCH de BODEFIT.

KKt=KKtT(1); T=KKtT(2);         % desempacota o vetor
sis=tf(KKt,[T 1]);              % cria uma função de transferência

[GG,FF]=bode(sis,wdata);		% GG,FF são equivalentes a Gdata,Fdata
GG=squeeze(GG);                 % acerta dimensões                                
FF=squeeze(FF)*pi/180;          % acerta dimensões
VV=GG.*cos(FF) + j*GG.*sin(FF);	% VV é equivalente a V

erq=norm(VV-V);                 % raiz quadrada do erro quadrático

% Exibe gráficos para acompanhamento da otimização
% Inicialmente se reconstrói GG,FF,VV com mais pontos
% expande o range de wdata para deixar o diagrama de Bode mais bonito
WW = logspace(floor(log10(min(wdata))),ceil(log10(max(wdata))),200);
% Novos vetores
[GG,FF] = bode(sis,WW);   		% GG,FF são equivalentes a Gdata,Fdata
GG = squeeze(GG);                 % acerta dimensões                                
FF=squeeze(FF)*pi/180;          % acerta dimensões
VV=GG.*cos(FF) + j*GG.*sin(FF);	% VV é equivalente a V
% Diagrama de Bode
tit = sprintf('KKt = %g ; T = %g',KKtT);
% Localiza ou cria a figura
figlist = get(0,'Children');
nfig = length(figlist)+1;
for i=1:length(figlist)
    if strcmp('bodefit',get(figlist(i),'Name'))
        nfig = figlist(i);
        break
    end
end
figure(nfig)   
clf; set(gcf,'Color',[1 1 1],'Name','bodefit');
subplot(221);
set(gca,'FontSize',8);
h = semilogx(wdata,20*log10(Gdata),'ko',WW,20*log10(GG),'r-');
set(h(1),'MarkerSize',4,'MarkerFaceColor',[0 0 0]);
set(h(2),'LineWidth',2);
ylabel('Ganho (dB)');
title(tit);
grid on
subplot(223);
set(gca,'FontSize',8);
h = semilogx(wdata,Fdata*180/pi,'ko',WW,FF*180/pi,'r-');
set(h(1),'MarkerSize',4,'MarkerFaceColor',[0 0 0]);
set(h(2),'LineWidth',2);
ylabel('Fase (graus)');
xlabel('w [rad/s]')
grid on
% Diagrama de Nyquist
% expande o range para deixar o diagrama de Nyquist mais bonito
VV = [KKt ; VV ; 0];
subplot(122);
set(gca,'FontSize',8);
for i=1:length(wdata)
    h = plot([0 real(V(i))],[0 imag(V(i))]);
    set(h,'Color',0.6*[1 1 1]);
    hold on
end
h = plot(real(V),imag(V),'ko',real(VV),imag(VV),'r-');
hold off
set(h(1),'MarkerSize',4,'MarkerFaceColor',[0 0 0]);
set(h(2),'LineWidth',2);
ylabel('Imag');
xlabel('Real')
title('Diagrama de Nyquist');
grid on

drawnow; figure(gcf);		% atualiza a tela imediatamente

end

