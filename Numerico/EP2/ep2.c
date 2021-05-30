#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>

#define T 1

//FUNÇÕES P EXPORTAÇÃO E LEITURA DE ARQUIVOS: --------------------------------------------------------------------------------------------------
void exporta_vetores(FILE *pFile, double *vetor, int n) {
    int i;
    for (i = 0; i < n; i++) {
        fprintf(pFile, "%lf,", vetor[i]);
    }
    fprintf(pFile, "\n");
}

FILE *inicia_exportacao(char *nome) {
    FILE *pFile;
    pFile = fopen(nome, "w");
    if (pFile == NULL) {
        printf("\nErro ao criar o arquivo .csv");
    }
    return pFile;
}

FILE *inicia_leitura(char *nome) {
    FILE *pFile;
    pFile = fopen(nome, "r");
    if (pFile == NULL) {
        printf("\nErro ao ler o arquivo");
    }
    return pFile;
}

void show_vector(double *A, int n) {
    for (int i = 0; i < n; i++) {
        printf("%2.5f ", A[i]);
    }
    printf("\n");
}

void show_matrix(double *A, int linha, int coluna) {
    for (int i = 0; i < linha; i++) {
        for (int j = 0; j < coluna; j++) {
            printf("%2.5f  ", *(A + coluna*i + j));
        }
        printf("\n");
    }
}
//----------------------------------------------------------------------------------------------------------------------------------------------

//FUNÇÕES P CALCULAR PARAMETROS DE F E FK: -----------------------------------------------------------------------------------------------------
//parte temporal de f. Calcula valores no instante k
double calculaR(int n, double deltaT, int k) {
    int i;
    double t;
    double r;

    t = k * deltaT;
    r = 10*(1 + cos(5*t));

    return r;
}

//parte espacial de f
double *calculaG(int n, double p, double deltaX) {
    int i; 
    double h, x;
    double *vetor = (double*)calloc(n, sizeof(double));

    h = deltaX;
    for (i = 0; i < n; i++) {
        x = i*deltaX;
        if (p-(h/2) <= x && p+(h/2) >= x) {
            vetor[i] = 1/h;
        } else {
            vetor[i] = 0;
        }
    }
    return vetor;
}

//calcula fk e fk1 usando calculaR e calculaG.
void calculaF(double *fk, double *fk1, int n, double p, double deltaT, double deltaX, int k) {
    int i;
    double rAux;
    double *gAux = (double*)calloc(n, sizeof(double));
    //1. calcula g & r para o tempo k, calcula f e atribui a fk
    gAux = calculaG(n, p, deltaX);
    rAux = calculaR(n, deltaT, k);

    for (i = 0; i < n; i++) {
        fk[i] = rAux*gAux[i];
    }

    //2. calcula r para o tempo k+1, calcula f e atribui a fk1. Precisamos de f(t+1) para resolver o sistema pelo método de Crank Nicolson.
    rAux = calculaR(n, deltaT, k+1);

    for (i = 0; i < n; i++) {
        fk1[i] = rAux*gAux[i];
    }
}
//----------------------------------------------------------------------------------------------------------------------------------------------

//FUNÇÕES P RESOLUÇÃO DE SISTEMAS: -------------------------------------------------------------------------------------------------------------
double *condIn(int n) {
    int i;
    double *vetor = (double*)calloc(n, sizeof(double));
    for (i = 0; i < n; i++) {
        vetor[i] = 0;
    }
    return vetor;
}

void montaA(double *A_diag, double *A_sub, int n, double lambda) {
    int i;
    for (i = 0; i < n-1; i++) {
        A_diag[i] = 1 + lambda;
        A_sub[i] = -(lambda/2);
    }
    A_diag[i] = 1 + lambda;
    A_sub[i] = 0;
}

void montaRHS(double *RHS, double *fki, double *uki, double deltaT, int n, double *fki1, double lambda) {
    int i;
    for (i = 0; i < n; i++) {
        *(RHS + i) = *(uki + i) + (deltaT/2)*(*(fki + i)+(*(fki1 + i))) + (lambda/2)*(uki[i-1] - 2*uki[i] + uki[i+1]);
    }
}

void LDL(double *A_diag, double *A_sub, double *L, double *D, int n){

    //atribuição das condições iniciais:
    D[0] = A_diag[0];
    L[0] = A_sub[0]/D[0];

    //loop que calcula os valores seguintes de L e D:
    int i;    
    for (i = 1; i < n; i++) {
        D[i] = A_diag[i] - (L[i-1]*L[i-1]*D[i-1]);
        L[i] = A_sub[i] / D[i];
    }
}

