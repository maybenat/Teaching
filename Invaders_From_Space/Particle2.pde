class Particle2 {

  float x;
  float y;
  float xspeed;
  float yspeed;

  public Particle2(int x2, int y2) {
    x = x2;
    y = y2;
    xspeed = random(-2, 2);
    yspeed = random(-5, 5);
  }

  void run()
  {
    x = x+xspeed;
    y = y+yspeed;
  }

  void display()
  {
    noStroke();
    fill(0, 255, 0);
    ellipse(x, y, 5, 5);
  }
}

