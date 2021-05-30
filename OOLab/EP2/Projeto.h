#include "Atividade.h"
#include "Recurso.h"
#include <list>
#include <vector>
#include <stdexcept>

using namespace std;

#ifndef PROJETO_H
#define PROJETO_H



class Projeto {
public:
  Projeto(string nome);//check
  virtual ~Projeto();//check
  virtual string getNome();//cjeck
  virtual void adicionar(Atividade* a);//check
  virtual vector<Atividade*>* getAtividades();//check
  virtual void adicionar(Recurso* r);//check
  virtual list<Recurso*>* getRecursos();//check
  virtual int getDuracao();//chekc
  virtual int getDuracao(bool terminadas);//check
  virtual double getCusto();//check
  virtual void imprimir();//check

protected:
  string nome;
  vector<Atividade*>* atividades;
  list<Recurso*>* recursos;
};



#endif
