/***********************************************/
/*   MAP3121 - Metodos Numericos e Aplicacoes  */
/*   EP1 - Um problema Inverso para Obtencao   */
/*         de distribuicao de Temperatura      */
/*   Gustavo Donnini Chen, 10772925 - Turma 1  */
/*   Lucas Roque Nunes,    10773735 - Turma 1  */
/*                                             */
/***********************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <stdbool.h>
#include <string.h>

struct discretzacao
{
        int N;
        int M;
        float lambda;
        float instanteFinal;
        double deltaX;
        double deltaT;
};


/*Determinacao de deltaX, deltaT, N, M e lambda de acordo com inputs do usuario*/
struct discretzacao escolha_discretizacao()
{
        struct discretzacao parametros;
	int m = 0, n = 0;
	double lambda = 0, time = 0;
	int userChoice = 1;

	printf("Escolha um instante final de tempo T: ");
	scanf("%lf", &time);
	printf("Escolha um N: ");
	scanf("%d", &n);
	printf("Digite 1 para M ou 2 para Lambda: ");
	scanf("%d", &userChoice);
	if (userChoice == 1)
	{
		printf("Escolha um M: ");
		scanf("%d", &m);
		lambda = time * n * n / m;
	}
	if (userChoice == 2)
	{
		printf("Escolha um Lambda: ");
		scanf("%lf", &lambda);
		m = time * n * n / lambda;

	}

	parametros.deltaT = time * 1.0 / m;
	parametros.deltaX = 1.0 / n;
	parametros.N = n;
	parametros.M = m;
        parametros.instanteFinal = time;
        parametros.lambda = lambda;

        return parametros;
}

void condicoes(double *u0i, double *uk0, double *ukn, struct discretzacao parametros, int caso)
{
       if(caso == 1)
       {
	        /*Condicoes de Contorno*/
                for (int it = 0; it < parametros.N; it++)
                {
		        *(u0i + it) = 0.0;
	        }

	        for (int it = 0; it < parametros.M + 1; it++)
	        {
		        *(uk0 + it) = 0.0;
		        *(ukn + it) = 0.0;
	        }
       }
       if(caso == 2)
       {
	        /*Condicoes de Contorno*/
                for (int it = 0; it < parametros.N; it++)
                {
		        *(u0i + it) = it * it * parametros.deltaX * parametros.deltaX * (1 - it * parametros.deltaX) *  (1 - it * parametros.deltaX);
	        }

	        for (int it = 0; it < parametros.M + 1; it++)
	        {
		        *(uk0 + it) = 0.0;
		        *(ukn + it) = 0.0;
	        }
       }
       if(caso == 3)
       {
	        /*Condicoes de Contorno*/
                for (int it = 0; it < parametros.N; it++)
                {
		        *(u0i + it) =  pow(2.71828183, - it * parametros.deltaX);
	        }

	        for (int it = 0; it < parametros.M + 1; it++)
	        {
		        *(uk0 + it) = pow(2.71828183, it * parametros.deltaT);
		        *(ukn + it) = pow(2.71828183, it * parametros.deltaT - 1) * cos(5 * it * parametros.deltaT);
	        }
       }
}

void calcula_fki(double *f, int N, int k, double deltaX, double deltaT, int escolha)
{
        double *comeco;
	double x = 0, t;
	t = k * deltaT;
        comeco = f;

	if (escolha == 1)
        {
                for (int col = 0; col < N - 1; col++)
                {
                        x = col * deltaX;
                        *(comeco + col) = 10 * x * x * (x - 1) - (60 * x * t) + (20 * t);
                }
        }
	if (escolha == 2)
        {
                for (int col = 0; col < N - 1; col++)
                {
                        x = col * deltaX;
                        *(comeco + col) = 10 * cos(10.0 * t) * x * x * (1 - x) * (1 - x) - (1 + sin(10.0 * t)) * (12 * x * x - 12 * x + 2);
                }
        }
	if (escolha == 3)
        {
                for (int col = 0; col < N - 1; col++)
                {
                        x = col * deltaX;
                        *(comeco + col) = pow(2.71828183, t - x) * (cos(5 * t * x) - 5 * x * sin(5 * t * x) - (1 - 25 * t * t) * cos(5 * t * x) - 10 * t * sin(5 * t * x));
                }
        }
	if (escolha == 4)
        {
                for (int col = 0; col < N - 1; col++)
                {
                        x = col * deltaX;
                        if (x >= 0.25 - deltaX / 2 && x <= 0.25 + deltaX / 2)
                        {
                                *(comeco + col) = 10000 * (1 - 2 * pow(t, 2)) / deltaX;
                        }
                        else
                        {
                                *(comeco + col) = 0.0;
                        }


                }
        }
        comeco = NULL;
}

