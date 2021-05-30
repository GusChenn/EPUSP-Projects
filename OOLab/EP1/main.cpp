#include "Pessoa.h"
#include "Atividade.h"
#include "Projeto.h"
#include <iostream>
#include <string>

using namespace std;

int imprimirOpcoes(){
    int opcao;
    cout << "1 - Adicionar pessoa" << endl;
    cout << "2 - Adicionar atividade" << endl;
    cout << "3 - Imprimir projeto" << endl;
    cout << "0 - Sair" << endl;

    cout << "Escolha a opcao: ";
    cin >> opcao;
    return opcao;
}

bool adicionarPessoas(Projeto *proj1){
    string nome;
    double valorHora;
    int horasDiarias;

    cout << "Nome: ";
    cin >> nome;

    cout << "Valor por Hora (em R$): ";
    cin >> valorHora;

    cout << "Horas diarias: ";
    cin >> horasDiarias;

    Pessoa *person1 = new Pessoa(nome, valorHora, horasDiarias);

    bool deuBom = proj1 -> adicionarRecurso (person1);

    if (deuBom){
        cout << "Adicionado ao projeto" << endl;
        return 1;
    }
    else {
        cout << "Nao eh possivel adicionar uma nova pessoa" << endl;
        return 0;
    }


}

bool adicionarPessoaNaAtividade (Projeto *proj, Atividade *ativ){
    int i, opcao, verifica;
    for (i = 0; i < proj->getQuantidadeDePessoas(); i++){
        cout << (i + 1) << " - ";
        proj->getPessoas()[i]->imprimir();
    }
    cout << "Escolha uma pessoa ou 0 para cancelar: ";
    cin >> opcao;

    if (opcao == 0)
        return 0;

    opcao -= 1;

    verifica = proj->getAtividades()[proj->getQuantidadeDeAtividades() - 1]->adicionar(proj->getPessoas()[opcao]);


    if (verifica == false){
        cout << "Nao foi possivel adicionar a pessoa" << endl;
    }
    return 1;
}

bool adicionarAtividade (Projeto *proj1){
    string nome;
    int horasNecessarias;

    cout << "Nome: ";
    cin >> nome;

    cout << "Horas Necessarias: ";
    cin >> horasNecessarias;

    Atividade *atv1 = new Atividade (nome, horasNecessarias);

    bool deuBom = proj1 -> adicionar (atv1);

    if (deuBom){
        cout << "Adicionado ao projeto" << endl;

        while (1 == 1){
            cout << "Deseja adicionar um recurso (s/n)?" << endl;

            char resposta;

            cin >> resposta;

            if (resposta == 'n'){
                return 1;
            }
            if (resposta == 's'){
                adicionarPessoaNaAtividade (proj1, atv1);
                return 1;
            }
        }



    }else{
        cout << "Nao eh possivel adcionar uma nova atividade" << endl;
        return 0;
    }
}

int main()
{
    /* ------- TELA 1 ---------*/

    string nomeProjeto;
    cout << "Digite o nome do projeto: ";
    cin >> nomeProjeto;
    cout << "\n";
    Projeto *proj1 = new Projeto(nomeProjeto);


    /* ------- TELA 2 ---------*/

    while (true) { //laco infinito
            int opcao;
        opcao = imprimirOpcoes();

        if (opcao == 1)
            adicionarPessoas(proj1);
        if (opcao == 2)
            adicionarAtividade(proj1);
        if (opcao == 3)
            proj1->imprimir();
        if (opcao == 0)
            return 0;
    }

}
