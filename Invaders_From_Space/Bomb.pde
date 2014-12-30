import java.awt.geom.Rectangle2D;

class Bomb

{
  PImage al;
  float x, y, vel;
  Rectangle2D.Float hitbox;

  Bomb (PImage bomb)
  {
    al=bomb;
    vel = 0.5;
    x = random(10, 900);
    y = random(-500, 0);

    hitbox = new Rectangle2D.Float(x, y, bomb.width, bomb.height);
  }
  void display()
  {
    image(al, x, y);
  }

  void update()
  {
    y=y+velocity;
    hitbox.y = y;
  }
}