void arquiva_matriz(double *comeco, int colunas, int linhas, char *nome)
{
	double *walker = comeco;
	FILE *uOutput;
	uOutput = fopen(nome, "w");
	fprintf(uOutput, "#arquivo criado\n");
	fprintf(uOutput, "#Linhas = %d, Colunas = %d\n", linhas, colunas);

	for (int row = 0; row < linhas; row++)
	{
		for (int col = 0; col < colunas; col++)
		{
			fprintf(uOutput, "\t%.3lf,", *(walker + col));
		}
		fprintf(uOutput, "\n");
		walker += colunas;
	}

	fclose(uOutput);
}

void calcula_erro(double *uk, struct discretzacao parametros, int fonte, char *nome_erro)
{
        double *e = (double *)calloc(parametros.N * parametros.M + 200, sizeof(double));
        double *f = (double *)calloc(parametros.N , sizeof(double));

        double t, x;

        if (fonte == 1)
        {
                for (int row = 0; row < parametros.M; row++)
                {
                        t = row * parametros.deltaT;
                        for (int col = 1; col < parametros.N - 1; col++)
                        {
                                x = col * parametros.deltaX;
                                *(e + row + col) = 10 * t * pow(x, 2) * (x - 1) - *(uk + row + col);
                        }
                }
        }

        else if (fonte == 2)
        {
                for (int row = 0; row < parametros.M; row++)
                {
                        t = row * parametros.deltaT;
                        for (int col = 1; col < parametros.N - 1; col++)
                        {
                                x = col * parametros.deltaX;
                                *(e + row + col) = (1 + sin(10 * t)) * pow(x * (x - 1), 2) - *(uk + row + col);
                        }
                }
        }

        else if (fonte == 3)
        {
                for (int row = 0; row < parametros.M; row++)
                {
                        t = row * parametros.deltaT;
                        for (int col = 1; col < parametros.N - 1; col++)
                        {
                                x = col * parametros.deltaX;
                                *(e + row + col) = pow(2.71828183, t - x) * cos(5 * t * x) - *(uk + row + col);
                        }
                }
        }

        else return;

        arquiva_matriz(e, parametros.N, parametros.M, nome_erro);
        free(e);
        free(f);
        e = NULL;
        f = NULL;
}

