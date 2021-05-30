//**************************************//
//   EP1 de Cálculo numérico            //
//   Gustavo Donnini Chen, 10772925     //
//   Lucas Roque Nunes, slaessamerda    //
//                                      //
//**************************************//

//COMENTARIO KKKKKKJ

#include <stdio.h>
#include <math.h>
#include <stdlib.h>



//FUNÇÃO PARA INVERTER NUMERO
double inverte(int x) {
    return 1/(double)x;
}

//FUNÇÃO PARA CALCULAR O Uik
void calculo_uik(int n, int m, double deltaT, double deltaX, double u0i[n+1], double uki_borda[m+1], double uki[][n+1], double fki[][n+1]) {
    
    int k, i;
    double x, t;

    //passo 1. atribuir as condições inicial e de borda
    for (i = 0; i < n+1; i++) {
        uki[0][i] = u0i[i];
    }

    for (k = 0; k < m+1; k++) {
        uki[k][0] = uki_borda[k];
        uki[k][n] = uki_borda[k];
    }

    //passo 2. calcular a matriz fki

    //2.1. zerar a primeira linha (por causa da condição inicial)
    for (i = 0; i < n+1; i++) {
        fki[0][i] = 0;
    }

    //2.2. usar a formula pra calcular o resto da matriz (MUDAR A F AQUI!!!)
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
            uki[k + 1][i] = uki[k][i] + deltaT * (((uki[k][i - 1] - 2 * uki[k][i] + uki[k][i + 1]) / deltaX*deltaX) + fki[k+1][i]);
        }
    }
    
}

//FUNÇÃO PARA O CÁLCULO DA MATRIZ DE ERRO LOCAL DE TRUNCAMENTO
void calculo_erro_truncamento(int n, int m, double deltaT, double deltaX, double uki[][n+1], double fki[][n+1], double etki[][n+1]) {

    int i, k;

    for (k = 0; k < m + 1; k++) {
        for (i = 0; i < n + 1; i++) {
            etki[k][i] = 0;
        }
    }

    for (k = 1; k < m + 1; k++) {
        for (i = 1; i < n; i++) {
            //usamos a expansão de taylor na sua versão regressiva
            etki[k][i] = ((uki[k][i] - uki[k-1][i]) / deltaT) - ((uki[k][i-1] - 2 * uki[k][i] + uki[k][i+1]) / deltaX*deltaX) - fki[k][i];
        }
    }

    
}

//FUNÇÃO PARA O CÁLCULO DA MATRIZ DE ERRO
void calculo_erro(int n, int m, double deltaT, double deltaX, double u0i[n+1], double uki_borda[m+1], double etki[][n+1], double eki[][n+1]){

    int i, k;
    //passo 1. atribuir as condições inicial e de borda
    for (i = 0; i < n+1; i++) {
        eki[0][i] = u0i[i];
    }

    for (k = 0; k < m+1; k++) {
        eki[k][0] = uki_borda[k];
        eki[k][n] = uki_borda[k];
    }

    for (k = 0; k < m; k++) {
        for (i = 1; i < n; i++) {
            eki[k + 1][i] = eki[k][i] + deltaT * (((eki[k][i - 1] - 2 * eki[k][i] + eki[k][i + 1]) / deltaX*deltaX) + etki[k][i]);
        }
    }

    int e, r;
    for (e = 0; e < m+1; e++) {
        printf("\n");
        for (r = 0; r < n+1; r++) {
            printf("%09.6f   ", etki[e][r]);
        }
    }
    
}



int main() {

//declaração das constantes. Para cada caso que quisermos analisar, temos que mudar essas ctes.
    int T = 1;
    double lambda;

//obtenção de m e n
    int n, m;
    double deltaX, deltaT;


    printf("digite o valor de M: ");
    scanf("%d", &m);
    printf("Agora, digite o valor de N: ");
    scanf("%d", &n);

//TENDO M E N, JÁ SABEMOS O TAMANHO DA MATRIZ RESULTADO, QUE SERÁ [n+1][m+1] SEGUNDO NOSSAS CONSIDERAÇÕES
    double uki[m+1][n+1]; //uki = amtriz dos resultados de u(tk, xi)
    double fki[m+1][n+1]; //fki = matriz dos resultados de f(tk, xi)
    double etki[m+1][n+1];//etki = matriz de erros de truncamento
    double eki[m+1][n+1]; //eki = matriz de erros 
    double u0i[n+1];      //u01 = vetor de condição inicial
    double uki_borda[m+1];//uki_borda = vetor de condição de borda
//calculo de deltaX e deltaT
    deltaX = inverte(n);
    deltaT = inverte(m);
    lambda = deltaT/(deltaX*deltaX);
    printf("\n\nlambda = %f\n\n", lambda);

//CONFIGURAR AS CONDIÇÕES INICIAIS AQUI!!!
    int i;
    for (i = 0; i < n + 1; i++) {
        u0i[i] = 0;
    }

//CONFIGURAR AS CONDIÇÕES DE BORDA AQUI!!!
    for (i = 0; i < m + 1; i++) {
        uki_borda[i] = 0;
    }

//teste para ver o deltaX e deltaT
    printf("delta x = %f, delta t = %f\n\n", deltaX, deltaT);

    calculo_uik(n, m, deltaT, deltaX, u0i, uki_borda, uki, fki);
    
    calculo_erro_truncamento(n, m, deltaT, deltaX, uki, fki, etki);

    calculo_erro(n, m, deltaT, deltaX, u0i, uki_borda, etki, eki);

    return 0;
}