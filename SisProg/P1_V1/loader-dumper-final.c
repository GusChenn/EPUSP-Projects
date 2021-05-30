// IMPORTANTE: CASO QUEIRA REALIZAR UM TESTE COM UMA ENTRADA DIFERENTE DA ATUAL, MUDAR A CONSTANTE TAMANHO_END_IN PARA O TAMANHO DA PALAVRA HEXA QUE DEFINE O ENDEREÇO INICIAL. ATUALMENTE, END. IN = E80, TAMANHO_END_IN = 3.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#define BASE 16
#define ARQUIVO_ENTRADA "input_load_dump.txt"
#define ARQUIVO_SAIDA "codigo_absoluto.txt"
#define TAMANHO_END_IN 3

// lê o ARQUIVO txt linha a linha, armazenando cada linha em um vetor diferente.
int lerLinhas(char primeira_linha[], char segunda_linha[], char terceira_linha[], char quarta_linha[], char arquivo_leitura[]) {
    FILE *fp;
    char fim_de_linha[10];

    fp = fopen(arquivo_leitura, "r");

    if (fp == NULL) {
        printf("Erro na leitura do arquivo");
        return 0;
    }

    fgets(primeira_linha, 4, fp);
    fgets(fim_de_linha, 10, fp);
    fgets(segunda_linha, 48, fp);
    fgets(fim_de_linha, 10, fp);
    fgets(terceira_linha, 48, fp);
    fgets(fim_de_linha, 10, fp);
    fgets(quarta_linha, 45, fp);

    fclose(fp);
    return 1;
}

// converte uma palavra hexa em um número decimal.
void Binario(int palavra_bin[], int deci) {
    int aux = deci;
    for (int i = 7; i >= 0; i--) {
        palavra_bin[i] = aux % 2;
        aux = floor(aux/2);
    }
}

// lê os dados do txt e imprime na tela os valores que devem ser salvos na memoria
void leituraDeDados(char primeira_linha[], char segunda_linha[], char terceira_linha[], char quarta_linha[], char arquivo_leitura[]) {
    lerLinhas(primeira_linha, segunda_linha, terceira_linha, quarta_linha, arquivo_leitura);

    printf("\nValores em hexadecimal que devem ser carregados:\n\n");
    printf("%s\n", primeira_linha);
    printf("%s\n", segunda_linha);
    printf("%s\n", terceira_linha);
    printf("%s\n", quarta_linha);
    printf("\n\n");
    
}

// mostra no terminal o valor atual da memória
void printMemoria(int memoria[]) {
    printf("Dados na memoria:\n\n");
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 153; j++) {
            printf("%d", memoria[j + 153*i]);
        }
        printf("\n");
    }
    printf("\n\n");
}

// zera a memoria. Fiz isso só para que não tenha nenhum valor não binário na memória. 
void zeraMemoria(int memoria[]) {
    for (int i = 0; i < 32; i++) {
        for (int j = 0; j < 153; j++) {
            memoria[j + 153*i] = 0;
        }
    }
    printf("\nMemoria zerada!\n\n");
}

// calcula o endereço inicial do Store a partir da primeira linha lida do TXT. 
void calcEndIn(char primeira_linha[], char *ptr, long endereco_inicial[]) {
// calculo da posicao inicial do vetor memoria[]. int = 32 bits.
// a função strtol realiza a conversão de um valor de uma base para decimal.
    endereco_inicial[0] = strtol(primeira_linha, &ptr, BASE); 
    printf("O endereco inicial e: %ld\n\n", endereco_inicial[0]);
}

