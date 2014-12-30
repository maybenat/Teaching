int radius = 30;

float floatX = -radius;
float floatSpeed = 1.2;

int intX = -radius;
int intSpeed = 1;

void setup()
{
  size(340, 220);
  smooth();
}

void draw()
{
  background(0);
  
  //my ellipse that uses float on top
  floatX = floatX + floatSpeed; //increase value of x
  ellipse(floatX, 30, radius, radius);
  
 //my ellipse that uses int on bottom
  intX = intX + intSpeed;
  ellipse(intX, 90, radius, radius);
}
