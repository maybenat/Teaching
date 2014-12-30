import java.awt.geom.Rectangle2D;

class Enemy

{
  PImage al;
  float x, y, vel;
  Rectangle2D.Float hitbox;

  Enemy (PImage alien)
  {
    al=alien;
    vel = 0.5;
    x = random(10, 900);
    y = random(-500, 0);

    hitbox = new Rectangle2D.Float(x, y, alien.width, alien.height);
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

