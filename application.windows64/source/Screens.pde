void drawInputScreen() {
  background(0, 255, 0);
  fill(0);
  textSize(42);
  textAlign(CENTER);
  text("INPUT SCREEN", width/2, height/2);
}

void drawKillScreen() {
  background(255, 0, 0);
  fill(255);
  textFont(pf2);
  textSize(141);
  textAlign(CENTER);
  text("FREE SPEECH\nKARAOKE", width/2, height/2);
}

void drawCountdownScreen() {
  background(0);
  fill(255, 255, 0);
  textSize(42);
  textAlign(CENTER);
  text("COUNT DOWN", width/2, height/2);
}

void drawSpeechScreen() {
  background(0);
  //SHOW SPEECH NAME AT BOTTOM
  String displayName = speechName.replaceAll(".txt","");
  displayName = displayName.replaceAll("_"," ");
  fill(200, 200, 200, 300);
  textFont(pf2); // use pf as my font
  textSize(24); //font size
  textAlign(RIGHT); //text alignment
  text(displayName, width-100, height-50); 

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