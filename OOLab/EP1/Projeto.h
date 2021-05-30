#ifndef PROJETO_H
#define PROJETO_H

#include "Atividade.h"
#include "Pessoa.h"
#define MAXIMO_ATIVIDADES 10

class Projeto{

private:
    int quantidadeDeProjetos = 0;
    string nome;
    Atividade* atividades[MAXIMO_ATIVIDADES];
    Pessoa* pessoas[MAXIMO_RECURSOS];
    int quantidadeDePessoas = 0;

public:
    Projeto(string nome);
    ~Projeto();

    string getNome();

    bool adicionar(Atividade* a);
    Atividade** getAtividades();
    int getQuantidadeDeAtividades();

    bool adicionarRecurso(Pessoa* p);
    Pessoa** getPessoas();
    int getQuantidadeDePessoas();

    int getDuracao();
    double getCusto();
    void imprimir();

};

#endif // PROJETO_H
