#ifndef ATIVIDADE_H_INCLUDED
#define ATIVIDADE_H_INCLUDED
#include "Pessoa.h"

#define MAXIMO_RECURSOS 10


class Atividade{

private:
    string nome;
    int horasNecessarias;
    int quantidadeDePessoas = 0;
    Pessoa* pessoas[MAXIMO_RECURSOS];

public:
    Atividade (string nome, int horasNecessarias);
    ~Atividade ();

    string getNome ();
    int getHorasNecessarias ();

    bool adicionar (Pessoa* recurso);
    Pessoa** getPessoas();
    int getQuantidadeDePessoas ();

    int getDuracao ();
    double getCusto ();

    void imprimir ();
};


#endif // ATIVIDADE_H_INCLUDED
