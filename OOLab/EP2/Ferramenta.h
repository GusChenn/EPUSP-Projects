#ifndef FERRAMENTA_H
#define FERRAMENTA_H

#include "Recurso.h"

class Ferramenta: public Recurso {
public:
  Ferramenta (string nome, double custoDiario);//check
  virtual ~Ferramenta();//check
  virtual double getCustoDiario();//check
  virtual void imprimir(); //check
  virtual double getCusto(int dias);//cgheck

private:
  double custoDiario;
};

#endif
