import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_4_pres_karaoke extends PApplet {

//FONTS
PFont pf, pf2; //these variables will be the fonts

//LIBRARIES
 // Needed for input textfield
ControlP5 cp5; // GUI stuff for input textfield

//SCENES
int currentScreen;

//TEXT CORPUS
String[] allLines; //this Array of strings will hold the current speech
int whatChapter = 0; //what chapter we are in during a speech
int numChapters = 0; //how many chapters are in a speech
String currentLine; //what line we are in a speech
String speechName = "Reagan_1989.txt"; //what speech we are using

//HIGHLIGHTERS
//each of these highlighters is for a new line of text - time permitting find a more ellegant way to do this?
float x, y, ypos, delay;//these floats control the highlighter position
Highlighter h1 = new Highlighter(166, 0.1f); //these are all individual highlighter for each line of text
Highlighter h2 = new Highlighter(210, 1); 
Highlighter h3 = new Highlighter(254, 2); 
Highlighter h4 = new Highlighter(298, 3); 
Highlighter h5 = new Highlighter(342, 4); 
Highlighter h6 = new Highlighter(386, 5); 

//TIMER
float restartTime = 0;

public void setup()
{

//WINDOW
  
  frameRate(30);
  noStroke();
  

//FONTS
  pf = loadFont("Gotham-Medium-96.vlw"); //these fonts must be in the data folder
  pf2 = loadFont("InfoText-SemiBold-96.vlw");
  

//TEXT CORPUS
//load the presidential speech text file, clean it up, but it in a String Array called "chapters"
  
  String[] raw = loadStrings(speechName);
 
  String cooked = "";
    for (int i = 0; i<raw.length; i++)
      {
        cooked+=raw[i]+"\n";
      }
      cooked = cooked.replaceAll("[^a-zA-Z0-9\r\n',.?\u2022 ]", " ");
      cooked = cooked.replaceAll("[\r]", "\n");
      cooked = cooked.trim().replaceAll(" +", " ");
  
  String[] chapters = cooked.split("\n\n");
    allLines = cooked.split("\n\n");
    currentLine = allLines[0];
    
  numChapters = chapters.length;
  println(chapters.length);  // how many chapters?
    println(numChapters); // view each one
  // printarray(chapters);
}

public void draw(){
  background(0);
 
//SCENES
//The specifics for what gets drawn in each of these scenes is in the "Scenes" tab above.
 
  switch(currentScreen) {
    case 0: drawKillScreen(); break;
    case 1: drawInputScreen(); break;
    case 2: drawCountdownScreen(); break;
    case 3: drawSpeechScreen(); break;
    default: background(0); break;
  }
}

public void mousePressed() {

//SWITCH SCENE on mouse click

  currentScreen++;
    if (currentScreen > 3) { currentScreen = 0; }
  
  whatChapter = 0; //Reset the speech so it starts at first line when use navigates to it
  h1.reset(); //Reset the highlighters
  h2.reset(); 
  h3.reset(); 
  h4.reset(); 
  h5.reset(); 
  h6.reset();
  
}

public void keyPressed() {

if (key == CODED){
  if (keyCode == RIGHT) {
    whatChapter++;
    } else if (keyCode == LEFT){ 
     //whatChapter = whatChapter-1;
     whatChapter--;
  }
  
  h1.reset(); //Reset the highlighters
  h2.reset(); 
  h3.reset(); 
  h4.reset(); 
  h5.reset(); 
  h6.reset();
  }
}
class Highlighter { 
  float ypos, delay; 
  Highlighter (float y, float d) {  
    ypos = y; 
    delay = d; 
  }
  
//UPDATING NEW LINES ON SCREEN DURING SPEECH
  public void update() {
    x = (millis()-restartTime-3000*delay)/4;
    blendMode(SUBTRACT);
    fill(150, 255, 150, 200);
    rect(x, ypos, 50000, 40); 
    blendMode(NORMAL);
  } 
  
//RESETTING HIGHLIGHTERS, TIMERS, ETC FOR EACH SCENE or PAGE
  public void reset() {
    restartTime = millis();
  }
} 
public void drawInputScreen() {
  background(0, 255, 0);
  fill(0);
  textSize(42);
  textAlign(CENTER);
  text("INPUT SCREEN", width/2, height/2);
}

public void drawKillScreen() {
  background(255, 0, 0);
  fill(255);
  textFont(pf2);
  textSize(141);
  textAlign(CENTER);
  text("FREE SPEECH\nKARAOKE", width/2, height/2);
}

public void drawCountdownScreen() {
  background(0);
  fill(255, 255, 0);
  textSize(42);
  textAlign(CENTER);
  text("COUNT DOWN", width/2, height/2);
}

public void drawSpeechScreen() {
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
  public void settings() {  size(1000, 600);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "sketch_4_pres_karaoke" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
