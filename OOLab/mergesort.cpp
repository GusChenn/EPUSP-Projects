#include <iostream>
#include <math.h>
#include <vector>

using namespace std;

void Merge(vector<int> vetor, int inicio,int meio, int fim) {
  int n1 = meio - inicio + 1;
  int n2 = fim - meio;
  std::vector<int>* vetor = new vector;
  double E[n1+1], D[n2 + 1];
  for (int i = 0; i < n1; i++) {
    E[i] = vetor[inicio + i - 1];
  }
  for (int i = 0; i < n2; i++) {
    D[i] = vetor[meio + i];
  }
  E[n1 + 1] = 99999;
  D[n2 + 1] = 99999;

  int i = 1, j = 1;
  for (int k = inicio; k < fim; k++) {
    if (E[i] <= D[j]) {
      vetor[k] = E[i];
      i++;
    } else {
      vetor[k] = D[j];
      j++;
    }
  }
}

void Mergesort(double vetor[], int inicio, int fim) {
  int meio = floor((inicio + fim)/2);
  Mergesort(vetor, inicio, meio);
  Mergesort(vetor, meio + 1, fim);
  Merge(vetor, inicio, meio, fim);
}

int main() {
  int tamanho = 10;
  double V[tamanho];
  V[0] = 9;
  V[1] = 5;
  V[2] = 2;
  V[3] = 6;
  V[4] = 7;
  V[5] = 8;
  V[6] = 0;
  V[7] = 4;
  V[8] = 3;
  V[9] = 1;
  Mergesort(V, 0, tamanho);
  for (int i = 0; i < tamanho; i++) {
    std::cout << V[1] << " ";
  }
}
