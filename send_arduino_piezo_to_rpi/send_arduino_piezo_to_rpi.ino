int btn0 = A0;
int btn1 = A1;
int btn2 = A2;
int btn3 = A3;
int btn4 = A4;
int btn5 = A5;
int btn0Val = 0;
int btn1Val = 0;
int btn2Val = 0;
int btn3Val = 0;
int btn4Val = 0;
int btn5Val = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  btn0Val = analogRead(btn0);
  btn1Val = analogRead(btn1);
  btn2Val = analogRead(btn2);
  btn3Val = analogRead(btn3);
  btn4Val = analogRead(btn4);
  btn5Val = analogRead(btn5);
  Serial.print(btn0Val);
  Serial.print("\t");
  Serial.print(btn1Val);
  Serial.print("\t");
  Serial.print(btn2Val);
  Serial.print("\t");
  Serial.print(btn3Val);
  Serial.print("\t");
  Serial.print(btn4Val);
  Serial.print("\t");
  Serial.print(btn5Val);
  Serial.println();
  delay(5);
}
