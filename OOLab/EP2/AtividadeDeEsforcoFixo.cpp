#include "AtividadeDeEsforcoFixo.h"

AtividadeDeEsforcoFixo::AtividadeDeEsforcoFixo(string nome, int horasNecessarias) : Atividade(nome) {
  if (horasNecessarias <= 0) {
    throw new invalid_argument("Horas necessarias menores ou iguais a zero");
  }
  this->duracao = horasNecessarias;
}

AtividadeDeEsforcoFixo::~AtividadeDeEsforcoFixo() {}

int AtividadeDeEsforcoFixo::getHorasNecessarias() {
  return horasNecessarias;
}

int AtividadeDeEsforcoFixo::getDuracao() {
  int totalHorasDiarias = 0;

  if (this->estaTerminada()) {
    return duracaoReal;
  }

  if (quantidadeDeRecursos == 0) {
    throw new logic_error("Nao existem pessoas na atividade");
  }

  for (int i = 0; i < quantidadeDeRecursos; i++) {
    Pessoa *p1 = dynamic_cast<Pessoa*>(recursos[i]);
    if (p1 != NULL) {
      totalHorasDiarias += p1->getHorasDiarias();
    }
  }

  return ceil((double)horasNecessarias/(double)totalHorasDiarias);
}

double AtividadeDeEsforcoFixo::getCusto() {
  double custo = 0;

  if (quantidadeDeRecursos == 0) {
    return 0;
  }

  else for (int i = 0; i < quantidadeDeRecursos; i++) {
      custo += recursos[i]->getCusto(this->getDuracao());
  }

  return custo;
}

void AtividadeDeEsforcoFixo::imprimir() {
  cout << nome << " - " << this->getDuracao() << " dias - R$" << this->getCusto() << endl;
}
