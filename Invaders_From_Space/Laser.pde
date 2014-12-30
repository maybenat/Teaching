import java.awt.geom.Rectangle2D;

class Laser
{
  int x, y;
  Rectangle2D.Float hitbox;

  Laser(int pos)
  {
    x = pos;
    y = 550;

    hitbox = new Rectangle2D.Float(x, y, 2, 2);
  }
  void display()
  {
    fill(0, 255, 210);
    rect(x, y, 2, 5);
  }

  void update()
  {
    y=y-3;
    hitbox.y = y;
  }
}