double *resolveSist(double *L, double *D, double *RHS, int n){
    //Considerando Lt * X = Y e D * Y = Z, teremos L * Z = RHS:
    double *vetor_auxiliar = (double*)calloc(n, sizeof(double));
    int i;

    //atribuição da condição inicial da solução de Z:
    *(vetor_auxiliar) = *(RHS);

    //acha o vetor das soluções de Z:
    for (i = 1; i < n; i++) {
        *(vetor_auxiliar + i) = *(RHS + i) - (*(L + i - 1)*(*(vetor_auxiliar + i - 1)));
    }

    //acha as soluções de Y:
    for (i = 0; i < n; i++) {
        *(vetor_auxiliar + i) = (*(vetor_auxiliar + i))/(*(D + i));
    }

    //condição inicial da solução de X já está no vetor vetor_auxiliar
    //acha as soluções de X:
    for (i = n-2; i >= 0; i--) {
        *(vetor_auxiliar + i) = *(vetor_auxiliar + i) - (*(L + i)*(*(vetor_auxiliar + i + 1)));
    }

    return vetor_auxiliar;
}
//----------------------------------------------------------------------------------------------------------------------------------------------

//FUNÇÕES GENERICAS: ---------------------------------------------------------------------------------------------------------------------------
double calculaLambda(int m, int n) {
    return (pow((double)n,2)*T/ (double)m);
}

void vetorPmatriz(double *vetor, double *matriz, int linha, int n) {
    int i;
    for (i = 0; i < n; i++) {
        matriz[n*linha + i] = vetor[i];
    }
}

void matrizPvetor(double *matriz, double *vetor, int linha, int n) {
    int i;
    for (i = 0; i < n; i++) {
        vetor[i] = matriz[n*linha + i];
    }
}

void reconstroiDados(double *a, double *ukt, int n, int nf, FILE *pFile) {
    double *vetor = (double*)calloc(n, sizeof(double));
    int i, j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < nf; j++) {
            vetor[i] += ukt[n*j + i] * a[j];
        }
    }
    exporta_vetores(pFile, vetor, n);
}
//----------------------------------------------------------------------------------------------------------------------------------------------

//FUNÇÕES RELACIONADAS A MMQ: ------------------------------------------------------------------------------------------------------------------
double prodVetorial(double *u, double *v, int n) {
    int i;
    double aux = 0;
    
    for (i = 0; i < n; i++) {
        aux += u[i]*v[i];
    }

    return aux;
}

double *montaUt(int nf, int n, double *ukt, double *pesos) {
    int i, j;
    double *vetor = (double*)calloc(n, sizeof(double));
    for (i = 0; i < nf; i++) {
        for (j = 0; j < n; j++) {
            vetor[j] += pesos[i]*ukt[i*n + j];
        }
        
    }
    return vetor;
}

//A e L são matrizes, D é vetor
void cholesky(double *A, double *L, double *D, int n) {
    int i, j, k;
    double somaAuxD = 0;
    double somaAuxL = 0;

    //1. condições iniciais:
    D[0] = A[0];
    for (i = 0; i < n; i++) {
        L[n*i + i] = 1;
    }

    //2. calculo da primeira coluna:
    for (i = 0; i < n; i++) {
        L[n*i] = A[n*i]/D[0];
    }

    //3. processo iterativo
    for (j = 1; j < n-1; j++) {
        for (i = j+1; i < n; i++) {
            for (k = 0; k < j; k++) {
                somaAuxD += L[n*j + k] * L[n*j + k] * D[k]; 
                somaAuxL += L[n*i + k] * D[k] * L[n*j + k];
            }
        D[j] = A[n*j + j] - somaAuxD;
        L[n*i + j] = (A[n*i + j] - somaAuxL)/D[j];
        somaAuxD = 0;
        somaAuxL = 0;
        }
    }

    //4. calculo do ultimo D
    for (k = 0; k < j; k++) {
        somaAuxD += L[n*j + k] * L[n*j + k] * D[k]; 
    }
    D[j] = A[n*j + j] - somaAuxD;
}

