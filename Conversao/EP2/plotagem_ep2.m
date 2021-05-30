format long g
clear all
clc
close all

eixo_x = [0.1, 0.2, 0.3, 0.4, 0.5];
F1e = [9.14, 13.24,	20.92,	38.09,	91.78];
L1e = [0.195,	0.22,	0.256,	0.315,	0.436];
F2e = [9.53,	13.9,	22.21,	41.2,	103.34];
L2e = [0.198,	0.225,	0.263,	0.327,	0.461];

F1 = figure('name', 'Gráfico F1(e)');
F1 = plot(eixo_x, F1e);
xlabel('Tamanho do entreferro [cm]'); ylabel('Módulo da força');
grid on;

L1 = figure('name', 'Gráfico L1(e)');
L1 = plot(eixo_x, L1e);
xlabel('Tamanho do entreferro [cm]'); ylabel('Indutância');
grid on;

F2 = figure('name', 'Gráfico F2(e)');
F2 = plot(eixo_x, F2e);
xlabel('Tamanho do entreferro [cm]'); ylabel('Módulo da força');
grid on;

L2 = figure('name', 'Gráfico L2(e)');
L2 = plot(eixo_x, L2e);
xlabel('Tamanho do entreferro [cm]'); ylabel('Indutância');
grid on;

comparacao = figure('name', 'Comparação F1(e) e F2(e)');
plot(eixo_x, F1e);
hold on;
plot(eixo_x, F2e);
xlabel('Tamanho do entreferro [cm]'); ylabel('Módulo da força');
grid on;

comparacao2 = figure('name', 'Comparação L1(e) e L2(e)');
plot(eixo_x, L1e);
hold on;
plot(eixo_x, L2e);
xlabel('Tamanho do entreferro [cm]'); ylabel('Indutância');
grid on;
