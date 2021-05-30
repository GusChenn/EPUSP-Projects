#ifndef PESSOA_H
#define PESSOA_H

#include "Recurso.h"

class Pessoa: public Recurso {
public:
  Pessoa(string nome, double valorPorHora, int horasDiarias);//check
  Pessoa(string nome, int horasDiarias);//check
  virtual ~Pessoa();//check
  virtual double getValorPorHora();//check
  virtual int getHorasDiarias();//check
  virtual bool recebeValorPadrao();//check
  static void setValorPorHoraPadrao(double valor);//check
  static double getValorPorHoraPadrao();//check
  virtual void imprimir(); //check
  virtual double getCusto(int dias);//check

protected:
  double valorPorHora;
  int horasDiarias;
  static double valorPorHoraPadrao;
  bool recebePadrao;
};

#endif
