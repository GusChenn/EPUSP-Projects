// Este programa considera que todas as entradas foram inseridas corretamente 

const prompt = require('prompt-sync')(); // modulo que permite a obtenção de dados pelo prompt

// retorna um array do mesmo tamanho que o array hexa com os valore convertidos para decimal
function hexaPdecimalArray (hexa) {
    var decimal = [];
    for (var i = 0; i < hexa.length; i++) {
        decimal[i] = parseInt(hexa[i], 16);
    }
    return decimal;
}

function hexaPdecimal (hexa) {
    var decimal = 0;
    decimal = parseInt(hexa, 16);
    return decimal;
}

// retorna um array do mesmo tamanho que o array hexa com os valore convertidos para binario
function hexaPbinarioArray (hexa){
    var binario = [];
    for (var i = 0; i < hexa.length; i++) {
        binario[i] = ("00000000" + (parseInt(hexa[i], 16)).toString(2)).substr(-8);
    }
    return binario;
}

// calcula a posicao apontada pela operacao de enderecamento e a salva em ptrEndereco
// 1. remove o @ do comando
// 2. converte o comando de hexa para decimal
// 3. salva em ptrEndereco
function enderecamento (comando) {
    comandoAux = comando;

    // comandoAux salva a posicao da memoria que deve ser enderecada
    comandoAux = comandoAux.substring(1, 4);
    // console.log(comandoAux); // para testes
    return hexaPdecimal(comandoAux);
    // console.log(ptrEndereco); // para testes
}

// lista as posicoes de memoria entre os dois enderecos hexa especificados
// 1. converte as duas posicoes hexa para decimal
// 2. imprime a memoria entre os dois enderecos especificados
function listagem (memoria, dados) {
    let poscioes = [];
    posicoes = hexaPdecimalArray(dados);
    let inicio = posicoes[0];
    let fim = posicoes[1];
    let arrayAux = [];
    //console.log(inicio + ', ' + fim); // para testes

    // imprime blocos de 32 bits. Mesmo que não siga as especificações do programa, isso facilita a análise final.
    for (let i = inicio; i < fim; i = i + 32) {
        for (let j = 0; j < 32; j++) {
            arrayAux[j] = memoria[i + j];
        }
        console.log(arrayAux);
    }
}

// realiza a insercao de dados na memoria.
// 1. le os dados hexadecimais passados como argumentos no console
// 2. realiza sua devida conversao para binario
// 3. armazena as palavras binárias na memória a partir do endereco apontado pelo ponteiro ptrEndereco
function insercao (leitura, ptrEndereco, memoria) {
    var palavraCompleta = '';
    let Memoria = memoria;
    // realiza a conversao dos dados hexa para binario e os armazena em um array onde cada posicao é um valor binario
    let dadosBin = hexaPbinarioArray(leitura);

    // concatena todas as palavras binarias em uma unica variavel
    for (let i = 0; i < dadosBin.length; i++) {
        palavraCompleta += dadosBin[i];
    }

    // quebra a palavra completa bit a bit, criando um novo array de bits
    palavraCompleta = palavraCompleta.split('');
    // realiza a insercao dos bits na memoria
    for (let i = 0; i < palavraCompleta.length; i++) {
        Memoria[ptrEndereco + i] = palavraCompleta[i];
    }

    return Memoria;
}

function zeraMemoria () {
    var memoriaZerada = [];
    for (let i = 0; i < 4096; i++) {
        memoriaZerada[i] = '0';
    }
    return memoriaZerada;
}

function execucao (dados) {
    console.log('Executa o programa na memoria a partir do endereco ' + dados);
}


// inicio bloco main
var comando = '';
var leitura = [];
var dados = [];
var memoria = []; // decalracao da memoria. Não é declarado, mas possui 4096 posições. 
var ptrEndereco = 0;

// zera a memorai para facilitar sua analise
memoria = zeraMemoria();

while (comando != '@@') {          // fica no loop até receber instrução de saida
    // realiza a leitura da sintrução e extrai o comando e os dados do comando
    leitura = prompt('$ ');

    // obtem os parametros lidos em um array
    leitura = leitura.split(' ');

    // obtem o comando (primeiro parametro da leitura)
    comando = leitura[0];
    
    // obtem os dados (demais parametros da leitura) sem alterar a variavel leitura
    for (let i = 0; i < leitura.length; i++) {
        dados[i] = leitura[i];
    }
    dados.shift();

    //console.log(dados); //para testes

    // realiza a seleção da operação
    if (comando.charAt(0) === '@' && comando != '@@') {
        ptrEndereco = enderecamento(comando);
    } else if (comando === 'L') {
        listagem(memoria, dados);
    } else if (comando === 'X') {
        execucao(dados);
    } else if (comando != '@@') {
        memoria = insercao(leitura, ptrEndereco, memoria);
    }
}

// fim bloco main