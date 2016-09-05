//FONTS
PFont pf, pf2; //these variables will be the fonts
PFont inputFont;

//IMAGES
PImage photo;
int img = 1;
float imgRatio;
float screenRatio;

//LIBRARIES
import java.io.File;
import controlP5.*; // Needed for input textfield
ControlP5 cp5; // GUI stuff for input textfield

//SCENES
int currentScreen = 0;

//TEXT CORPUS
String[] allLines; //this Array of strings will hold the current speech
int whatChapter = 0; //what chapter we are in during a speech
int numChapters = 0; //how many chapters are in a speech
String currentLine; //what line we are in a speech
String speechName = "reagan_1989.txt"; //what speech we are using

//HIGHLIGHTERS
//each of these highlighters is for a new line of text - time permitting find a more ellegant way to do this?
float x, y, ypos, delay;//these floats control the highlighter position
Highlighter h1 = new Highlighter(167, 0.1); //these are all individual highlighter for each line of text
Highlighter h2 = new Highlighter(210, 1); 
Highlighter h3 = new Highlighter(254, 2); 
Highlighter h4 = new Highlighter(298, 3); 
Highlighter h5 = new Highlighter(342, 4); 
Highlighter h6 = new Highlighter(386, 5); 

//TIMER
float restartTime = 0;

//INPUT
String speechPresident;
String speechYear;
String readerName;
String speechError = " ";

void setup() {

  //WINDOW
  size(displayWidth, displayHeight); //Fullscreen
  surface.setResizable(true);
  //fullScreen();
  frameRate(30);
  noStroke();
  smooth();

  //FONTS
  pf = loadFont("Gotham-Medium-96.vlw"); //these fonts must be in the data folder
  pf2 = loadFont("InfoText-SemiBold-96.vlw");
  inputFont= createFont("Gotham-Medium-96.vlw", 20);//this font is only for the input textfields

  //INPUT
  cp5 = new ControlP5(this);

  cp5.addTextfield("president")
    .setPosition(width/2 -300, height/2)
    .setSize(150, 50)
    .setAutoClear(false)
    .setColor(color(0))//inputted text color
    .setColorActive(color(0))//border color when ckicked on
    .setColorForeground(color(255))//border color when not clicked on
    .setColorBackground(color(255))//input field bg color
    .setFont(inputFont)
    ;

  cp5.addTextfield("year")
    .setPosition(width/2 -125, height/2)
    .setSize(150, 50)
    .setAutoClear(false)
    .setColor(color(0))//inputted text color
    .setColorActive(color(0))//border color when ckicked on
    .setColorForeground(color(255))//border color when not clicked on
    .setColorBackground(color(255))//input field bg color
    .setFont(inputFont)
    ;          

  cp5.addTextfield("reader")
    .setPosition(width/2 +50, height/2)
    .setSize(150, 50)
    .setAutoClear(false)
    .setColor(color(0))//inputted text color
    .setColorActive(color(0))//border color when ckicked on
    .setColorForeground(color(255))//border color when not clicked on
    .setColorBackground(color(255))//input field bg color
    .setFont(inputFont)
    .setCaptionLabel("Your Name")
    ;

  cp5.addBang("Submit")
    .setPosition(width/2 +225, height/2 +10)
    .setSize(30, 30)
    .setColorActive(color(0))//border color when ckicked on
    .setColorForeground(color(255, 0, 0))//border color when not clicked on
    .setColorBackground(color(255, 0, 0))//input field bg color
    .setFont(inputFont)
    .setCaptionLabel(">")
    .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
    //.setLabelVisible(false)
    ;
}


void draw() {
  background(0);

  //SCENES
  //The specifics for what gets drawn in each of these scenes is in the "Scenes" tab above.
  switch(currentScreen) {
  case 0: 
    drawKillScreen(); 
    break;
  case 1: 
    drawInputScreen(); 
    break;
  case 2: 
    drawCountdownScreen(); 
    whatChapter = 0; //Reset the speech so it starts at first line when use navigates to it
    h1.reset(); //Reset the highlighters
    h2.reset(); 
    h3.reset(); 
    h4.reset(); 
    h5.reset(); 
    h6.reset();
    break;
  case 3: 
    drawSpeechScreen(); 
    break;
  default: 
    background(0); 
    break;
  }

  //INPUT VISIBILITY
  if (currentScreen == 1) {
    cp5.show();
  } else { 
    cp5.hide();
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) { 
    currentScreen++; 
    if (currentScreen > 3) { 
      currentScreen = 0;
    }
  }
}


void keyPressed() {
  if (currentScreen == 3) {
    if (key == CODED) {
      if (keyCode == RIGHT) {
        whatChapter++;
      } else if (keyCode == LEFT) { 
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
}