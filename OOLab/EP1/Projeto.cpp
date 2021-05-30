#include "Projeto.h"
#include <iostream>
#include <string>

using namespace std;

Projeto::Projeto(string nome) :
nome(nome) {}

Projeto::~Projeto(){}

string Projeto::getNome(){
    return this->nome;
}

bool Projeto::adicionar(Atividade* a){
    int i;
    if (quantidadeDeProjetos > MAXIMO_ATIVIDADES - 1)
        return false;
    for (i = 0; i < quantidadeDeProjetos; i++){
        if (this->atividades[i] == a)
            return false;
    }
    this->atividades[quantidadeDeProjetos] = a;
    quantidadeDeProjetos++;
    return true;
}

Atividade** Projeto::getAtividades(){
    return this->atividades;
}

int Projeto::getQuantidadeDeAtividades(){
    return this->quantidadeDeProjetos;
}

bool Projeto::adicionarRecurso(Pessoa* recurso){
    int i;
    if (this->quantidadeDePessoas > MAXIMO_RECURSOS - 1)
        return false;
    for (i = 0; i < quantidadeDePessoas; i++){
            if (this->pessoas[i] == recurso)
                return false;
        }

    this->pessoas[quantidadeDePessoas] = recurso;
    quantidadeDePessoas++;
    return true;
}

Pessoa** Projeto::getPessoas(){
    return this->pessoas;
}

int Projeto::getQuantidadeDePessoas(){
    return this->quantidadeDePessoas;
}

int Projeto::getDuracao(){
    int i;
    int duracao = 0;
    for (i = 0; i < quantidadeDeProjetos; i++){
        duracao += atividades[i]->getDuracao();
    }
    return duracao;
}

double Projeto::getCusto(){
    int i;
    int custo = 0;
    for (i = 0; i < quantidadeDeProjetos; i++){
        custo += atividades[i]->getCusto();
    }
    return custo;
}

void Projeto::imprimir(){
    int i;
    cout << this->getNome() << " - " << this->getDuracao() << " dias - R$" << this->getCusto() << endl;
    cout << "----" << endl;
    for (i = 0; i < quantidadeDeProjetos; i++){
        this->getAtividades()[i]->imprimir();
    }
}
