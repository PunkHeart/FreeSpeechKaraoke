PImage photo;

void setup() {
  size(100, 100);
  photo = loadImage("reagan_1.jpg");
}

void draw() {
  image(photo, 0, 0);
}