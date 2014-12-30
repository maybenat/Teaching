void setup() {
  size(400, 400);
  fill(100, 200, 200);
}
void draw() {
  ellipse(mouseX+10, mouseY, 20, 5);
  ellipse(mouseX-10, mouseY, 20, 5);
  ellipse(mouseX, mouseY+10, 5, 20);
  ellipse(mouseX, mouseY-10, 5, 20);
}

