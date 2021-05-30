//EP2 da matéria MAP3121
//Diego Hidek Caetano Ide, 10336622
//Gustavo Donnini Chen, 10772925

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>

#define nOriginal 2048
#define nf 10
#define nFracoes 5

int main() {

    int i, j;
    char nome[60];
    FILE *pFileR;
    FILE *pFileW;
    char *titulo[5];
    titulo[0] = "resultados/dados_fracionados/dados2048.txt";
    titulo[1] = "resultados/dados_fracionados/dados1024.txt";
    titulo[2] = "resultados/dados_fracionados/dados512.txt";
    titulo[3] = "resultados/dados_fracionados/dados256.txt";
    titulo[4] = "resultados/dados_fracionados/dados128.txt";

    char *tituloRuido[5];
    tituloRuido[0] = "resultados/dados_fracionados/dados_c_ruido2048.txt";
    tituloRuido[1] = "resultados/dados_fracionados/dados_c_ruido1024.txt";
    tituloRuido[2] = "resultados/dados_fracionados/dados_c_ruido512.txt";
    tituloRuido[3] = "resultados/dados_fracionados/dados_c_ruido256.txt";
    tituloRuido[4] = "resultados/dados_fracionados/dados_c_ruido128.txt";

    double *fontes = (double*)calloc(nf, sizeof(double));
    double *dados2048 = (double*)calloc(2048, sizeof(double));
    double *dados1024 = (double*)calloc(1024, sizeof(double));
    double *dados512 = (double*)calloc(512, sizeof(double));
    double *dados256 = (double*)calloc(256, sizeof(double));
    double *dados128 = (double*)calloc(128, sizeof(double));

    printf("Digite o nome do arquivo .txt deste diretorio que pretende fracionar: ");
    scanf("%s", &nome);

    //Abre o arquivo indicado, lê as posições das fontes e armazena em fontes[], lê os valores de uT e armazena em dados2048[]
    pFileR = fopen(nome, "r");
    if (pFileR == NULL) {
        printf("\nNao foi possivel localizar o arquivo. Encerrando o programa.");
        return 0;
    }

    for (i = 0; i < nf; i++) {
        fscanf(pFileR, "%lf", &fontes[i]);
    }

    for (i = 0; i < nOriginal; i++) {
        fscanf(pFileR, "%lf", &dados2048[i]);
    }

    //Exporta os valores das posições das fontes
    pFileW = fopen("resultados/dados_fracionados/fontes.txt", "w");
    if (pFileW == NULL) {
        printf("\nNao foi possivel salvar os dados. Encerrando o programa.");
        return 0;
    }
    for (i = 0; i < nf; i++) {
        fprintf(pFileW, "%3.12lf    ", fontes[i]);    
    }

    //Exporta os dados originais fracionados nas devidas quantidades
    for (j = 0; j < nFracoes; j++) {
        pFileW = fopen(titulo[j], "w");
        if (pFileW == NULL) {
            printf("\nNao foi possivel salvar os dados. Encerrando o programa.");
            return 0;
        }
        for (i = 0; i <= nOriginal; i += pow(2,j)) {
            fprintf(pFileW, "%3.12lf\n", dados2048[i]);    
        }
    }

    titulo[0] = "resultados/dados_fracionados/dados2048_plot.txt";
    titulo[1] = "resultados/dados_fracionados/dados1024_plot.txt";
    titulo[2] = "resultados/dados_fracionados/dados512_plot.txt";
    titulo[3] = "resultados/dados_fracionados/dados256_plot.txt";
    titulo[4] = "resultados/dados_fracionados/dados128_plot.txt";

    //Exporta txt's para plotar
    for (j = 0; j < nFracoes; j++) {
        pFileW = fopen(titulo[j], "w");
        if (pFileW == NULL) {
            printf("\nNao foi possivel salvar os dados. Encerrando o programa.");
            return 0;
        }
        for (i = 0; i <= nOriginal; i += pow(2,j)) {
            fprintf(pFileW, "%3.12lf, ", dados2048[i]);    
        }
    }

    //Gera ruidos nos dados: 1. + r*E
    printf("Digite o seed que deseja usar: ");
    int seed;
    scanf("%d", &seed);
    srand(seed);
    for (i = 0; i < nOriginal; i++) {
        int numero = rand();
        double r = numero - (RAND_MAX / 2);
        r = r * 2;
        r = r / RAND_MAX; //r = variando de -1 a 1
        dados2048[i] = dados2048[i] * (1 + r*0.01);
    }

    //Exporta dados com ruido
    for (j = 0; j < nFracoes; j++) {
        pFileW = fopen(tituloRuido[j], "w");
        if (pFileW == NULL) {
            printf("\nNao foi possivel salvar os dados. Encerrando o programa.");
            return 0;
        }
        for (i = 0; i <= nOriginal; i += pow(2,j)) {
            fprintf(pFileW, "%3.12lf\n", dados2048[i]);    
        }
    }

    tituloRuido[0] = "resultados/dados_fracionados/dados_c_ruido2048_plot.txt";
    tituloRuido[1] = "resultados/dados_fracionados/dados_c_ruido1024_plot.txt";
    tituloRuido[2] = "resultados/dados_fracionados/dados_c_ruido512_plot.txt";
    tituloRuido[3] = "resultados/dados_fracionados/dados_c_ruido256_plot.txt";
    tituloRuido[4] = "resultados/dados_fracionados/dados_c_ruido128_plot.txt";
    
    //Exporta dados com ruido em txt
    for (j = 0; j < nFracoes; j++) {
        pFileW = fopen(tituloRuido[j], "w");
        if (pFileW == NULL) {
            printf("\nNao foi possivel salvar os dados. Encerrando o programa.");
            return 0;
        }
        for (i = 0; i <= nOriginal; i += pow(2,j)) {
            fprintf(pFileW, "%3.12lf, ", dados2048[i]);    
        }
    }
}