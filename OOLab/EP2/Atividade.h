#include <string>
#include <stdexcept>
#include <iostream>
#include "Recurso.h"
#ifndef ATIVIDADE_H
#define ATIVIDADE_H

using namespace std;

class Atividade {

public:
  Atividade(string nome);
  virtual ~Atividade();

  virtual string getNome();

  virtual void adicionar(Recurso* r);
  virtual Recurso** getRecursos();
  virtual int getQuantidadeDeRecursos ();
  virtual int getDuracao() = 0;
  virtual double getCusto() = 0;
  virtual void terminar(int duracaoReal);
  virtual bool estaTerminada();
  virtual void imprimir() = 0;
  static const int MAX_RECURSOS = 10;
  virtual int getDuracaoReal();

protected:
  string nome;
  Recurso* recursos[MAX_RECURSOS];
  int quantidadeDeRecursos;
  bool terminado;
  int duracaoReal;
  int duracao;
};

#endif
