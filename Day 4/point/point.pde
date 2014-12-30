PImage img;

void setup() {
  img = loadImage("turtle.jpg");
  size(img.width, img.height);
  smooth();
}

void draw() {
//  for (int i = 0; i < 20; i=i+1) {
    float x = (int)random(width);
    float y = (int)random(height);
    int loc = (int)(x + y*img.width);

    loadPixels();
    float r = red(img.pixels[loc]);
    float g = green(img.pixels[loc]);
    float b = blue(img.pixels[loc]);

    noStroke();
    fill(r, g, b, 100);
    ellipse(x, y, 8, 8);
//  }
}

