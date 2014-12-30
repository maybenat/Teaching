int[] xpos = new int[50]; 
int[] ypos = new int[50];
int x, y;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  background(0);
  // Shift array values
  for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  // New location
  xpos[xpos.length-1] = mouseX; 
  ypos[ypos.length-1] = mouseY;

  for (int i = 0; i < xpos.length; i ++ ) 
  {
    // Draw an ellipse for each element in the arrays. 
    noStroke();
    fill(255-i*5, 255-i*2, 255-i);
    ellipse(xpos[i], ypos[i], i, i);
  }
}

