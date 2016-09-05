int x,x2,y,w,h;
PImage photo;
 
float time = millis();
 
void setup() {
  size(displayWidth, displayHeight); //Fullscreen
  surface.setResizable(true);
  photo = loadImage("reagan_1.jpg");
}
 
void draw() {
  image(photo, 0, 0);
  
  time = millis() - time;
  if(time < 10000) {
    load();
  } else { 
    startup();
  }
}
 
void load() {
  
      background(0);
      fill(255);
      textSize(60);
      textAlign(CENTER);
  text("Loading speechName read by readerName", width/2, height/2 - 50);
      textSize(20);
      fill(102,151,234);
      stroke(0);
  rect(width/4 + x, height/2, 50 ,100);//moving bar
      fill(0);
      noFill();
      stroke(255);
  rect(width/4, height/2 , width/2 ,100);//loading rect background
      for(x = x + 5; x > (width/2 - 50); x = 10);
}

void startup() {
  background(0); //The void color
  fill(108, 32, 137);
  rect(width/2 - 5000, height/2 - 5000, 10000, 10000);
  noLoop();
}