/*Calculo de uik (Metodo 11)*/
void calcula_uki(struct discretzacao parametros, int fonte, double *u0i, double *uk0, double *ukN, char *nome, char *nome_erro)
{
        int N = parametros.N;
        int M = parametros.M;
        double deltaT = parametros.deltaT;
        double deltaX = parametros.deltaX;

	double *aux;

	double *ukProximo = (double *)calloc((M * N + 200), sizeof(double));
	double *uk = (double *)calloc(N + 4, sizeof(double));
        double *f = (double *)calloc(N + 4, sizeof(double));
	aux = ukProximo;


	/*escreve u0i em uk e ukProximo*/
	for (int it = 0; it < N; it++)
	{
		*(uk + it) = *(u0i + it);
		*(ukProximo + it) = *(u0i + it);
	}

	ukProximo += N;

	/*calcula as outras linhas de ukProximo*/
	for (int row = 0; row < M; row++)
	{
		*ukProximo = *(uk0 + row + 1);
		*(ukProximo + N) = *(ukN + row + 1);
		if (row != 0)
		{
			*uk = *(uk0 + row);
			*(uk + N) = *(ukN + row);
		}

                calcula_fki(f, N, row, deltaX, deltaT, fonte);
		for (int col = 1; col < N - 1; col++)
		{
			*(ukProximo + col) = *(uk + col) + deltaT * (*(uk + col - 1) - 2 * *(uk + col) + *(uk + col + 1)) / (deltaX * deltaX) + deltaT * *(f + col);
			*(uk + col) = *(ukProximo + col);
		}

		uk = ukProximo;
		ukProximo += N;
	}

	if (fonte != 4) calcula_erro(aux, parametros, fonte, nome_erro);

	arquiva_matriz(aux, N, M, nome);
	if (fonte != 4) printf("\nTerminou %s e %s", nome, nome_erro);
        else printf("\nTerminou %s", nome);

        f = NULL;
        uk = NULL;

        ukProximo = aux;
        free(ukProximo);
        ukProximo = NULL;
}


