
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

#include <LiquidCrystal.h>

float Kp = 0.2;
float Ki = 0.009;
float fan_valor = 0;
int rele = 7;

int dir_1 = 8; //direção da ponte h
int dir_2 = 9;

float erro_ant = 0;
float erro = 0;

float acao = 0;
float acao_ant = 0;

float temp = 0;
float ref = 0;

const int rs = 12, en = 11, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);

void setup() {
  pinMode(6, OUTPUT);
  digitalWrite(6, HIGH);
  pinMode(dir_1, OUTPUT);
  digitalWrite(dir_1, HIGH);
  pinMode(dir_2, OUTPUT);
  digitalWrite(dir_2, LOW);
  pinMode(rele, OUTPUT);

  lcd.begin(16, 2);
  
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

 lcd.setCursor(0, 1);
 lcd.print("Ref= ");
 lcd.print(ref);

 lcd.setCursor(1, 1);
 lcd.print("Temp= ");
 lcd.print(temp);
}
