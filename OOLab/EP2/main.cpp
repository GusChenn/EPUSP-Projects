#include <iostream>
#include <string>
#include <vector>
#include <list>
#include "Projeto.h"
#include "Atividade.h"
#include "Recurso.h"
#include "Pessoa.h"
#include "Ferramenta.h"
#include "PersistenciaDeProjeto.h"
#include "ErroDeArquivo.h"
#include "AtividadeDePrazoFixo.h"
#include "AtividadeDeEsforcoFixo.h"


using namespace std;
int telaDeOpcoes(Projeto* projetinho);//check
void adicionarRecurso(Projeto* projetinho);//check
void adicionarAtividade(Projeto* projetinho);
bool listaDeAtividades(Projeto* projetinho);
bool listaDeRecursos(Projeto* projetinho, Atividade* ativ);

int main()
{
    cout << "Deseja carregar um novo projeto (s/n)?" << endl;
    char resposta; //char para guardar a resposta para a pergunta acima
    cin >> resposta;

    if (resposta == 'n'){
        //caso a resposta seja 'n', deve ser criado um novo projeto para ser trabalhado
        cout << "Digite o nome do projeto:" << endl;
        string nomeDoProjeto;
        cin >> nomeDoProjeto;
        Projeto* projetinho = new Projeto (nomeDoProjeto); //criacao do projeto

        while (telaDeOpcoes (projetinho) != 0){
            telaDeOpcoes(projetinho);
        }
        return 0;
    }

    if (resposta == 's'){
        //caso a resposta seja 's', deve-se carregar um projeto ja existente
        cout << "Digite o nome do arquivo:" << endl;
        string nomeDoArquivo;
        cin >> nomeDoArquivo;

        Projeto* projetinho;
        try{
        PersistenciaDeProjeto* persist = new PersistenciaDeProjeto (); //criacao de uma persistencia para carregar o projeto
        projetinho = persist->carregar(nomeDoArquivo);
      }catch (ErroDeArquivo *e){
        cout << "Erro: " << e->what();
        delete e;
      }

        while (telaDeOpcoes(projetinho) != 0){
            telaDeOpcoes(projetinho);
        }
        return 0;
    }
}

