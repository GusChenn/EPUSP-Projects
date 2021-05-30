 /*
  A1 é a entrada do potenciometro = ptb1
  A0 é a entrada do lm35 = ptb0
  A2 é a saida do cooler = ptd4

  pino 8 = dir_1 = pta13
  pino 9 = dir_2 = ptd5
  pino 7 = rele = pta12
  

     The circuit:
 * LCD RS pin to digital pin 12
 * LCD Enable pin to digital pin 11
 * LCD D4 pin to digital pin 5
 * LCD D5 pin to digital pin 4
 * LCD D6 pin to digital pin 3
 * LCD D7 pin to digital pin 2
 * LCD R/W pin to ground
 * LCD VSS pin to ground
 * LCD VCC pin to 5V

 */


//Declaração de entradas
int dir_2 = 9;
int dir_1 = 8;
int rele = 7;
const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
float ventoinha = A2;
float entrada_lm = A0;
float pot = A1;
int alarme = 10;

//Declaração de variaveis
int t = 200;
float temp = 0.0;
float ref = 0.0;
float erro = 0.0;
float erro_ant = 0.0;
float acao = 0.0;
float acao_ant = 0.0;
float fan = 0.0;
float kp = 0.2;
float ki = 0.009;
int contador = 0;


//Seta o tempo do alarme
int tempo_para_alarme = 10;


#include <LiquidCrystal.h>
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);



void setup(){
  //Inicialização tela
  Serial.begin(9600);
  lcd.begin(16, 2);
  
  //Imputs e outputs
  pinMode(dir_1, OUTPUT);
  pinMode(dir_2, OUTPUT);
  pinMode(rele, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(alarme, OUTPUT);
  //A0 = entrada lm35
  //A1 = entrada potenciometro
  //A2 = saida da ventoinha
  
  //Saidas fixas
  digitalWrite(6, HIGH);
  digitalWrite(dir_1, HIGH);
  digitalWrite(dir_2, LOW);
  digitalWrite(rele, HIGH);
  

}

void loop(){

  //Leitura da temperatura
  temp = (float(analogRead(entrada_lm))*5/(1023))/0.01;

  //Ação da ventoinha
  ref = 0.2*analogRead(pot); //varia de 35 a 50
  erro = -(ref - temp);
  acao = acao_ant + kp*(erro - erro_ant) + ki*erro*t;
  
  if (acao > 0.8) {
    acao = 0.8;
  }

  else if (acao < 0) {
    acao = 0;
  }

  fan = acao + 0.2;
  analogWrite(ventoinha, (acao*1024));
  erro_ant = erro;
  acao_ant = acao;

  //liga/ desliga a resistencia
  if (temp >= ref) {
    digitalWrite(rele, LOW);
  }
  else {
    digitalWrite(rele, HIGH);
  }
  
  //Impressao na tela LCD
  lcd.setCursor(0, 0);
  lcd.print("Ref= ");
  lcd.print(ref);
  lcd.setCursor(0, 1);
  lcd.print("Temperatura=");
  lcd.print(temp);


  //impressao no Serial monitor
  Serial.print("Temperatura = ");
  Serial.println(temp);
  Serial.print("\n");
  Serial.print("Ref = ");
  Serial.print(ref);
  Serial.print("\n");
  Serial.print("Acao = ");
  Serial.print(acao);
  Serial.print("\n");
  Serial.print("Acao_ant = ");
  Serial.print(acao_ant);
  Serial.print("\n");
  
  //Alarme
  contador++; //cada contagem dura +- t
  if (contador == tempo_para_alarme) {
    tocarAlarme();
  }

  
  delay (t);
}

void tocarAlarme() {
  for (int i = 0; i < 5; i++) {
    tone(alarme, 440);
    delay(1000);
    noTone(alarme);
    delay(1500);
  }
}
