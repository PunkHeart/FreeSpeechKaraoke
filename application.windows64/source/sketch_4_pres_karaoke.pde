//FONTS
PFont pf, pf2; //these variables will be the fonts

//LIBRARIES
import controlP5.*; // Needed for input textfield
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
Highlighter h1 = new Highlighter(166, 0.1); //these are all individual highlighter for each line of text
Highlighter h2 = new Highlighter(210, 1); 
Highlighter h3 = new Highlighter(254, 2); 
Highlighter h4 = new Highlighter(298, 3); 
Highlighter h5 = new Highlighter(342, 4); 
Highlighter h6 = new Highlighter(386, 5); 

//TIMER
float restartTime = 0;

void setup()
{

//WINDOW
  size(1000, 600);
  frameRate(30);
  noStroke();
  smooth();

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
      cooked = cooked.replaceAll("[^a-zA-Z0-9\r\n',.?• ]", " ");
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

void draw(){
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

void mousePressed() {

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

void keyPressed() {

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