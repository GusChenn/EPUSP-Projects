#include "Ferramenta.h"
#include <stdexcept>

using namespace std;

Ferramenta::Ferramenta (string nome, double custoDiario) : Recurso (nome) {
  if (custoDiario < 0) {
    throw new invalid_argument ("custo diario negativo");
  }
  this->custoDiario = custoDiario;
}

Ferramenta::~Ferramenta() {}

double Ferramenta::getCustoDiario() {
  return this->custoDiario;
}

void Ferramenta::imprimir() {
  cout << "Ferramenta: " << this->getNome() << " - R$" << this->getCustoDiario() << " por dia" << endl;
}

double Ferramenta::getCusto(int dias) {
  return (dias * custoDiario);
}