void tarefa_1(int escolha)
{
        struct discretzacao parametros;

        double *u0i = (double *)calloc(320, sizeof(double));
        double *uk0 = (double *)calloc(409600, sizeof(double));
        double *ukn = (double *)calloc(409600, sizeof(double));

        if (escolha == 1)
        {
                /*Item a com fonte de teste, lambda = 0.5, N = 10*/
                parametros.instanteFinal = 1;
                parametros.lambda = 0.5;
                parametros.N = 10;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n10-l50-f2.csv", "erro1a-n10-l50-f2.csv");

                /*Item a com fonte de teste, lambda = 0.5, N = 20*/
                parametros.N = 20;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n20-l50-f2.csv", "erro1a-n20-l50-f2.csv");

                /*Item a com fonte de teste, lambda = 0.5, N = 40*/
                parametros.N = 40;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n40-l50-f2.csv", "erro1a-n40-l50-f2.csv");

                /*Item a com fonte de teste, lambda = 0.5, N = 80*/
                parametros.N = 80;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n80-l50-f2.csv", "erro1a-n80-l50-f2.csv");

                /*Item a com fonte de teste, lambda = 0.5, N = 160*/
                parametros.N = 160;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n160-l50-f2.csv", "erro1a-n160-l50-f2.csv");

                /*Item a com fonte de teste, lambda = 0.5, N = 320*/
                parametros.N = 320;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n320-l50-f2.csv", "erro1a-n320-l50-f2.csv");

                /*Item a com fonte de teste, lambda = 0.25, N = 10*/
                parametros.instanteFinal = 1;
                parametros.lambda = 0.25;
                parametros.N = 10;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n10-l25-f2.csv", "erro1a-n10-l25-f2.csv");

                /*Item a com fonte de teste, lambda = 0.25, N = 20*/
                parametros.N = 20;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n20-l25-f2.csv", "erro1a-n20-l25-f2.csv");

                /*Item a com fonte de teste, lambda = 0.25, N = 40*/
                parametros.N = 40;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n40-l25-f2.csv", "erro1a-n40-l25-f2.csv");

                /*Item a com fonte de teste, lambda = 0.25, N = 80*/
                parametros.N = 80;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n80-l25-f2.csv", "erro1a-n80-l25-f2.csv");

                /*Item a com fonte de teste, lambda = 0.25, N = 160*/
                parametros.N = 160;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n160-l25-f2.csv", "erro1a-n160-l25-f2.csv");

                /*Item a com fonte de teste, lambda = 0.25, N = 320*/
                parametros.N = 320;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 2);
                calcula_uki(parametros, 2, u0i, uk0, ukn, "u1a-n320-l25-f2.csv", "erro1a-n320-l25-f2.csv");
                uk0 = NULL;
                ukn = NULL;
                u0i = NULL;
                free(uk0);
                free(ukn);
                free(u0i);
                return;
        }

        if (escolha == 2)
        {
                /*Item b com lambda = 0.5, N = 10*/
                parametros.instanteFinal = 1;
                parametros.lambda = 0.5;
                parametros.N = 10;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n10-l50-f3.csv", "erro1b-n10-l50-f3.csv");

                /*Item b com lambda = 0.5, N = 20*/
                parametros.N = 20;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n20-l50-f3.csv", "erro1b-n20-l50-f3.csv");

                /*Item b com lambda = 0.5, N = 40*/
                parametros.N = 40;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n40-l50-f3.csv", "erro1b-n40-l50-f3.csv");

                /*Item b com lambda = 0.5, N = 80*/
                parametros.N = 80;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n80-l50-f3.csv", "erro1b-n80-l50-f3.csv");

                /*Item b com lambda = 0.5, N = 160*/
                parametros.N = 160;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n160-l50-f3.csv", "erro1b-n160-l50-f3.csv");

                /*Item b com lambda = 0.5, N = 320*/
                parametros.N = 320;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n320-l50-f3.csv", "erro1b-n320-l50-f3.csv");

                /*Item b com lambda = 0.25, N = 10*/
                parametros.instanteFinal = 1;
                parametros.lambda = 0.25;
                parametros.N = 10;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n10-l25-f3.csv", "erro1b-n10-l25-f3.csv");

                /*Item b com lambda = 0.25, N = 20*/
                parametros.N = 20;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n20-l25-f3.csv", "erro1b-n20-l25-f3.csv");

                /*Item b com lambda = 0.25, N = 40*/
                parametros.N = 40;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n40-l25-f3.csv", "erro1b-n40-l25-f3.csv");

                /*Item b lambda = 0.25, N = 80*/
                parametros.N = 80;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n80-l25-f3.csv", "erro1b-n80-l25-f3.csv");

                /*Item b com lambda = 0.25, N = 160*/
                parametros.N = 160;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n160-l25-f3.csv", "erro1b-n160-l25-f3.csv");

                /*Item b com lambda = 0.25, N = 320*/
                parametros.N = 320;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 3);
                calcula_uki(parametros, 3, u0i, uk0, ukn, "u1b-n320-l25-f3.csv", "erro1b-n320-l25-f3.csv");
                uk0 = NULL;
                ukn = NULL;
                u0i = NULL;
                free(uk0);
                free(ukn);
                free(u0i);
                return;
        }

        if (escolha == 3);
        {
                /*Item c com lambda = 0.5, N = 10*/
                parametros.instanteFinal = 1;
                parametros.lambda = 0.5;
                parametros.N = 10;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n10-l50-f4.csv", "");

                /*Item c com lambda = 0.5, N = 20*/
                parametros.N = 20;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n20-l50-f4.csv", "");

                /*Item c com lambda = 0.5, N = 40*/
                parametros.N = 40;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n40-l50-f4.csv", "");

                /*Item c com lambda = 0.5, N = 80*/
                parametros.N = 80;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n80-l50-f4.csv", "");

                /*Item c com lambda = 0.5, N = 160*/
                parametros.N = 160;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n160-l50-f4.csv", "");

                /*Item c com lambda = 0.5, N = 320*/
                parametros.N = 320;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n320-l50-f4.csv", "");

                /*Item c com lambda = 0.25, N = 10*/
                parametros.instanteFinal = 1;
                parametros.lambda = 0.25;
                parametros.N = 10;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n10-l25-f4.csv", "");

                /*Item c com lambda = 0.25, N = 20*/
                parametros.N = 20;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n20-l25-f4.csv", "");

                /*Item c com lambda = 0.25, N = 40*/
                parametros.N = 40;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n40-l25-f4.csv", "");

                /*Item c lambda = 0.25, N = 80*/
                parametros.N = 80;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n80-l25-f4.csv", "");

                /*Item c com lambda = 0.25, N = 160*/
                parametros.N = 160;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n160-l25-f4.csv", "");

                /*Item c com lambda = 0.25, N = 320*/
                parametros.N = 320;
                parametros.M = parametros.instanteFinal * pow(parametros.N, 2) / parametros.lambda;
                parametros.deltaT = parametros.instanteFinal / parametros.M;
                parametros.deltaX = 1.0 / parametros.N;
                condicoes(u0i, uk0, ukn, parametros, 1);
                calcula_uki(parametros, 4, u0i, uk0, ukn, "u1c-n320-l25-f4.csv", "");
                uk0 = NULL;
                ukn = NULL;
                u0i = NULL;
                free(uk0);
                free(ukn);
                free(u0i);
                return;
        }

        u0i = NULL;
        uk0 = NULL;
        ukn = NULL;
        free(uk0);
        free(ukn);
        free(u0i);
        return;
}

