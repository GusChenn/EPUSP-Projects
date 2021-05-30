#include "PersistenciaDeProjeto.h"
PersistenciaDeProjeto::PersistenciaDeProjeto() {}

PersistenciaDeProjeto::~PersistenciaDeProjeto() {}

Projeto* PersistenciaDeProjeto::carregar(string arquivo) {
  //Projetos genericos
  Projeto* proj1;
  AtividadeDeEsforcoFixo* ae1;
  AtividadeDePrazoFixo* ap1;
  list<Recurso*>* recursos;
  vector<Atividade*>* atividades;

  unsigned int posicaoVector;

  string nomeProjeto;
  int numeroRecursos;
  int numeroAtividades;
  char tipo;
  char terminada;
  string nomeRecurso;
  string nomeAtividade;
  double valorHoraRecurso;
  int HorasDiariasRecurso;
  int horasNecessariasAtividade;
  int duracaoRealAtividade;
  int prazoAtividade;
  double custoDiarioRecurso;

  ifstream input;
  input.open (arquivo);

  if(input.fail()) {
    throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
    input.close();
  }

  input >> nomeProjeto;

  proj1 = new Projeto(nomeProjeto);//criacao do projeto
  recursos = proj1->getRecursos();

  input >> numeroRecursos;

  if(input.fail() || input.eof()) {
    throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
    input.close();
  }

  //entra no loop para ler todos os recursos
  for (int i = 0; i < numeroRecursos; i++) {
    //verifica o tipo do recurso
    input >> tipo;

    if(input.fail() || input.eof()) {
      throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
      input.close();
    }

    //se for pessoa
    if (tipo == 'P') {
      input >> nomeRecurso;
      input >> valorHoraRecurso;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }

      input >> HorasDiariasRecurso;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }
      //verifica se o valor por hora eh padrao
      if (valorHoraRecurso == -1) {
        proj1->adicionar(new Pessoa(nomeRecurso, HorasDiariasRecurso));
      } else {
        proj1->adicionar(new Pessoa(nomeRecurso, valorHoraRecurso, HorasDiariasRecurso));
      }
      //adiciona a pessoa no proj1
    }

    //se for Ferramenta
    if (tipo == 'F') {
      input >> nomeRecurso;
      input>> custoDiarioRecurso;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }

      proj1->adicionar(new Ferramenta(nomeRecurso, custoDiarioRecurso));
    }
  }

  input >> numeroAtividades;

  if(input.fail() || input.eof()) {
    throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
    input.close();
  }
  //entra no loop para ler todas as atividades
  for (int i = 0; i < numeroAtividades; i++) {
    //verifica o tipo de atividade
    input >> tipo;

    if(input.fail() || input.eof()) {
      throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
      input.close();
    }

    //se for ativ. de esf. fixo
    if (tipo == 'E') {
      input >> nomeAtividade;
      input >> horasNecessariasAtividade;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }
      input >> terminada;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }
      ae1 = new AtividadeDeEsforcoFixo(nomeAtividade, horasNecessariasAtividade);

      //se terminada, le o tempo real
      if (terminada == 'T') {
        input >> duracaoRealAtividade;

        if(input.fail() || input.eof()) {
          throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
          input.close();
        }

        //adiciona uma atividade terminada no proj1
        ae1->terminar(duracaoRealAtividade);
        proj1->adicionar(ae1);
      } else {

        //se nao terminada, adiciona a atividade nao terminada
        proj1->adicionar(ae1);
      }
    }

    //se for uma ativ de prazo fixo
    if (tipo == 'P') {
      input >> nomeAtividade;
      input >> prazoAtividade;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }

      input >> terminada;

      if(input.fail() || input.eof()) {
        throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
        input.close();
      }

      ap1 = new AtividadeDePrazoFixo(nomeAtividade, prazoAtividade);

      //se terminada, le o tempo real
      if (terminada == 'T') {
        input >> duracaoRealAtividade;

        if(input.fail()) {
          throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
          input.close();
        }

        //adiciona uma atividade terminada no proj1
        ap1->terminar(duracaoRealAtividade);
        proj1->adicionar(ap1);
      } else {

        //se nao terminada, adiciona a atividade nao terminada
        proj1->adicionar(ap1);
      }
    }

    //le o numero de recursos dessa atividade
    input >> numeroRecursos;

    if(input.fail() || input.eof()) {
      throw new ErroDeArquivo("Formato de entrada errado, por favor revisar o arquivo");
      input.close();
    }

    //recupera a lista ligada de recursos
    recursos = proj1->getRecursos();


    //recupera p vector de atividades
    atividades = proj1->getAtividades();

    //entra no loop pra ler todos os nomes dos recursos
    for (int i = 0; i < numeroRecursos; i++) {
      input >> nomeRecurso;
      //reinicializa o iterador toda vez que o loop eh completo
      list<Recurso*>::iterator k = recursos->begin();
      //percorre o vector de atividaes
      for (unsigned int j = 0; j < atividades->size(); j++) {
        if (atividades->at(j)->getNome() == nomeAtividade) {
          //salva a posicao em que esta a atividade que queremos adicionar o recurso
          posicaoVector = j;
        }
      }

      //percorre a lista ligada e procura o recurso que tem esse nome
      while (k != recursos->end()) {
        if ((*k)->getNome() == nomeRecurso) {
          //adiciona o recurso que queremos na atividade desejada
          atividades->at(posicaoVector)->adicionar((*k));
        }
        k++;
      }
    }
  }
  return proj1;
  input.close();
}