double *resolveSistNormal(double *L, double *D, double *b, int n) {
    
    int i, k;
    double somaAuxZ = 0;
    double somaAuxX = 0;
    //temos que L*D*Lt*x = b. Podemos assumir Lt*x = y e D*y = z e resolver o sistema pelos seguintes passos:

    //1. Alocação do vetor auxiliar
    double *vetor = (double*)calloc(n, sizeof(double));

    //2. Calculo de z (L*z = b)
    //2.1. calculo do primeiro z
    vetor[0] = b[0]/L[0];

    //2.2. processo iterativo
    for (i = 1; i < n; i++) {
        for (k = 0; k < i; k++) {
            somaAuxZ += L[n*i + k] * vetor[k]; 
        }
        vetor[i] = b[i] - somaAuxZ;
        somaAuxZ = 0;
    }

    //3. Calculo de y (D*y = z) : ja temos os valores de z armazenados em 'vetor'. Com eles, podemos calcular os valores de y e armazenar no proprio 'vetor'. Como D é diagonal, podemos ir direto para o processo iterativo:
    for (i = 0; i < n; i++) {
        vetor[i] = vetor[i]/D[i];
    }

    //4. Calculo de x (Lt*x = y)
    //4.1. calculo do ultimo x
    vetor[n-1] = vetor[n-1]/L[(n*n)-1];

    //4.2. processo iterativo
    for (i = n-2; i >= 0; i--) {
        for (k = n-1; k > i; k--) {
            somaAuxX += L[n*k + i]*vetor[k];
        }
        vetor[i] = vetor[i] - somaAuxX;
        somaAuxX = 0;
    }

    return vetor;

}

void montaSistNormal(double *uT, double *ukt, int n, int nf, double *LHS, double *b) {
    int i, j, k;

    //vetores: uT, b
    //matrizes: ukt, LHS

    //1. monta a matriz dos produtos vetoriais e coloca os resultados em LHS
    for (i = 0; i < nf; i++) {
        for (j = 0; j < nf; j++) {
            for (k = 0; k < n; k++) {
                LHS[nf*i + j] += ukt[n*j + k] * ukt[n*i + k];
            }
        }
    }
    
    //2. monta o vetor b com os produtos vetoriais entre ukt e uT

    for (i = 0; i < nf; i++) {
        for (k = 0; k < n; k++) {
            b[i] += uT[k] * ukt[n*i + k];
        }
    }
}

double erroQuadratico(double *uT, double *ukt, double deltaX, int n, int nf, double *a) {
    //vetores: uT, a
    //matrizes: ukt
    
    int i, j, k;
    double *somaAuxAk = (double*)calloc(n, sizeof(double)); 
    double somaAuxDif;
    double E2;

    //1. calculo do somatorio ak*ukT:
    //neste loop, calculamos a superposicao dos efeitos das 10 fontes com seus devidos pesos e armazenamos no vetor somaAuxAk, que representa nossa "solucao final" do problema de distribuicao de calor
    for (i = 0; i < n; i++) {
        for (k = 0; k < nf; k++) {
            somaAuxAk[i] += a[k]*ukt[n*k + i];
        }
    }

    //2. calculo dos erros em casa posicao da barra:
    //nesse loop, calculamos a diferenca entre a distribuicao final de calor medida e a calculada por nosso programa em cada ponto xi da barra
    for (i = 0; i < n; i++) {
        somaAuxDif += pow(uT[i] - somaAuxAk[i], 2); 
    }

    //3. multiplicacao por deltaX e calculo da raiz
    E2 = sqrt(somaAuxDif*deltaX);

    return E2;

}
//----------------------------------------------------------------------------------------------------------------------------------------------

