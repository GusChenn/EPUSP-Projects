#include "Pessoa.h"
#include <iostream>
#include <stdexcept>
#include <string>

using namespace std;

Pessoa::Pessoa(string nome, double valorPorHora, int horasDiarias) : Recurso(nome) {
  this->valorPorHora = valorPorHora;
  this->horasDiarias = horasDiarias;
  this->recebePadrao = false;

  if (valorPorHora <= 0) {
    throw new invalid_argument ("Valor por hora negativo");
  }

  if (horasDiarias <= 0) {
    throw new invalid_argument ("Horas diarias negativas");
  }
}

Pessoa::Pessoa(string nome, int horasDiarias) : Recurso(nome) {
  this->horasDiarias = horasDiarias;
  this->valorPorHora = Pessoa::valorPorHoraPadrao;
  this->recebePadrao = true;
}

Pessoa::~Pessoa() {}

double Pessoa::getValorPorHora() {
  if (this->recebeValorPadrao()) {
    this->valorPorHora = Pessoa::valorPorHoraPadrao;
    return Pessoa::valorPorHoraPadrao;
  }
  return valorPorHora;
}

int Pessoa::getHorasDiarias() {
  return horasDiarias;
}

bool Pessoa::recebeValorPadrao() {
  return this->recebePadrao;
}

void Pessoa::setValorPorHoraPadrao (double valor) {
  Pessoa::valorPorHoraPadrao = valor;

  if (valor <= 0) {
    throw new invalid_argument ("Valor por hora padrao negativo");
  }
}

double Pessoa::getValorPorHoraPadrao() {

  return Pessoa::valorPorHoraPadrao;
}

void Pessoa::imprimir() {
  if (this->recebeValorPadrao()) {
    this->valorPorHora = Pessoa::valorPorHoraPadrao;
  }

  cout << "Pessoa: " << this->getNome() << " - R$" << this->getValorPorHora() << " - " << this->getHorasDiarias() << "h por dia" << endl;
}

double Pessoa::getCusto(int dias) {
  if (this->recebeValorPadrao()) {
    this->valorPorHora = Pessoa::valorPorHoraPadrao;
  }

  return (dias * horasDiarias * valorPorHora);
}

double Pessoa::valorPorHoraPadrao = 10;