int interface_usuario()
{
        int escolha = 1;
        int fonte;

        struct discretzacao parametros;

        char nome[50], nome_erro[50];

        printf("MAP3121 - Exercicio Programa 1\n");
        printf("Um problema inverso para obtencao de distribuicao de Temperatura\n");
        printf("Dupla: Gustavo Donnini Chen, 10772925 - Turma 1\n");
        printf("       Lucas Roque Nunes,    10773735 - Turma 1\n");
        printf("TAREFA 1\n");
        while(true)
        {
                printf("\nVoce deseja: ");
                printf("\n\n1. Executar os teste do Item a");
                printf("\n2. Executar os teste do Item b");
                printf("\n3. Executar os teste do Item c");
                printf("\n4. Realizar um teste arbritario");
                printf("\n5. Finalizar programa");
                printf("\n\nDigite sua escolha: ");
                scanf("%d", &escolha);

                if (escolha == 1)
                {
                        printf("\n\nExecutando os testes do Item a...");
                        tarefa_1(escolha);
                        printf("\n\nTerminou a execucao dos testes do Item a...");
                }


                else if (escolha == 2)
                {
                        printf("\n\nExecutando os testes do Item b...");
                        tarefa_1(escolha);
                        printf("\n\nTerminou a execucao dos testes do Item b...");
                }


                else if (escolha == 3)
                {
                        printf("\n\nExecutando os testes do Item c...");
                        tarefa_1(escolha);
                        printf("\n\nTerminou a execucao dos testes do Item c...");
                }

                else if (escolha == 4)
                {
                        printf("\nAs fontes e condicoes estao no fontes.txt e no relatorio");
                        printf("\nQual fonte e respectivas condicoes deseja utilizar: ");
                        scanf("%d", &fonte);
                        printf("\nDigite o nome do arquivo onde sera salvo o resultado: ");
                        scanf("%s", &nome);
                        printf("\nDigite o nome do arquivo onde sera salvo o erro: ");
                        scanf("%s", &nome_erro);

                        parametros = escolha_discretizacao();
                        
                        double *u0i = (double *)calloc(parametros.N + 10, sizeof(double));
                        double *uk0 = (double *)calloc(parametros.M + 100, sizeof(double));
                        double *ukn = (double *)calloc(parametros.M + 100, sizeof(double));

                        if (fonte == 1)
                        {
                                condicoes(u0i, uk0, ukn, parametros, 1);
                                calcula_uki(parametros, fonte, u0i, uk0, ukn, nome, nome_erro); 
                        }

                        
                        if (fonte == 2)
                        {
                                condicoes(u0i, uk0, ukn, parametros, 2);
                                calcula_uki(parametros, fonte, u0i, uk0, ukn, nome, nome_erro); 
                        }

                        
                        if (fonte == 3)
                        {
                                condicoes(u0i, uk0, ukn, parametros, 3);
                                calcula_uki(parametros, fonte, u0i, uk0, ukn, nome, nome_erro); 
                        }

                        
                        if (fonte == 4)
                        {
                                condicoes(u0i, uk0, ukn, parametros, 1);
                                calcula_uki(parametros, fonte, u0i, uk0, ukn, nome, nome_erro); 
                        }
                }
                else return 0;
        }
        return 0;
}

int main() {
        int exit_status;

        exit_status = interface_usuario();
	return exit_status;
}
