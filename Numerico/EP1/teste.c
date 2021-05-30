#include <stdio.h>
#include <math.h>

#define GRAU_MAX 3

//Função de ADIÇÃO DE POLINÔMIO
void addPol(float *f1, float *f2, float *f3) {
    int i;

    for (i = 0; i < GRAU_MAX; i++) {
        f3[i] = 0;
    }
    
    for (i = 0; i < GRAU_MAX; i++) {
        f3[i] = f1[i] + f2[i];
    }
}

//FUNÇÃO DE SUBTRAÇÃO DE POLINÔMIO
void subPol(float *f1, float *f2, float *f3) {
    int i;

    for (i = 0; i < GRAU_MAX; i++) {
        f3[i] = 0;
    }
    
    for (i = 0; i < GRAU_MAX; i++) {
        f3[i] = f1[i] - f2[i];
    }
}

//FUNÇÃO DE MULTIPLICAÇÃO DE POLINÔMIO
void multPol(float *f1, float *f2, float *f3) {
    int i, j, k;

    for (i = 0; i < GRAU_MAX; i++) {
        float soma = 0;
        k = i;
        j = 0;
        while (k >= 0) {
            soma += (f1[j]*f2[k]);
            j++;
            k--;
        }
        f3[i] = soma;
    }
}

//FUNÇÃO TESTE DE MATRIZES
void multMat(float m1[GRAU_MAX][GRAU_MAX], float (*m2)[GRAU_MAX], float (*m3)[GRAU_MAX]) {
    int i, j;

    for (int i = 0; i < GRAU_MAX; i++) {
        for (int j = 0; j < GRAU_MAX; j++) {
            m3[i][j] = m1[i][j] * m2[i][j];
        }
    }
}

//FUNÇÃO PARA INVERTER NUMERO
float inverte(int x) {
    return 1/(float)x;
}

//FUNÇÃO TESTE DE CRIAÇÃO DE MATRIZ
void matriz(int l, int c, int mat[][c]) {
    int i, j;
    for (i = 0; i < l; i++) {
        for (j = 0; j < c; j++) {
            mat[i][j] = 12;
        }
    }

    for (i = 0; i < l; i++) {
        printf("\n");
        for (j = 0; j < c; j++) {
            printf("%d  ", mat[i][j]);
        }
    }
}

void calculo_uik(int n, int m, float deltaT, float deltaX, float u0i, float uk0, float ukn, float cki[][n+1], float fki[][n+1]) {
    
    int e,r; //para for's
    int k, i;
    float x, t;

    //passo 1. atribuir as condições inicial e de borda
    for (i = 0; i < n+1; i++) {
        cki[0][i] = u0i;
    }

    for (k = 0; k < m+1; k++) {
        cki[k][0] = uk0;
        cki[k][n] = ukn;
    }

    //passo 2. calcular a matriz fki

    //2.1. zerar a primeira linha (por causa da condição inicial)
    for (e = 0; e < n+1; e++) {
        fki[0][e] = 0;
    }

    //2.2. usar a formula pra calcular o resto da matriz
    for (k = 1; k < m+1; k++) {
        for (i = 1; i < n; i++) {
            x = i * deltaX; //xi para cada i
            t = k * deltaT; //tk para cada k
            fki[k][i] = 10 * pow(x, 2) * (x - 1) - 60 * t * x + 20 * t;
        }
    }

    //passo 3. calcular a matriz resultante

    for (k = 0; k < m; k++) {
        for (i = 1; i < n; i++) {
            cki[k + 1][i] = cki[k][i] + deltaT * ((cki[k][i - 1] - 2 * cki[k][i] + cki[k][i + 1]) / pow(deltaX, 2)) + fki[k+1][i];
        }
    }
    for (e = 0; e < m+1; e++) {
        printf("\n");
        for (r = 0; r < n+1; r++) {
            printf("%09.2f   ", cki[e][r]);
        }
    }

}

//FUNÇÃO PARA O CÁLCULO DA MATRIZ DE ERRO DE TRUNCAMENTO
void calculo_erro_truncamento(int n, int m, float deltaT, float deltaX, float cki[][n+1], float fki[][n+1]) {

}




int main() {

//declaração das constantes. Para cada caso que quisermos analisar, temos que mudar essas ctes.
    int T = 1;
    float u0i = 0;
    float uk0 = 0;
    float ukn = 0;
    float lambda = 2;
//----------------------------------------------------------------------------------------------

//declaração de variáveis que vamos utilizar ao longo do programa
    int n, m;
    float deltaX, deltaT;


//-----------------------------------------------------------------------------------------------

    printf("digite o valor de M: ");
    scanf("%d", &m);
    printf("Agora, digite o valor de N: ");
    scanf("%d", &n);

//TENDO M E N, JÁ SABEMOS O TAMANHO DA MATRIZ RESULTADO, QUE SERÁ [n+1][m+1] SEGUNDO NOSSAS CONSIDERAÇÕES
    float cki[m+1][n+1]; //chamamos de c(k,i) toda a parcela que é somad[a a f(tk, xi).
    float fki[m+1][n+1]; //fki = matriz dos resultados de f(tk, xi). 
//-------------------------------------------------------------------------------------------------------

//calculo de deltaX e deltaT
    deltaX = inverte(n);
    deltaT = inverte(m);

//teste para ver o deltaX e deltaT
    printf("delta x = %f, delta t = %f\n\n", deltaX, deltaT);

    calculo_uik(n, m, deltaT, deltaX, u0i, uk0, ukn, cki, fki);
    
    return 0;
}

