%Dados:
K = 54.96; %check
KNL = 59.7881; %check
KKt = 0.93; %check
KtL = KKt/K; %check
KtNL = KKt/KNL; %check
Kp = 1.604; %check
T = 0.27; %check
U = Kp*pi/2; %equivalente de 90º em Volts
phi = 1.2088; %check
n = 1/3; %check
opt = stepDataOptions('StepAmplitude',U);

%5. funções step:
KrVec = [0.5, 1.49, 2.89, 3.294, 6.65, 10];
KcLGR2 = [0.0104, 13.4, 28.4, 47.9, 53.2;
          0.0728, 0.337, 2.37, 4.6, 5.46;
          0.137, 0.275, 0.477, 0.668, 0.826];
KcLGR1 = [0.0748, 0.454, 0.969;
          0.0758, 0.145, 0.365;
          0.0895, 0.0685, 0.2];
 
%5. Simula e plota os gráficos:
for i=1:1:3
    for j=1:1:5
        Kr = KrVec(i);
        Kc = KcLGR2(i, j);
        sim('modeloexp8', 10);
        
        %plot controle de posiçao:
        f1 = figure;
        hold on;
        plot(U_sim);
        plot(Vp_simL);
        plot(Vp_simNL);
        legend('Entrada', 'Vp linear', 'Vp não linear');
        title('Controle de posição');
        xlabel('Tempo [s]');
        ylabel('Vp [V]');
        ylim([-2 5]);
        pbaspect([2 1 1]);
        grid on;
        hold off;
        
        %plot esforço de controle
        f2 = figure;
        hold on;
        plot(VmL);
        plot(VmNL);
        legend('Vm linear', 'Vm não linear');
        title('Esforço de controle');
        xlabel('Tempo [s]');
        ylabel('Vm [V]');
        ylim([-2 5]);
        pbaspect([2 1 1]);
        grid on;
        hold off;
        
        %plot Erro de  posição
        f3 = figure;
        hold on;
        plot(U_sim - Vp_simL);
        plot(U_sim - Vp_simNL);
        legend('Erro linear', 'Erro não linear');
        title('Erro de posição');
        xlabel('Tempo [s]');
        ylabel('Erro [V]');
        ylim([-2 5]);
        pbaspect([2 1 1]);
        grid on;
        hold off;
        
        aux1 = strcat('controle posicao',(strcat(int2str(i),int2str(j))));
        aux2 = strcat('Esforco',(strcat(int2str(i),int2str(j))));
        aux3 = strcat('Erro',(strcat(int2str(i),int2str(j))));
        saveas(f1, aux1);
        saveas(f2, aux2);
        saveas(f3, aux3);
    end;
end;

for i=3:1:5
    for j=1:1:3
        Kr = KrVec(i);
        Kc = KcLGR2(i-2, j);
        sim('modeloexp8', 10);
        
        %plot controle de posiçao:
        f1 = figure;
        hold on;
        plot(U_sim);
        plot(Vp_simL);
        plot(Vp_simNL);
        legend('Entrada', 'Vp linear', 'Vp não linear');
        title('Controle de posição');
        xlabel('Tempo [s]');
        ylabel('Vp [V]');
        ylim([-2 5]);
        pbaspect([2 1 1]);
        grid on;
        hold off;
        
        %plot esforço de controle
        f2 = figure;
        hold on;
        plot(VmL);
        plot(VmNL);
        legend('Vm linear', 'Vm não linear');
        title('Esforço de controle');
        xlabel('Tempo [s]');
        ylabel('Vm [V]');
        ylim([-2 5]);
        pbaspect([2 1 1]);
        grid on;
        hold off;
        
        %plot Erro de  posição
        f3 = figure;
        hold on;
        plot(U_sim - Vp_simL);
        plot(U_sim - Vp_simNL);
        legend('Erro linear', 'Erro não linear');
        title('Erro de posição');
        xlabel('Tempo [s]');
        ylabel('Erro [V]');
        ylim([-2 3]);
        pbaspect([2 1 1]);
        grid on;
        hold off;
        
        aux1 = strcat('controle posicao',(strcat(int2str(i),int2str(j))));
        aux2 = strcat('Esforco',(strcat(int2str(i),int2str(j))));
        aux3 = strcat('Erro',(strcat(int2str(i),int2str(j))));
        saveas(f1, aux1);
        saveas(f2, aux2);
        saveas(f3, aux3);
    end;
end;

