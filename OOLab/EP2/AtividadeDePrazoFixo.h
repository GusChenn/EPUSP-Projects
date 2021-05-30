#include "Atividade.h"
#include <stdexcept>

using namespace std;

#ifndef ATIVIDADEDEPRAZOFIXO_H
#define ATIVIDADEDEPRAZOFIXO_H

class AtividadeDePrazoFixo : public Atividade {
public:
  AtividadeDePrazoFixo (string nome, int dias); //check
  virtual ~AtividadeDePrazoFixo();//check
  virtual int getPrazo();//check
  virtual int getDuracao();//check
  virtual double getCusto();//check
  virtual void imprimir();//check

protected:
  int dias;
};
#endif
