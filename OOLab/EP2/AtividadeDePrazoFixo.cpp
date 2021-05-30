#include "AtividadeDePrazoFixo.h"

AtividadeDePrazoFixo::AtividadeDePrazoFixo(string nome, int dias) : Atividade(nome) {
  if (dias <= 0) {
    throw new invalid_argument("Numero de dias menor ou igual a zero");
  }

  this->duracao = dias;
}

AtividadeDePrazoFixo::~AtividadeDePrazoFixo() {}

int AtividadeDePrazoFixo::getPrazo() {
  return dias;
}

int AtividadeDePrazoFixo::getDuracao() {
  if (this->estaTerminada()) {
    return duracaoReal;
  }

  else return dias;
}

double AtividadeDePrazoFixo::getCusto() {
  double custo = 0;

  if (quantidadeDeRecursos == 0) {
    return 0;
  }

  else for (int i = 0; i < quantidadeDeRecursos; i++) {
      custo += recursos[i]->getCusto(this->getDuracao());
  }

  return custo;
}

void AtividadeDePrazoFixo::imprimir() {
  cout << nome << " - " << this->getDuracao() << " dias - R$" << this->getCusto() << endl;
}
