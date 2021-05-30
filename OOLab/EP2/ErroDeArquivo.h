#include <string>
#include <stdexcept>

using namespace std;

#ifndef ERRODEARQUIVO_H
#define ERRODEARQUIVO_H

class ErroDeArquivo : public logic_error {
public:
  ErroDeArquivo(string mensagem);
  virtual ~ErroDeArquivo();

protected:
  string mensagem;
};

#endif
