import controlP5.*;

ControlP5 cp5;

String speechName;
String speechPresident;
String speechYear;
String performerName;

void setup() {
  size(700, 700);

  cp5 = new ControlP5(this);

  cp5.addTextfield("president").setPosition(400, 400).setSize(100, 50).setAutoClear(false);
  cp5.addTextfield("year").setPosition(400, 460).setSize(100, 50).setAutoClear(false);
  cp5.addTextfield("performer").setPosition(400, 520).setSize(100, 50).setAutoClear(false);
  cp5.addBang("Submit").setPosition(520, 400).setSize(100, 50);
}

void draw() {
  background(150);
}

void Submit() {
  println();
  print("this is the text you typed: ");
  speechPresident=cp5.get(Textfield.class, "president").getText();
  speechYear=cp5.get(Textfield.class, "year").getText();
  performerName=cp5.get(Textfield.class, "performer").getText();
  speechName=speechPresident + "_" + speechYear + ".txt";
  speechName=speechName.toLowerCase();
  print(speechName + "performed by " + performerName);
}