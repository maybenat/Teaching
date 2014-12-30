import java.awt.geom.Rectangle2D;

class Gold

{
  PImage al;
  float x, y, vel;
  Rectangle2D.Float hitbox;

  Gold (PImage gold)
  {
    al=gold;
    vel = 1;
    x = random(1000, 1050);
    y = random(100, 0);

    hitbox = new Rectangle2D.Float(x, y, alien.width, alien.height);
  }
  void display()
  {
    image(al, x, y);
  }

  void update()
  {
    x=x-velocity-.5;
    hitbox.x = x;
  }
}