void PersistenciaDeProjeto::salvar(Projeto* p, string arquivo) {

  list<Recurso*>* recursos;
  vector<Atividade*>* atividades;

  ofstream output;
  output.open(arquivo);

  if (output.fail()) {
    throw new ErroDeArquivo("Falha ao salvar o projeto");
  }

  //salva o nome do projeto
  output << p->getNome() << endl;

  if (output.fail()) {
    throw new ErroDeArquivo("Falha ao salvar o projeto");
  }

  //recupera a list de recursos e o vector de atividades
  atividades = p->getAtividades();
  recursos = p->getRecursos();
  //salva o numero de recursos no projeto
  output << recursos->size() << endl;

  if (output.fail()) {
    throw new ErroDeArquivo("Falha ao salvar o projeto");
  }

  //inicializa iterador e percorre a lista para salva-la
  list<Recurso*>::iterator i = recursos->begin();
  while (i != recursos->end()) {

    //verifica se eh pessoa
    Pessoa *p1 = dynamic_cast<Pessoa*>((*i));
    if (p1 != NULL) {
      output << "P " << (*i)->getNome() << " ";

      if (output.fail()) {
        throw new ErroDeArquivo("Falha ao salvar o projeto");
      }
      //verifica se recebe valor padrao
      if (p1->recebeValorPadrao()) {
        output << -1 << " ";

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }
      } else {
        output << p1->getValorPorHora() << " ";

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }
      }

      output << p1->getHorasDiarias() << endl;
    } else {
      //se nao for pessoa, verifica se eh ferramenta
      Ferramenta *f1 = dynamic_cast<Ferramenta*>((*i));
      if (f1 != NULL) {
        output << "F " << f1->getNome() << " " << f1->getCustoDiario() << endl;

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }
      } else {
        throw new ErroDeArquivo("Recurso nao eh nem pessoa nem ferramenta");
      }

    }
    i++;
  }

  //salva o numero de atividades
  output << atividades->size() << endl;

  if (output.fail()) {
    throw new ErroDeArquivo("Falha ao salvar o projeto");
  }


  //percorre as atividades para as salvar
  for (unsigned int i = 0; i < atividades->size(); i++) {

    AtividadeDeEsforcoFixo *ae1 = dynamic_cast<AtividadeDeEsforcoFixo*>(atividades->at(i));

    //verifica se eh uma atividade de esforco fixo
    if (ae1 != NULL) {
      output << "E " << ae1->getNome() << " " << ae1->getHorasNecessarias() << " ";

      if (output.fail()) {
        throw new ErroDeArquivo("Falha ao salvar o projeto");
      }


      //verifica se esta terminada
      if (ae1->estaTerminada()) {
        output << "T " << ae1->getDuracaoReal() << endl;

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }
      } else {
        output << "N " << endl;

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }
      }
    } else {
      //se nao for ativ de esf fixo, verifica se eh ativ de prazo fixo
      AtividadeDePrazoFixo *ap1 = dynamic_cast<AtividadeDePrazoFixo*>(atividades->at(i));

      //verifica se eh uma atividade de esforco fixo
      if (ap1 != NULL) {
        output << "P " << ap1->getNome() << " " << ap1->getPrazo() << " ";

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }


        //verifica se esta terminada
        if (ap1->estaTerminada()) {
          output << "T " << ap1->getDuracaoReal() << endl;

          if (output.fail()) {
            throw new ErroDeArquivo("Falha ao salvar o projeto");
          }
        } else {
          output << "N " << endl;

          if (output.fail()) {
            throw new ErroDeArquivo("Falha ao salvar o projeto");
          }
        }
      } else {
        throw new ErroDeArquivo("Atividade nao eh nem de prazo fixo nem de esforco fixo");
      }
    }

    //salva o numero de recursos dentro dessa atividade
    output << atividades->at(i)->getQuantidadeDeRecursos() << endl;

    if (output.fail()) {
      throw new ErroDeArquivo("Falha ao salvar o projeto");
    }

    //salva os nomes dos recursos que estao nessa atividade
    int k;
    for (k = 0; k < atividades->at(i)->getQuantidadeDeRecursos(); k++) {


      if (k = atividades->at(i)->getQuantidadeDeRecursos()) {
        output << atividades->at(i)->getRecursos()[k]->getNome() << endl;
        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }

      } else {
        output << atividades->at(i)->getRecursos()[k]->getNome() << " ";

        if (output.fail()) {
          throw new ErroDeArquivo("Falha ao salvar o projeto");
        }
      }
    }
  }
}
