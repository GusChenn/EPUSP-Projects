#include <iostream>
#include <cmath>
#include <string>
#include "Atividade.h"



using namespace std;

Atividade::Atividade(string nome, int horasNecessarias) :
nome(nome), horasNecessarias(horasNecessarias) {}

Atividade::~Atividade(){
    cout << "Atividade removida" << endl;
}

string Atividade::getNome(){
    return nome;
}

int Atividade::getHorasNecessarias(){
    return horasNecessarias;
}

bool Atividade::adicionar(Pessoa* recurso){
    int i;
    if (this->quantidadeDePessoas >= MAXIMO_RECURSOS - 1)
        return false;
    for (i = 0; i < quantidadeDePessoas; i++){
        if (this->pessoas[i] == recurso)
            return false;
        }
    this->pessoas[quantidadeDePessoas] = recurso;
    quantidadeDePessoas++;
    return true;
}

Pessoa** Atividade::getPessoas (){
    return this->pessoas;
}

int Atividade::getQuantidadeDePessoas (){
    return this->quantidadeDePessoas;
}

int Atividade::getDuracao (){
    if (quantidadeDePessoas == 0)
        return -1;
    int horasTotais = 0;
    int i;
    for (i = 0; i < quantidadeDePessoas; i++){
        horasTotais += pessoas[i]->getHorasDiarias();
    }
    return (ceil((double)this->horasNecessarias / (double)horasTotais));
}

double Atividade::getCusto (){
    if (quantidadeDePessoas == 0)
        return -1;
    double custo = 0.0;
    for (int i = 0; i < quantidadeDePessoas; i++){
        custo += (horasNecessarias * pessoas[i]->getValorPorHora());
    }
    return custo;
}

void Atividade::imprimir (){
   cout << getNome() << " - " << getDuracao() << " dias - R$" << getCusto() << endl;
}