//TESTES DOS ITENS DO ENUNCIADO: ---------------------------------------------------------------------------------------------------------------
void itemA() {
    int n = 128;
    int nf = 1;
    double p1 = 0.35;
    char *titulo[6];
    titulo[0] = "resultados/itemA/fonte1.csv";
    titulo[1] = "resultados/itemA/fonte2.csv";
    titulo[2] = "resultados/itemA/fonte3.csv";
    titulo[3] = "resultados/itemA/fonte4.csv";
    titulo[4] = "resultados/itemA/fonte5.csv";
    titulo[5] = "resultados/itemA/fonte6.csv";

    int i;
    double deltaT, deltaX, lambda;
    FILE *pFile;

    //calculo de parametros (iguais para todas as fontes)
    printf("\nCalculando parametros...");
    deltaT = T/(double)n;
    deltaX = 1/(double)n;
    lambda = calculaLambda(n, n);

    //alocação de memória
    printf("\nAlocando memoria...");
    double *fk = (double*)calloc(n, sizeof(double));
    double *fk1 = (double*)calloc(n, sizeof(double));
    double *uki = (double*)calloc(n, sizeof(double));
    double *Adiag = (double*)calloc(n, sizeof(double));
    double *Asub = (double*)calloc(n, sizeof(double));
    double *RHS = (double*)calloc(n, sizeof(double));
    double *L = (double*)calloc(n, sizeof(double));
    double *D = (double*)calloc(n, sizeof(double));
    double *ukt = (double*)calloc(nf*n, sizeof(double));
    double *uT = (double*)calloc(n, sizeof(double));

    //monta A e decompoe LDL (iguais para todas as fontes)
    printf("\nMontando matriz A e decompondo...");
    montaA(Adiag, Asub, n, lambda);
    LDL(Adiag, Asub, L, D, n);

    //inicia exportação, atribui condição inicial e exporta cond in para cada fonte
    printf("\nIniciando exportacao...");
    pFile = inicia_exportacao(titulo[0]);
    uki = condIn(n);
    exporta_vetores(pFile, uki, n);
    
    printf("\nCalculando f, montando vetor RHS e resolvendo o sistema...");
    //calcula F, monta RHS, resolve e exporta uki de cada fonte.
    for (i = 1; i<=n-1; i++) {
        calculaF(fk, fk1, n, p1, deltaT, deltaX, i);
        montaRHS(RHS, fk, uki, deltaT, n, fk1, lambda);
        uki = resolveSist(L, D, RHS, n);
        exporta_vetores(pFile, uki, n); //estou exportando todas as linhas para eventuais perguntas no relatorio, mas só temos interesse em u(T,xi)
    }

    printf("\nArmazenando os resultados de ukT...");
    vetorPmatriz(uki, ukt, 0, n);

    printf("\nDefinindo uT...");
    //Definição do vetor uT segundo item A:
    for (i = 0; i < n; i++) {
        uT[i] = 7*ukt[i];
    }
    printf("\nMontando e resolvendo sistema normal...");

    //Montagem e solução do sistema normal:
    double A11 = prodVetorial(ukt, ukt, n);
    double B1 = prodVetorial(uT, ukt, n);
    double a1 = B1/A11;

    printf("\n\n---------------------------------------------------------------------------------------");
    printf("\nIntensidade a1: %3.12lf", a1);
    printf("\n---------------------------------------------------------------------------------------\n\n");
    free(fk);
    free(fk1);
    free(uki);
    free(Adiag);
    free(Asub);
    free(RHS);
    free(L);
    free(D);
    free(ukt);
    free(uT);
}

void itemB() {
    int n = 128;
    int nf = 4;
    double *p = (double*)calloc(nf, sizeof(double));
    p[0] = 0.15;
    p[1] = 0.3;
    p[2] = 0.7;
    p[3] = 0.8;
    char *titulo[6];
    titulo[0] = "resultados/itemB/fonte1.csv";
    titulo[1] = "resultados/itemB/fonte2.csv";
    titulo[2] = "resultados/itemB/fonte3.csv";
    titulo[3] = "resultados/itemB/fonte4.csv";
    titulo[4] = "resultados/itemB/fonte5.csv";
    titulo[5] = "resultados/itemB/fonte6.csv";
    double *pesos = (double*)calloc(nf, sizeof(double));
    pesos[0] = 2.3;
    pesos[1] = 3.7;
    pesos[2] = 0.3;
    pesos[3] = 4.2;

    int i, j;
    double deltaT, deltaX, lambda, aux;
    FILE *pFile;

    //calculo de parametros (iguais para todas as fontes)
    printf("\nCalculando parametros...");
    deltaT = T/(double)n;
    deltaX = 1/(double)n;
    lambda = calculaLambda(n, n);

    //alocação de memória
    printf("\nAlocando memoria...");
    double *fk = (double*)calloc(n, sizeof(double));
    double *fk1 = (double*)calloc(n, sizeof(double));
    double *uki = (double*)calloc(n, sizeof(double));
    double *Adiag = (double*)calloc(n, sizeof(double));
    double *Asub = (double*)calloc(n, sizeof(double));
    double *RHS = (double*)calloc(n, sizeof(double));
    double *LHS = (double*)calloc(nf*nf, sizeof(double));
    double *b = (double*)calloc(nf, sizeof(double));
    double *a = (double*)calloc(nf, sizeof(double));
    double *L = (double*)calloc(n*n, sizeof(double));
    double *D = (double*)calloc(n, sizeof(double));
    double *L2 = (double*)calloc(n*n, sizeof(double));
    double *D2 = (double*)calloc(n, sizeof(double));
    double *ukt = (double*)calloc(nf*n, sizeof(double));
    double *uT = (double*)calloc(n, sizeof(double));

    //monta A e decompoe LDL (iguais para todas as fontes)
    printf("\nMontando matriz A e decompondo...");
    montaA(Adiag, Asub, n, lambda);
    LDL(Adiag, Asub, L, D, n);

    //inicia exportação, atribui condição inicial e exporta cond in para cada fonte
    printf("\nIniciando exportacao...");
    printf("\nCalculando f, montando vetor RHS e resolvendo o sistema para cada fonte pontual...");
    for (j = 0; j < nf; j++) {
        aux = p[j];
        pFile = inicia_exportacao(titulo[j]);
        uki = condIn(n);
        exporta_vetores(pFile, uki, n);
    
        //calcula F, monta RHS, resolve e exporta uki de cada fonte.
        for (i = 1; i<=n-1; i++) {
            calculaF(fk, fk1, n, aux, deltaT, deltaX, i);
            montaRHS(RHS, fk, uki, deltaT, n, fk1, lambda);
            uki = resolveSist(L, D, RHS, n);
            exporta_vetores(pFile, uki, n); //estou exportando todas as linhas para eventuais perguntas no relatorio, mas só temos interesse em u(T,xi)
        }
        printf("\nArmazenando os resultados de ukT...");
        vetorPmatriz(uki, ukt, j, n);
    }


    //Definição do vetor uT segundo item B:
    printf("\nDefinindo uT...");
    uT = montaUt(nf, n, ukt, pesos);

    //Montagem e solução do sistema normal:
    printf("\nMontando e resolvendo sistema normal...");
    montaSistNormal(uT, ukt, n, nf, LHS, b);
    cholesky(LHS, L2, D2, nf); 
    a = resolveSistNormal(L2, D2, b, nf);
    printf("\n\n---------------------------------------------------------------------------------------");
    printf("\nAs intensidades das fontes sao:");
    for (i = 0; i < nf; i++) {
        printf("\na%d: %3.12lf", i, a[i]);
    }
    printf("\n---------------------------------------------------------------------------------------\n\n");

    free(fk);
    free(fk1);
    free(uki);
    free(Adiag);
    free(Asub);
    free(RHS);
    free(LHS);
    free(b);
    free(a);
    free(L);
    free(D);
    free(L2);
    free(D2);
    free(ukt);
    free(uT);
}