// converte os dados das linhas 2 a 4 do TXT de hexa para decimal
void converteDados(long linha2deci[], long linha3deci[], long linha4deci[], char segunda_linha[], char terceira_linha[], char quarta_linha[], char *ptr) {
// conversão da primeira linha de dados (segunda linha do arquivo):
// armazena os valores convertidos em linha2deci[].
    linha2deci[0] = strtol(segunda_linha, &ptr, BASE);
    for (int i = 1; i < 16; i++) {
        linha2deci[i] = strtol(ptr, &ptr, BASE);
    }   
// conversão da segunda linha de dados.
    linha3deci[0] = strtol(terceira_linha, &ptr, BASE);
    for (int i = 1; i < 16; i++) {
        linha3deci[i] = strtol(ptr, &ptr, BASE);
    }
// conversão da terceira linha de dados.
    linha4deci[0] = strtol(quarta_linha, &ptr, BASE);
    for (int i = 1; i < 16; i++) {
        linha4deci[i] = strtol(ptr, &ptr, BASE);
    }

}

// converte os dados de decimal para binário, salvando estes no vetor bin_aux[], depois posiciona esse número binário na sua respectiva posição na memória.
void armazenaDados(int bin_aux[], long linha2deci[], long linha3deci[], long linha4deci[], int memoria[], long endereco_inicial) {
// Nesse ponto, temos todos os dados armazenados tanto em hexa quanto em decimal. Só nos resta armazenar os dados em binário.
// Para isso, dividirei o problema em 3 partes:
// 1. Converter um numero de decimal para binário => %2
// 2. Armazenar esse número na memória a partir do endereço inicial
// 3. guardar a ultima posição de memória escrita para poder escrever a proxima palavra a partir dela
// realizei a injeção dos dados na memória linha a linha. 
    for (int i = 0; i < 16; i++) {
        Binario(bin_aux, linha2deci[i]); // aqui temos a palavra convertida em bits em hexa_aux
        for (int j = 0; j < 8; j++) {
            memoria[endereco_inicial + j + i*8] = bin_aux[j];
        }
    }
    for (int i = 0; i < 16; i++) {
        Binario(bin_aux, linha3deci[i]); 
        for (int j = 0; j < 8; j++) {
            memoria[endereco_inicial + j + i*8 + 128] = bin_aux[j];
        }
    }
    for (int i = 0; i < 16; i++) {
        Binario(bin_aux, linha4deci[i]); 
        for (int j = 0; j < 8; j++) {
            memoria[endereco_inicial + j + i*8 + 256] = bin_aux[j];
        }
    }
}

// converte o vetor de valores decimais em um vetor de caracteres representado os valores decimais em hexa.
// n = quantidade de palavras que serão convertidas. Normalmente, n = 16. Para o endereço inicial, n = 1.
// t = tamanho da palavra hexa a ser convertida
void Hexadecimal(long decimal[], char hexa[], int n, int t) {
    long Q, R;
    int i,j;
    int contadorGlobal = 0;
    for (i = 0; i < n; i++) {
        Q = decimal[i];
        for (j = t + contadorGlobal - 1; j >= contadorGlobal; j--) {
            R = Q % 16;
            if (R < 10) {
                hexa[j] = R + 48;
            } else {
                hexa[j] = R + 55;
            }
            Q = floor(Q/16);
        }
        hexa[contadorGlobal + t] = 32;
        contadorGlobal = contadorGlobal + t + 1;
    }
}

// exporta a posição inicial e os dados da memória para um txt
int exportaLinhas(char primeira_linha[], char segunda_linha[], char terceira_linha[], char quarta_linha[]) {
    FILE *fp;

    fp = fopen(ARQUIVO_SAIDA, "w");

    if (fp == NULL) {
        printf("Erro na leitura do arquivo");
        return 0;
    }

    // exporta o endereço inicial:
    fprintf(fp, "%s\n", primeira_linha);

    // exporta as linhas de dados:
    // PROBLEMA: não consegui fazer a última linha exportar somente os n dígitos hexas que
    // o arquivo de entrada especifica. Completa a linha com zeros. 
    fprintf(fp, "%s\n", segunda_linha);
    fprintf(fp, "%s\n", terceira_linha);
    fprintf(fp, "%s\n", quarta_linha);
    return 1;
}

