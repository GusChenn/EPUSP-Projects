#include "ErroDeArquivo.h"

ErroDeArquivo::ErroDeArquivo(string mensagem) : logic_error(mensagem) {}

ErroDeArquivo::~ErroDeArquivo() {}