void itemC(int n, char *arquivoUt, char *arquivoFontes, char *titulo[11], char *arquivoDadosFinais) {
    int nf = 10;
    double *p = (double*)calloc(nf, sizeof(double));  
    int i, j;
    double deltaT, deltaX, lambda, aux, E2;
    FILE *pFileW;
    FILE *pFileR;
    FILE *pFileW2;

    //Leitura das posições das fontes
    printf("\nLendo as posicoes das fontes pontuais...");
    pFileR = inicia_leitura(arquivoFontes);
    for (i = 0; i < nf; i++) {
        fscanf(pFileR, "%lf", &p[i]);
    }

    //calculo de parametros (iguais para todas as fontes)
    printf("\nCalculando parametros...");
    deltaT = T/(double)n;
    deltaX = 1/(double)n;
    lambda = calculaLambda(n, n);

    //alocação de memória
    printf("\nAlocando memoria...");
    double *fk = (double*)calloc(n, sizeof(double));
    double *fk1 = (double*)calloc(n, sizeof(double));
    double *uki = (double*)calloc(n, sizeof(double));
    double *Adiag = (double*)calloc(n, sizeof(double));
    double *Asub = (double*)calloc(n, sizeof(double));
    double *RHS = (double*)calloc(n, sizeof(double));
    double *LHS = (double*)calloc(nf*nf, sizeof(double));
    double *b = (double*)calloc(nf, sizeof(double));
    double *a = (double*)calloc(nf, sizeof(double));
    double *L = (double*)calloc(n*n, sizeof(double));
    double *D = (double*)calloc(n, sizeof(double));
    double *L2 = (double*)calloc(n*n, sizeof(double));
    double *D2 = (double*)calloc(n, sizeof(double));
    double *ukt = (double*)calloc(nf*n, sizeof(double));
    double *uT = (double*)calloc(n, sizeof(double));

    //monta A e decompoe LDL (iguais para todas as fontes)
    printf("\nMontando matriz A e decompondo...");
    montaA(Adiag, Asub, n, lambda);
    LDL(Adiag, Asub, L, D, n);

    //inicia exportação, atribui condição inicial e exporta cond in para cada fonte
    printf("\nIniciando exportacao...");
    printf("\nCalculando f, montando vetor RHS e resolvendo o sistema para cada fonte pontual...");
    pFileW2 = inicia_exportacao(titulo[10]);
    for (j = 0; j < nf; j++) {
        aux = p[j];
        pFileW = inicia_exportacao(titulo[j]);
        uki = condIn(n);
        exporta_vetores(pFileW, uki, n);
    
        //calcula F, monta RHS, resolve e exporta uki de cada fonte.
        for (i = 1; i<=n-1; i++) {
            calculaF(fk, fk1, n, aux, deltaT, deltaX, i);
            montaRHS(RHS, fk, uki, deltaT, n, fk1, lambda);
            uki = resolveSist(L, D, RHS, n);
            exporta_vetores(pFileW, uki, n); //estou exportando todas as linhas para eventuais perguntas no relatorio, mas só temos interesse em u(T,xi)
        }
        printf("\nArmazenando os resultados de ukT...");
        exporta_vetores(pFileW2, uki, n);
        vetorPmatriz(uki, ukt, j, n);
    }

    //Definição do vetor uT segundo item C:
    printf("\nDefinindo uT segundo arquivo %s...", arquivoUt);
    pFileR = inicia_leitura(arquivoUt);
    for (i = 0; i < n; i++) {
        fscanf(pFileR, "%lf", &uT[i]);
    }

    //Montagem e solução do sistema normal:
    printf("\nMontando e resolvendo sistema normal...");
    montaSistNormal(uT, ukt, n, nf, LHS, b);
    cholesky(LHS, L2, D2, nf); //para aq
    a = resolveSistNormal(L2, D2, b, nf);
    printf("\nCalculando o erro quadratico para N = %d", n);
    printf("\n\n---------------------------------------------------------------------------------------");
    printf("\nAs intensidades das fontes sao:");
    for (i = 0; i < nf; i++) {
        printf("\na%d: %3.12lf", i, a[i]);
    }
    

    //Calculo do erro quadratico
    E2 = erroQuadratico(uT, ukt, deltaX, n, nf, a);
    printf("\n\nErro quadratico calculado com N = %d: ", n);
    printf("%3.12lf", E2);
    printf("\n---------------------------------------------------------------------------------------\n\n");

    fclose(pFileR);
    fclose(pFileW);
    fclose(pFileW2);

    //Gera e exporta os dados reconstruidos
    pFileW = inicia_exportacao(arquivoDadosFinais);
    reconstroiDados(a, ukt, n, nf, pFileW);

    free(fk);
    free(fk1);
    free(uki);
    free(Adiag);
    free(Asub);
    free(RHS);
    free(LHS);
    free(b);
    free(a);
    free(L);
    free(D);
    free(L2);
    free(D2);
    free(ukt);
    free(uT);
    fclose(pFileW);
}
//----------------------------------------------------------------------------------------------------------------------------------------------

