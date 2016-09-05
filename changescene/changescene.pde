int currentScreen;
 
void setup() {
  size(500, 500);
  noStroke();
  smooth();
}
 
void draw() {
  switch(currentScreen) {
  case 0: drawKillScreen(); break;
  case 1: drawInputScreen(); break;
  case 2: drawCountdownScreen(); break;
  case 3: drawSpeechScreen(); break;
  default: background(0); break;
  }
}
 
void mousePressed() {
  currentScreen++;
  if (currentScreen > 3) { currentScreen = 0; }
}
 
void drawKillScreen() {
  background(255, 0, 0);
  fill(255);
  textSize(42);
  textAlign(CENTER);
  text("KILL SCREEN", width/2, height/2);
}
 
void drawInputScreen() {
  background(0, 255, 0);
  fill(0);
  textSize(42);
  textAlign(CENTER);
  text("INPUT SCREEN", width/2, height/2);
}
 
void drawCountdownScreen() {
  background(0);
  fill(255, 255, 0);
  textSize(42);
  textAlign(CENTER);
  text("COUNT DOWN", width/2, height/2);
}

void drawSpeechScreen() {
  background(0, 255, 255);
  fill(0);
  textSize(42);
  textAlign(CENTER);
  text("SPEECH", width/2, height/2);
   //SHOW SPEECH NAME AT TOP
  String displayName = speechName.replaceAll(".txt","");
  displayName = displayName.replaceAll("_"," ");
  fill(200, 200, 200, 300);
  textFont(pf2); // use pf as my font
  textSize(24); //font size
  textAlign(LEFT); //text alignment
  text(displayName, 100, 50); 

  //TEXT LINES
  if (whatChapter < numChapters) {
    if (whatChapter >=0){
    currentLine = allLines[whatChapter];
    textFont(pf2); // use pf as my font
    textSize(36); //font size
    textAlign(CENTER); //text alignment
    text(currentLine, width/2, 200); }
  else { 
    whatChapter = 0;//causes the text to infinitely loop -> replace with scene switch
  }
  
    //HIGHLIGHTERS
  
  h1.update(); 
  h2.update(); 
  h3.update(); 
  h4.update(); 
  h5.update(); 
  h6.update();
  }}