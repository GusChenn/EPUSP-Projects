KrVec = [0.1, 1.49, 2.89, 3.294, 6.65, 10];
KcLGR2 = [0.0104, 13.4, 28.4, 47.9, 53.2;
          0.0728, 0.337, 2.37, 4.6, 5.46;
          0.137, 0.275, 0.477, 0.668, 0.826];
KcLGR1 = [0.0748, 0.454, 0.969;
          0.0758, 0.145, 0.365;
          0.0895, 0.0685, 0.2];

for i=1:1:3
    for j=1:1:5
        aux1 = strcat('controle posicao',(strcat(int2str(i),int2str(j))));
        aux2 = strcat('Esforco',(strcat(int2str(i),int2str(j))));
        aux3 = strcat('Erro',(strcat(int2str(i),int2str(j))));
        aux1 = strcat(aux1, '.fig');
        aux2 = strcat(aux2, '.fig');
        aux3 = strcat(aux3, '.fig');
        
        c=hgload(aux1);
        k=hgload(aux2);
        u=hgload(aux3);
        % Prepare subplots
        f1 = figure
        h(1)=subplot(3,1,1);
        h(2)=subplot(3,1,2);
        h(3)=subplot(3,1,3);
        % Paste figures on the subplots
        copyobj(allchild(get(c,'CurrentAxes')),h(1));
        copyobj(allchild(get(k,'CurrentAxes')),h(2));
        copyobj(allchild(get(u,'CurrentAxes')),h(3));
        % Add legends
        l(1)=legend(h(1),'Controle posição');
        l(2)=legend(h(2),'Esforço');
        l(3)=legend(h(3),'Erro');
        %titulo:
        titulo = strcat('Kr ',int2str(i),'-Kc ', int2str(j));
        title(titulo);
        saveas(f1, strcat(titulo,'.png'));
    end;
end;

for i=3:1:5
    for j=1:1:3
        aux1 = strcat('controle posicao',(strcat(int2str(i),int2str(j))));
        aux2 = strcat('Esforco',(strcat(int2str(i),int2str(j))));
        aux3 = strcat('Erro',(strcat(int2str(i),int2str(j))));
        aux1 = strcat(aux1, '.fig');
        aux2 = strcat(aux2, '.fig');
        aux3 = strcat(aux3, '.fig');
        
        c=hgload(aux1);
        k=hgload(aux2);
        u=hgload(aux3);
        % Prepare subplots
        f1 = figure
        h(1)=subplot(3,1,1);
        h(2)=subplot(3,1,2);
        h(3)=subplot(3,1,3);
        % Paste figures on the subplots
        copyobj(allchild(get(c,'CurrentAxes')),h(1));
        copyobj(allchild(get(k,'CurrentAxes')),h(2));
        copyobj(allchild(get(u,'CurrentAxes')),h(3));
        % Add legends
        l(1)=legend(h(1),'Controle posição');
        l(2)=legend(h(2),'Esforço');
        l(3)=legend(h(3),'Erro');
         %titulo:
        titulo = strcat('Kr ',int2str(i),'-Kc ', int2str(j));
        title(titulo);
        saveas(f1, strcat(titulo,'.png'));
    end;
end;

% c=hgload(aux1);
% k=hgload(aux2);
% u=hgload(aux3);
% % Prepare subplots
% figure
% h(1)=subplot(1,3,1);
% h(2)=subplot(1,3,2);
% h(3)=subplot(1,3,3);
% % Paste figures on the subplots
% copyobj(allchild(get(c,'CurrentAxes')),h(1));
% copyobj(allchild(get(k,'CurrentAxes')),h(2));
% copyobj(allchild(get(u,'CurrentAxes')),h(3));
% % Add legends
% l(1)=legend(h(1),'Controle posição');
% l(2)=legend(h(2),'Esforço');
% l(3)=legend(h(3),'Erro');