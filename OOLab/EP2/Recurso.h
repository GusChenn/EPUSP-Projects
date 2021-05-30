#ifndef RECURSO_H
#define RECURSO_H

#include <iostream>

using namespace std;

class Recurso {
public:
  Recurso(string nome); //check
  virtual ~Recurso(); //check
  virtual string getNome(); //check
  virtual double getCusto(int dias) = 0;
  virtual void imprimir() = 0; //check

protected:
  string nome;
};

#endif
