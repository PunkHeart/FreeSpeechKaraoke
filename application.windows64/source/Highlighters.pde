class Highlighter { 
  float ypos, delay; 
  Highlighter (float y, float d) {  
    ypos = y; 
    delay = d; 
  }
  
//UPDATING NEW LINES ON SCREEN DURING SPEECH
  void update() {
    x = (millis()-restartTime-3000*delay)/4;
    blendMode(SUBTRACT);
    fill(150, 255, 150, 200);
    rect(x, ypos, 50000, 40); 
    blendMode(NORMAL);
  } 
  
//RESETTING HIGHLIGHTERS, TIMERS, ETC FOR EACH SCENE or PAGE
  void reset() {
    restartTime = millis();
  }
} 