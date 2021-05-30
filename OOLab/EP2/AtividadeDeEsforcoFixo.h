#include "Atividade.h"
#include "Pessoa.h"
#include "Ferramenta.h"
#include <string>
#include <stdexcept>
#include <math.h>


using namespace std;

#ifndef ATIVIDADEDEESFORCOFIXO_H
#define ATIVIDADEDEESFORCOFIXO_H

class AtividadeDeEsforcoFixo: public Atividade {
public:
  AtividadeDeEsforcoFixo(string nome, int horasNecessarias); //cjeck
  virtual ~AtividadeDeEsforcoFixo(); //check
  virtual int getHorasNecessarias(); //check
  virtual int getDuracao();//check
  virtual double getCusto();//check
  virtual void imprimir();//check

protected:
  int horasNecessarias;
};

#endif