// realiza o dump da memória em um arquivo txt. 
void Dump(char primeira_linha[], char segunda_linha[], char terceira_linha[], char quarta_linha[], long endereco_inicial[], long linha2deci[], long linha3deci[], long linha4deci[]) {
    Hexadecimal(endereco_inicial, primeira_linha, 1, TAMANHO_END_IN); // primeira_linha recebe endereco_inicial em Hexa numa string
    Hexadecimal(linha2deci, segunda_linha, 16, 2);  // segunda_linha recebe a primeira linha de dados em hexa numa string
    Hexadecimal(linha3deci, terceira_linha, 16, 2); // ...
    Hexadecimal(linha4deci, quarta_linha, 16, 2);
    exportaLinhas(primeira_linha, segunda_linha, terceira_linha, quarta_linha);
}

void Load(char primeira_linha[], char segunda_linha[], char terceira_linha[], char quarta_linha[], long endereco_inicial[], char *ptr, long linha2deci[], long linha3deci[], long linha4deci[], int bin_aux[], int memoria[], char arquivo_leitura[]) {
    leituraDeDados(primeira_linha, segunda_linha, terceira_linha, quarta_linha, arquivo_leitura);
    calcEndIn(primeira_linha, ptr, endereco_inicial);
    converteDados(linha2deci, linha3deci, linha4deci, segunda_linha, terceira_linha, quarta_linha, ptr);
    armazenaDados(bin_aux, linha2deci, linha3deci, linha4deci, memoria, endereco_inicial[0]);
}

int main() {
// declaração de variáveis
    int memoria[4896]; //declara o vetor de 4896 bits (000 -> FFF)                                                      
    char *ptr;  // declara o ponteiro utilizado na funcao convHexDeci
    long endereco_inicial[1];  // declara o endereco inicial lido (primeira linha do TXT)
    long linha2deci[16];    // vetor covnertido em deci
    long linha3deci[16];    // vetor covnertido em deci
    long linha4deci[16];    // vetor covnertido em deci
    char primeira_linha[10]; // declara o vetor que guarda a primeira linha lida do TXT
    char segunda_linha[60]; // declara o vetor que guarda a segunda linha lida do TXT
    char terceira_linha[60];    // declara o vetor que guarda a terceira linha lida do TXT
    char quarta_linha[60];  // declara o vetor que guarda a quarta linha lida do TXT
    int bin_aux[8]; 
    int opcao = 0;
    
    printf("---------------------------------\nGustavo Donnini Chen\n10772925\n---------------------------------\n\n");

    while (opcao != 6) {
        printf("Eventos:\n");
        printf("1. Zerar a memoria atual\n");
        printf("2. Executar uma operacao de Load arquivo Entrada\n");
        printf("3. Executar uma operacao de Dump\n");
        printf("4. Imprimir a memoria atual\n");
        printf("5. Executar uma operacao de Load arquivo Codigo Absoluton\n");
        printf("6. Encerrar\n\n");
        printf("Escolha o evento: ");
        scanf("%d", &opcao);
        printf("\n\n");

        if (opcao == 1) {
            zeraMemoria(memoria);
        } else if (opcao == 2) {
            Load(primeira_linha, segunda_linha, terceira_linha, quarta_linha, endereco_inicial, ptr, linha2deci, linha3deci, linha4deci, bin_aux, memoria, ARQUIVO_ENTRADA);
        } else if (opcao == 3) {
            Dump(primeira_linha, segunda_linha, terceira_linha, quarta_linha, endereco_inicial, linha2deci, linha3deci, linha4deci);
        } else if (opcao == 4) {
            printMemoria(memoria);
        } else if (opcao == 5) {
            Load(primeira_linha, segunda_linha, terceira_linha, quarta_linha, endereco_inicial, ptr, linha2deci, linha3deci, linha4deci, bin_aux, memoria, ARQUIVO_SAIDA); 
        } else if(opcao == 6) {
            return 0;
        } else {
            printf("Operacao invalida\n\n");
        }
    }
    return 0;
}

