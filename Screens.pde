void drawInputScreen() {
  background(0, 255, 0);
  fill(0);
  textSize(42);
  textAlign(CENTER);
  text("NEXT SPEECH:", width/2, height/2 - 72);
  fill(255,0,0);
  textSize(22);
  textAlign(CENTER);
  text(speechError, width/2, height/2 - 15);
}

void drawKillScreen() {
  background(255, 0, 0);
  fill(255);
  textFont(pf2);
  textSize(141);
  textAlign(CENTER);
  text("FREE SPEECH\nKARAOKE", width/2, height/2 - 75);
}

void drawCountdownScreen() {

  imageMode(CENTER);
  if (img < 6){
  photo = loadImage(sketchPath("data/reagan_" + img + ".jpg"));
  imgRatio = (photo.height / photo.width);
  screenRatio = (height/width);
  println(imgRatio);
  println(screenRatio);
  if (imgRatio >= screenRatio){
    image(photo, width/2, height/2, width, width*imgRatio)
   ;} else {
  image(photo, width/2, height/2, height*imgRatio, height);
}
    
  //img++;
  if (img==6) {img=1;}
  fill(255, 255, 0);
  textSize(42);
  textAlign(CENTER);
  text("COUNT DOWN", width/2, height/2);
}}

void drawSpeechScreen() {
  background(0);
  
//TEXT CORPUS
//load the presidential speech text file, clean it up, but it in a String Array called "chapters"
  
  String[] raw = loadStrings(speechName);
 
  String cooked = "";
    for (int i = 0; i<raw.length; i++){cooked+=raw[i]+"\n";}
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