#include "Projeto.h"
#include "Pessoa.h"
#include "Ferramenta.h"
#include "Recurso.h"
#include "AtividadeDeEsforcoFixo.h"
#include "AtividadeDePrazoFixo.h"
#include "ErroDeArquivo.h"
#include "Atividade.h"
#include <fstream>
#include <stdexcept>
#include <string>

using namespace std;

#ifndef PERSISTENCIADEPROJETO_H
#define PERSISTENCIADEPROJETO_H

class PersistenciaDeProjeto {
public:
  PersistenciaDeProjeto();
  virtual ~PersistenciaDeProjeto();
  Projeto* carregar(string arquivo);
  void salvar(Projeto* p, string arquivo);
};

#endif
