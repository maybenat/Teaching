class Particle 
{

  float x;
  float y;
  float xspeed;
  float yspeed;

  public Particle(int x2, int y2) 
  {
    x = x2;
    y = y2;
    xspeed = random(-2, 2);
    yspeed = random(1, 5);
  }

  void run()
  {
    x = x+xspeed;
    y = y+yspeed;
  }

  void display()
  {
    noStroke();
    fill(240, 151, 77);
    ellipse(x, y, 3, 3);
  }
}

