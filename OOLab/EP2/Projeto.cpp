#include "Projeto.h"

Projeto::Projeto(string nome) {
  this->nome = nome;
  atividades = new vector<Atividade*>();
  recursos = new list<Recurso*>();
}

Projeto::~Projeto() {}

string Projeto::getNome() {
  return this->nome;
}

void Projeto::adicionar(Atividade* a) {
  atividades->push_back(a);
}

vector<Atividade*>* Projeto::getAtividades() {
  return atividades;
}

void Projeto::adicionar(Recurso* r) {
  list<Recurso*>::iterator i = recursos->begin();
  while (i != recursos->end()) {
    if ((*i) == r) {
      throw new invalid_argument("Pessoa ja adicionada no projeto");
    }
    i++;
  }
  recursos->push_back(r);
}

list<Recurso*>* Projeto::getRecursos() {
  return recursos;
}

int Projeto::getDuracao() {
  int duracaoTotal = 0;
  for (unsigned int i = 0; i < atividades->size(); i++) {
    duracaoTotal += atividades->at(i)->getDuracao();
  }

  return duracaoTotal;
}

int Projeto::getDuracao(bool terminadas) {
  int duracaoTotal = 0;
  for (unsigned int i = 0; i < atividades->size(); i++) {
    if (atividades->at(i)->estaTerminada() == terminadas){
      duracaoTotal += atividades->at(i)->getDuracao();
    }
  }
  return duracaoTotal;
}

double Projeto::getCusto() {
  double custoTotal = 0;
  for (unsigned int i = 0; i < atividades->size(); i++) {
    custoTotal += atividades->at(i)->getCusto();
  }
  return custoTotal;
}

void Projeto::imprimir() {
  cout << this->getNome() << " - R$" << this->getCusto() << endl;

  cout << "Duracao:" << endl;

  cout << "Feito " << this->getDuracao(true) << " dias" << endl;

  cout << "Falta " << this->getDuracao(false) << " dias" << endl;

  cout << "Total " << this->getDuracao() << " dias" << endl;

  cout << "----" << endl;

  for (unsigned int i = 0; i < atividades->size(); i++) {
    atividades->at(i)->imprimir();
  }

  cout << endl;
}
