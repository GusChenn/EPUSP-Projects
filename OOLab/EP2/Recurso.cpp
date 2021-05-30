#include "Recurso.h"

Recurso::Recurso(string nome) {
  this->nome = nome;
}

Recurso::~Recurso() {}

string Recurso::getNome() {
  return this->nome;
}
