#include <iostream>
#include <string>
#include "Pessoa.h"

using namespace std;

Pessoa::Pessoa(string nome, double valorPorHora, int horasDiarias) :
nome(nome), valorPorHora(valorPorHora), horasDiarias(horasDiarias) {}

Pessoa::~Pessoa(){}

string Pessoa::getNome(){
    return this->nome;
}

double Pessoa::getValorPorHora(){
    return this->valorPorHora;
}

int Pessoa::getHorasDiarias(){
    return horasDiarias;
}

double Pessoa::getCusto(int dias){
    return ((double)(this->horasDiarias * this->valorPorHora * dias));
}

void Pessoa::imprimir(){
    cout << this->nome << " - R$" << this->valorPorHora << " - " << this->horasDiarias << "h por dia" << endl;
}
