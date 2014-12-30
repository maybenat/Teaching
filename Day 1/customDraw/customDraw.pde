void setup() {
  size(400,400);
  smooth();
}

void draw() {
  fill(200,100,100,128);
  ellipse( mouseX, mouseY, random(40), random(40) );
}