//tela de opcoes na qual o usuario deve deidir o que fazer
int telaDeOpcoes (Projeto* projetinho){
    int opcao; //recebera a opcao digitada
    cout << "1 - Adicionar recurso" << endl;
    cout << "2 - Adicionar atividade" << endl;
    cout << "3 - Terminar atividade" << endl;
    cout << "4 - Imprimir projeto" << endl;
    cout << "5 - Definir valor por hora padrao" << endl;
    cout << "6 - Salvar" << endl;
    cout << "0 - Sair" << endl;
    cout << "Escolha a opcao:" << endl;

    cin >> opcao;

    if (opcao == 0){
        cout << "Voce saiu." << endl;
        cout << "Programa terminado." << endl;
        return 0;
        //como terminar o programa?
    }

    if (opcao == 1){
        adicionarRecurso(projetinho);
        return 1;
    }

    if (opcao == 2){
        adicionarAtividade (projetinho);
        return 1;
    }

    if (opcao == 3){
        listaDeAtividades (projetinho);
        return 1;
    }

    if (opcao == 4){
        try{
          projetinho -> imprimir (); //chama funcao imprimir do projeto
          //telaDeOpcoes(projetinho); //volta para o inicio da tela de opcoes
        }catch (logic_error *e){
          cout << "Erro: " << e->what();
          delete e;
        }
        return 1;
    }

    if (opcao == 5){
      Pessoa* p1 = new Pessoa("teste", 10);
          cout << "Valor atual: R$" << p1 ->getValorPorHoraPadrao() << " por hora"<< endl;

      //cout << "Valor atual: R$" << pess ->getValorPorHoraPadrao() << " por hora"<< endl;
      //cout << "Valor atual: R$" << projetinho -> getRecursos() -> front() -> getValorPorHoraPadrao() << " por hora"<< endl;
      cout << "Novo valor: " << endl;
      double novoValor;
      cin >> novoValor; //recebe o novo valor padrao

      try {
        p1->setValorPorHoraPadrao(novoValor);
      } catch (invalid_argument *e) {
        cout << e->what() << endl;
        delete e;
      }
      list<Recurso*>::iterator i = projetinho->getRecursos()->begin();
      while (i != projetinho->getRecursos()->end()) {
        Pessoa *p2 = dynamic_cast<Pessoa*>((*i));
        if (p2 != NULL) {
          if (p2->recebeValorPadrao()) {
            p2->getValorPorHora();
          }
        }
        i++;
      }
      delete p1;
      return 1;
    }

    if (opcao == 6){
      string nomeDoArquivo;
      cout << "Nome do Arquivo: " << endl;
      cin >> nomeDoArquivo;
      PersistenciaDeProjeto* persist = new PersistenciaDeProjeto(); //cria uma nova persistencia
      persist -> salvar (projetinho, nomeDoArquivo); //usa essa persistencia para salvaro arquivo
      //talvez deletar a persistencia apos o uso?
      telaDeOpcoes(projetinho); //volta para a tela de opcoes
      return 1;
    } else {
      cout << "entrada invalida" << endl;
      return 0;
    }
  }

  //funcao para adicionar recursos ao projeto
  void adicionarRecurso (Projeto* projetinho){
    cout << "Ferramenta (f) ou Pessoa (p): " <<endl;
    char recurso; //recebe 'f' ou 'p'
    cin >> recurso;

    //caso o recurso seja uma ferramenta:
    if (recurso == 'f'){
      string nome;
      double custoDiario;

      cout << "Nome: " << endl;
      cin >> nome; //recebe o nome da ferramenta
      cout << "Custo Diario: " << endl;
      cin >> custoDiario; //recebe o custo diario da ferramenta

      try{
      Ferramenta* ferramentinha = new Ferramenta (nome, custoDiario);
      projetinho -> adicionar(ferramentinha);
    }catch(invalid_argument *e){
      cout << "Erro: " << e->what();
      delete e;
    }
      //projetinho -> adicionar(ferramentinha); //adicionando a ferramenta ao projeto

      //telaDeOpcoes(projetinho); //volta para a tela de opcoes
    }

    //caso o recurso seja uma pessoa
    if (recurso == 'p'){
      string nome;
      int horasDiarias;
      char usarValorPadrao;
      double valorPorHora;

      cout << "Nome: " << endl;
      cin >> nome; //recebe o nome da pessoa
      cout << "Horas diarias: " << endl;
      cin >> horasDiarias; //recebe as horas diarias da pessoa

      //usuario decide se quer usar o valor por hora padrao ou nao
      cout << "Valor por hora padrao (s/n)?" << endl;
      cin >> usarValorPadrao; //recebe resposta para a pergunta acima

      //caso o usuario nao queira usar o valor padrao:
      if (usarValorPadrao == 'n'){
        cout << "Valor por hora (em R$): " << endl;
        cin >> valorPorHora; //recebe o valor por hora do usuarios
        if(valorPorHora < 0){
          cout << "Erro: Valor por hora negativo";
        }else{

          try{
            Pessoa* pessoinha = new Pessoa (nome, valorPorHora, horasDiarias);
            projetinho -> adicionar(pessoinha); //adiciona a pessoa ao projeto
          }catch (invalid_argument *e){
            cout << "Erro: " << e->what();
            cout << endl;
            delete e;
          }
          //telaDeOpcoes(projetinho); //volta para a tela de opcoes
        }
      } else {
        try{
          Pessoa* pessoinha = new Pessoa (nome, horasDiarias);
          projetinho -> adicionar(pessoinha); //adiciona a pessoa ao projeto
        }catch (invalid_argument *e){
          cout << "Erro: " << e->what();
          cout << endl;
          delete e;
        }
      }
      //telaDeOpcoes(projetinho); //volta para a tela de opcoes
    }
  }