int main() {
    //interface:
    int opcao = 0;
    int opcao2 = 1;
    char *titulo[11];
    
    printf("EP2\nGustavo Donnini Chen, 10772925, Turma 1");
    printf("\nTodos os dados das distribuicoes de calor de cada fonte individual assim como os dados utilizados para resolver\nos itens C e D podem ser acessados na pasta 'resultados' no diretorio onde este programa se encontra.");
    
    while (opcao != 5) {

        printf("\n\nCasos:\n1. Item A: N = 128, nf = 1, p1 = 0.35");
        printf("\n2. Item B: N = 128, nf = 4, p1 = 0.15, p2 = 0.3, p3 = 0.7, p4 = 0.8");
        printf("\n3. Item C: N = 128 - 2048, nf = 10, uT e pi indicados no arquivo teste.txt fornecido pela disciplina");
        printf("\n4. Item D: Testes iguais aos do item C, com introducao de ruidos nos dados");
        printf("\n5. Encerrar o programa");
        printf("\n\nescolha o item: ");
        scanf("%d", &opcao);
        
        if (opcao == 1) {
            itemA();
        }
        
        if (opcao == 2) {
            itemB();
        }

        if (opcao == 3) {
            printf("\nEscolha o valor de N:");
            printf("\n1. N = 128");
            printf("\n2. N = 256");
            printf("\n3. N = 512");
            printf("\n4. N = 1024");
            printf("\n5. N = 2048");
            printf("\n6. Voltar");
            printf("\nDigite sua escolha: ");
            scanf("%d", &opcao2);
            if (opcao2 == 1) {
                titulo[0] = "resultados/itemC/fonte1_N128.csv";
                titulo[1] = "resultados/itemC/fonte2_N128.csv";
                titulo[2] = "resultados/itemC/fonte3_N128.csv";
                titulo[3] = "resultados/itemC/fonte4_N128.csv";
                titulo[4] = "resultados/itemC/fonte5_N128.csv";
                titulo[5] = "resultados/itemC/fonte6_N128.csv";
                titulo[6] = "resultados/itemC/fonte7_N128.csv";
                titulo[7] = "resultados/itemC/fonte8_N128.csv";
                titulo[8] = "resultados/itemC/fonte9_N128.csv";
                titulo[9] = "resultados/itemC/fonte10_N128.csv";
                titulo[10] = "resultados/itemC/ukTs/ukT_N128.csv";
                itemC(128, "resultados/dados_fracionados/dados128.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemC/dados_reconstruidos/final_N128.txt"); 
            }
            
            if (opcao2 == 2) {
                titulo[0] = "resultados/itemC/fonte1_N256.csv";
                titulo[1] = "resultados/itemC/fonte2_N256.csv";
                titulo[2] = "resultados/itemC/fonte3_N256.csv";
                titulo[3] = "resultados/itemC/fonte4_N256.csv";
                titulo[4] = "resultados/itemC/fonte5_N256.csv";
                titulo[5] = "resultados/itemC/fonte6_N256.csv";
                titulo[6] = "resultados/itemC/fonte7_N256.csv";
                titulo[7] = "resultados/itemC/fonte8_N256.csv";
                titulo[8] = "resultados/itemC/fonte9_N256.csv";
                titulo[9] = "resultados/itemC/fonte10_N256.csv";
                titulo[10] = "resultados/itemC/ukTs/ukT_N256.csv";
                itemC(256, "resultados/dados_fracionados/dados256.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemC/dados_reconstruidos/final_N256.txt");
            }

            if (opcao2 == 3) {
                titulo[0] = "resultados/itemC/fonte1_N512.csv";
                titulo[1] = "resultados/itemC/fonte2_N512.csv";
                titulo[2] = "resultados/itemC/fonte3_N512.csv";
                titulo[3] = "resultados/itemC/fonte4_N512.csv";
                titulo[4] = "resultados/itemC/fonte5_N512.csv";
                titulo[5] = "resultados/itemC/fonte6_N512.csv";
                titulo[6] = "resultados/itemC/fonte7_N512.csv";
                titulo[7] = "resultados/itemC/fonte8_N512.csv";
                titulo[8] = "resultados/itemC/fonte9_N512.csv";
                titulo[9] = "resultados/itemC/fonte10_N512.csv";
                titulo[10] = "resultados/itemC/ukTs/ukT_N512.csv";
                itemC(512, "resultados/dados_fracionados/dados512.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemC/dados_reconstruidos/final_N512.txt");
            }

            if (opcao2 == 4) {
                titulo[0] = "resultados/itemC/fonte1_N1024.csv";
                titulo[1] = "resultados/itemC/fonte2_N1024.csv";
                titulo[2] = "resultados/itemC/fonte3_N1024.csv";
                titulo[3] = "resultados/itemC/fonte4_N1024.csv";
                titulo[4] = "resultados/itemC/fonte5_N1024.csv";
                titulo[5] = "resultados/itemC/fonte6_N1024.csv";
                titulo[6] = "resultados/itemC/fonte7_N1024.csv";
                titulo[7] = "resultados/itemC/fonte8_N1024.csv";
                titulo[8] = "resultados/itemC/fonte9_N1024.csv";
                titulo[9] = "resultados/itemC/fonte10_N1024.csv";
                titulo[10] = "resultados/itemC/ukTs/ukT_N1024.csv";
                itemC(1024, "resultados/dados_fracionados/dados1024.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemC/dados_reconstruidos/final_N1024.txt");
            }

            if (opcao2 == 5) {
                titulo[0] = "resultados/itemC/fonte1_N2048.csv";
                titulo[1] = "resultados/itemC/fonte2_N2048.csv";
                titulo[2] = "resultados/itemC/fonte3_N2048.csv";
                titulo[3] = "resultados/itemC/fonte4_N2048.csv";
                titulo[4] = "resultados/itemC/fonte5_N2048.csv";
                titulo[5] = "resultados/itemC/fonte6_N2048.csv";
                titulo[6] = "resultados/itemC/fonte7_N2048.csv";
                titulo[7] = "resultados/itemC/fonte8_N2048.csv";
                titulo[8] = "resultados/itemC/fonte9_N2048.csv";
                titulo[9] = "resultados/itemC/fonte10_N2048.csv";
                titulo[10] = "resultados/itemC/ukTs/ukT_N2048.csv";
                itemC(2048, "resultados/dados_fracionados/dados2048.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemC/dados_reconstruidos/final_N2048.txt");
            }
            
            
            
            
        }

        if (opcao == 4) {
            printf("\nEscolha o valor de N:");
            printf("\n1. N = 128");
            printf("\n2. N = 256");
            printf("\n3. N = 512");
            printf("\n4. N = 1024");
            printf("\n5. N = 2048");
            printf("\n6. Voltar");
            printf("\nDigite sua escolha: ");
            scanf("%d", &opcao2);

            if(opcao2 == 1) {
                titulo[0] = "resultados/itemD/fonte1_N128.csv";
                titulo[1] = "resultados/itemD/fonte2_N128.csv";
                titulo[2] = "resultados/itemD/fonte3_N128.csv";
                titulo[3] = "resultados/itemD/fonte4_N128.csv";
                titulo[4] = "resultados/itemD/fonte5_N128.csv";
                titulo[5] = "resultados/itemD/fonte6_N128.csv";
                titulo[6] = "resultados/itemD/fonte7_N128.csv";
                titulo[7] = "resultados/itemD/fonte8_N128.csv";
                titulo[8] = "resultados/itemD/fonte9_N128.csv";
                titulo[9] = "resultados/itemD/fonte10_N128.csv";
                titulo[10] = "resultados/itemD/ukTs/ukT_N128.csv";
                itemC(128, "resultados/dados_fracionados/dados_c_ruido128.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemD/dados_reconstruidos/final_N128.txt");
            }
            if(opcao2 == 2) {
                titulo[0] = "resultados/itemD/fonte1_N256.csv";
                titulo[1] = "resultados/itemD/fonte2_N256.csv";
                titulo[2] = "resultados/itemD/fonte3_N256.csv";
                titulo[3] = "resultados/itemD/fonte4_N256.csv";
                titulo[4] = "resultados/itemD/fonte5_N256.csv";
                titulo[5] = "resultados/itemD/fonte6_N256.csv";
                titulo[6] = "resultados/itemD/fonte7_N256.csv";
                titulo[7] = "resultados/itemD/fonte8_N256.csv";
                titulo[8] = "resultados/itemD/fonte9_N256.csv";
                titulo[9] = "resultados/itemD/fonte10_N256.csv";
                titulo[10] = "resultados/itemD/ukTs/ukT_N256.csv";
                itemC(256, "resultados/dados_fracionados/dados_c_ruido256.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemD/dados_reconstruidos/final_N256.txt");
            }
            if(opcao2 == 3) {
                titulo[0] = "resultados/itemD/fonte1_N512.csv";
                titulo[1] = "resultados/itemD/fonte2_N512.csv";
                titulo[2] = "resultados/itemD/fonte3_N512.csv";
                titulo[3] = "resultados/itemD/fonte4_N512.csv";
                titulo[4] = "resultados/itemD/fonte5_N512.csv";
                titulo[5] = "resultados/itemD/fonte6_N512.csv";
                titulo[6] = "resultados/itemD/fonte7_N512.csv";
                titulo[7] = "resultados/itemD/fonte8_N512.csv";
                titulo[8] = "resultados/itemD/fonte9_N512.csv";
                titulo[9] = "resultados/itemD/fonte10_N512.csv";
                titulo[10] = "resultados/itemD/ukTs/ukT_N512.csv";
                itemC(512, "resultados/dados_fracionados/dados_c_ruido512.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemD/dados_reconstruidos/final_N512.txt");
            }
            if(opcao2 == 4) {
                titulo[0] = "resultados/itemD/fonte1_N1024.csv";
                titulo[1] = "resultados/itemD/fonte2_N1024.csv";
                titulo[2] = "resultados/itemD/fonte3_N1024.csv";
                titulo[3] = "resultados/itemD/fonte4_N1024.csv";
                titulo[4] = "resultados/itemD/fonte5_N1024.csv";
                titulo[5] = "resultados/itemD/fonte6_N1024.csv";
                titulo[6] = "resultados/itemD/fonte7_N1024.csv";
                titulo[7] = "resultados/itemD/fonte8_N1024.csv";
                titulo[8] = "resultados/itemD/fonte9_N1024.csv";
                titulo[9] = "resultados/itemD/fonte10_N1024.csv";
                titulo[10] = "resultados/itemD/ukTs/ukT_N1024.csv";
                itemC(1024, "resultados/dados_fracionados/dados_c_ruido1024.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemD/dados_reconstruidos/final_N1024.txt");
            }
            if(opcao2 == 5) {
                titulo[0] = "resultados/itemD/fonte1_N2048.csv";
                titulo[1] = "resultados/itemD/fonte2_N2048.csv";
                titulo[2] = "resultados/itemD/fonte3_N2048.csv";
                titulo[3] = "resultados/itemD/fonte4_N2048.csv";
                titulo[4] = "resultados/itemD/fonte5_N2048.csv";
                titulo[5] = "resultados/itemD/fonte6_N2048.csv";
                titulo[6] = "resultados/itemD/fonte7_N2048.csv";
                titulo[7] = "resultados/itemD/fonte8_N2048.csv";
                titulo[8] = "resultados/itemD/fonte9_N2048.csv";
                titulo[9] = "resultados/itemD/fonte10_N2048.csv";
                titulo[10] = "resultados/itemD/ukTs/ukT_N2048.csv";
                itemC(2048, "resultados/dados_fracionados/dados_c_ruido2048.txt", "resultados/dados_fracionados/fontes.txt", titulo, "resultados/itemD/dados_reconstruidos/final_N2048.txt");
            }             
        }
    }
    return 0;
}