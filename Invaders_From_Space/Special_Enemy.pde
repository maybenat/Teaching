import java.awt.geom.Rectangle2D;

class Special_Enemy

{
  PImage al;
  float x, y, vel;
  Rectangle2D.Float hitbox;

  Special_Enemy (PImage alien2)
  {
    al=alien2;
    vel = 1;
    x = random(-50, -100);
    y = random(100, 0);

    hitbox = new Rectangle2D.Float(x, y, alien.width, alien.height);
  }
  void display()
  {
    image(al, x, y);
  }

  void update()
  {
    x=x+velocity+.5;
    hitbox.x = x;
  }
}

