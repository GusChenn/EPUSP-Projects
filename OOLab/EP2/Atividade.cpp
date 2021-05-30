#include "Atividade.h"

Atividade::Atividade(string nome) {
  this->nome = nome;
  this->quantidadeDeRecursos = 0;
  this->terminado = false;
  this->duracao = 0;
}

Atividade::~Atividade() {}

string Atividade::getNome() {
  return nome;
}

 void Atividade::adicionar(Recurso *r) {
   if (quantidadeDeRecursos >= MAX_RECURSOS) {
     throw new overflow_error("Nao e possivel adicionar mais recursos");
   }

   for (int i = 0; i < quantidadeDeRecursos; i++){
       if (this->recursos[i] == r)
           throw new invalid_argument("Recurso ja utilizado");
       }

   recursos[quantidadeDeRecursos] = r;
   quantidadeDeRecursos++;
 }

Recurso** Atividade::getRecursos() {
  return recursos;
}

int Atividade::getQuantidadeDeRecursos() {
  return quantidadeDeRecursos;
}

void Atividade::terminar(int duracaoReal) {
  this->duracaoReal = duracaoReal;
  this->duracao = duracaoReal;

  if (duracaoReal <= 0) {
    throw new invalid_argument("Duracao negativa");
  }

  this->terminado = true;
}

bool Atividade::estaTerminada() {
  return this->terminado;
}

int Atividade::getDuracaoReal() {
  return this->duracaoReal;
}
