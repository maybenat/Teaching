import java.awt.geom.Rectangle2D;

class Virus

{
  PImage al;
  float x, y, vel;
  Rectangle2D.Float hitbox;

  Virus (PImage virus)
  {
    al=virus;
    vel = 1;
    x = random(10, 900);
    y = random(-800, -400);

    hitbox = new Rectangle2D.Float(x, y, alien.width, alien.height);
  }
  void display()
  {
    image(al, x, y);
  }

  void update()
  {
    y=y+velocity+.5;
    hitbox.y = y;
  }
}