void adicionarAtividade (Projeto* projetinho){
    AtividadeDePrazoFixo* ativ;
    string nome;
    cout << "Nome: " << endl;
    cin >> nome; //recebe nome da atividade a ser criada

    char resposta;
    cout << "Praxo fixo (p) ou trabalho fixo(t)?" << endl;
    cin >> resposta; //recebe 'p' ou 't'

    //usuario quer criar uma atividade de prazo fixo:
    if (resposta == 'p'){
        bool terminado = false;
        int dias;
        cout << "Dias necessarios: " << endl;
        cin >> dias;

        try{
        ativ = new AtividadeDePrazoFixo (nome, dias);
         //adiciona atividade ao projeto
       }catch(invalid_argument *e){
         cout << "Erro: " << e->what();
         delete e;
       }
        projetinho -> adicionar (ativ);
        while (terminado == false) {
          terminado = listaDeRecursos(projetinho, ativ);
        }
    }

    //usario quer criar uma atividade de esforco fixo:
    if (resposta == 't'){
        bool terminado = false;
        int horasNecessarias;
        cout << "Horas necessarias: " << endl;
        cin >> horasNecessarias;

        AtividadeDeEsforcoFixo* ativ = new AtividadeDeEsforcoFixo (nome, horasNecessarias);

        projetinho -> adicionar (ativ);
        while (terminado == false) {
          terminado = listaDeRecursos(projetinho, ativ);
        }
        //adiciona atividade ao projeto
         //vai para a lista de recursos
    }
}

bool listaDeRecursos (Projeto* projetinho, Atividade* ativ){
  /**Lembrar de colocar um try-catch em algum lugar aqui **/
  char resposta;
  int opcao;
  int numero = 1;
  int indice;

  cout << "Deseja adicionar um recurso (s/n)?" << endl;
  cin >> resposta;
  if (resposta == 'n') {
    return true;
  } else if (resposta == 's') {

    //imprime as opcoes
    list<Recurso*>::iterator j = projetinho->getRecursos()->begin();
    for (unsigned int i = 0; i < projetinho->getRecursos()->size(); i++) {
      cout << numero << " - ";
      (*j)->imprimir();
      cout << endl;
      j++;
      numero++;
    }

    cout << "Escolha um recurso ou 0 para cancelar: ";
    cin >> opcao;
    cout << endl;

      if (opcao == 0) {
        return true;
      } else {
        for (unsigned int i = 0; i < projetinho->getAtividades()->size(); i++) {
          if (projetinho->getAtividades()->at(i) == ativ) {
            indice = i;
          }
    }

      //achou o indice da atividade, agora adiciona a pessoa selecionada na atividade
      list<Recurso*>::iterator i = projetinho->getRecursos()->begin();
      int k = 0;
      //chega no recurso que o usuario escolheu
      while (k != (opcao - 1)) {
        i++;
        k++;
      }
      try {
        projetinho->getAtividades()->at(indice)->adicionar((*i));
      } catch (invalid_argument *e) {
        cout << "Nao foi possivel adicionar recurso" << endl;
        delete e;
        return false;
      }catch (overflow_error *e){
        cout << "Erro: " << e->what();
        delete e;
      }

      cout << "Adicionado a atividade" << endl;
      return false;
    }
  }
}

bool listaDeAtividades (Projeto* projetinho){
  int i = 0;
  for (unsigned int j = 0; j < projetinho->getAtividades()->size(); j++) {
    cout << i + 1 << " - " << projetinho->getAtividades()->at(j)->getNome() << endl;
    i++;
  }

  cout << "Escolha uma atividade ou 0 para cancelar ";
  int opcao;
  cin >> opcao;
  cout << endl;

  if (opcao == 0) {
    return false;
  } else {
    if (projetinho->getAtividades()->at(opcao - 1)->estaTerminada()) {
      cout << "Atividade ja terminada" << endl;
      return false;
    } else {
      cout << "Duracao real: ";
      int duracao;
      cin >> duracao;
      try{
        projetinho->getAtividades()->at(opcao - 1)->terminar(duracao);
      }catch (invalid_argument *e){
        cout << "Erro: " << e-> what();
        delete e;
      }
      return true;
    }
  }
}
