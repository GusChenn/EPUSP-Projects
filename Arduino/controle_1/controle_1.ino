float Kp = 0.2;
float Ki = 0.009;
int fan = 3;
float fan_valor = 0;
int rele = 4;

int dir_1 = 1; //direção da ponte h
int dir_2 = 2;

float erro_ant = 0;
float erro = 0;

float acao = 0;
float acao_ant = 0;

float temp = 0;
float ref = 0;

void setup() {
  pinMode(7, OUTPUT);
  pinMode(dir_1, OUTPUT);
  pinMode(dir_2, OUTPUT);
  pinMode(fan, OUTPUT);
  pinMode(rele, OUTPUT);
  
}

void loop() {
 ref = (100*analogRead(A1)) + 35;
 temp = (analogRead(A0) * 330.0);
 erro = -(ref - temp);
 acao = acao_ant + Kp*(erro - erro_ant) + Ki * 0.2 * erro;
 if (acao < 0.8) {
  acao = 0.8;
 }

 else if (acao < 0) {
  acao = 0;
 }

 fan_valor = acao + 0.2;
 analogWrite(A2, fan_valor);
 erro_ant = erro;
 acao_ant = acao;
}
