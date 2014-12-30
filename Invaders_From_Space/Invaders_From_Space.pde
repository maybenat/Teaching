PImage stars;
PImage playa;
PImage alien;
PImage alien2;
PImage gold;
PImage virus;
PImage bomb;
int x;
int y;
ArrayList particles;
ArrayList particles2;
int numOnScreen = 0;
int numenemies = 0;
int lives = 5;
ArrayList lasers;
float velocity;
ArrayList enemies;
ArrayList healers;
ArrayList golders;
ArrayList viruses;
ArrayList bombers;
int numHealers = 0;
int numGolders = 0;
int numViruses = 0;
int numBombers = 0;
int score;
int speed, counter;

void setup()
{
  enemies = new ArrayList();
  stars = loadImage("MC Sky.png");
  size(stars.width, stars.height);
  playa = loadImage("spaceship.png");
  playa.resize(playa.width/3, playa.height/3);
  alien = loadImage("alian.png");
  alien.resize(50, 55);
  alien2 = loadImage("alien2.png");
  alien2.resize(50, 55);
  gold = loadImage("gold.png");
  gold.resize(50, 70);
  virus = loadImage("virus.png");
  virus.resize(50, 55);
  lasers = new ArrayList(); 
  particles = new ArrayList();
  particles2 = new ArrayList();
  healers = new ArrayList();
  golders = new ArrayList();
  viruses = new ArrayList();
  velocity = 0.5;
  score = 0;
  x = 500;
  y = 550;
  speed=9;
}

void draw()
{
  image(stars, 0, 0);
  image(playa, x, y);
  textSize(15);
  fill(255);
  textSize(20);
  text("Lives:" + lives, 50, 50);
  text("Score:" + score, 50, 100);

  if (keyPressed)
  {
    if (lives>=1)
    {
      if (key == ',' || keyCode == LEFT) 
      {
        if (x<0)
        {
          x=0;
        }
        else {
          x = x - speed;
        }
      }
      if (key == '.' || keyCode == RIGHT)
      {
        if (x>900)
        {
          x=900;
        }
        else {
          x = x + speed;
        }
      }
      if (key==' ')
      {
        if (numOnScreen < 60)
        {
          Laser l = new Laser(x+21);
          lasers.add(l);
          numOnScreen++;
        }
      }
    }
    if (lives<1)
    {
      if (keyPressed)
      {
        if (key == 'r')
        {
          lives = 5;
          numenemies = 0;
          numHealers = 0;
          numGolders = 0;
          numViruses = 0;
          numBombers = 0;
          lasers = new ArrayList();
          velocity = 0.5;
          score = 0;
          speed = 9;
        }
      }
    }
  }
  if (lives>=1)
  {
    for (int i = 0; i < lasers.size(); i++)
    {
      Laser l = (Laser) lasers.get(i);
      l.display();
      if (l.y < 0)
      {
        numOnScreen--;
        lasers.remove(i);
      }
      l.update();
    }
  }

  particles.add(new Particle(x+21, y+20));

  for (int i = 0; i < particles.size(); i++ ) {
    Particle p = (Particle) particles.get(i);
    p.run();
    p.yspeed += 0.1;
    p.display();
  }
  if (numenemies < 10)
  {
    numenemies++;
    enemies.add(new Enemy(alien));
  } 
  if (lives>=1)
  {
    for (int i = 0; i < enemies.size(); i++ ) {

      Enemy p = (Enemy) enemies.get(i);
      p.display();
      p.update();
      p.vel = velocity;
      if (p.y>550)
      {
        enemies.remove(i);
        numenemies--;
        lives--;
        velocity-=0.05;
      }
    }
  }
  //if(numenemies == 10 && num Bombers<1 && lives>=1)
  int rando4 = (int)random(0, 8000);
  if (rando4<10)
  {
    if (numenemies == 10 && numHealers<1 && lives>=1)
    {
      healers.add(new Special_Enemy(alien2));
      numHealers++;
      println(numHealers);
    }
  }
  int rando = (int)random(0, 8000);
  if (rando<10)
  {
    if (numenemies == 10 && numGolders<1 && lives>=1)
    {
      golders.add(new Gold(gold));
      numGolders++;
    }
  }
  if (lives>=1)
  {
    for (int i = 0; i < healers.size(); i++ ) {

      Special_Enemy p = (Special_Enemy) healers.get(i);
      p.display();
      p.update();
      if (p.x>1000)
      {
        healers.remove(i);
        numHealers--;
      }
    }
  }

  int rando2 = (int)random(0, 2000);
  if (rando2<10)
  {
    if (numenemies == 10 && numViruses<1 && lives>=1)
    {
      viruses.add(new Virus(virus));
      numViruses++;
    }
  }

  if (lives>=1)
  {
    for (int i = 0; i < viruses.size(); i++ ) {

      Virus p = (Virus) viruses.get(i);
      p.display();
      p.update();
      if (p.y>550)
      {
        speed = 1;
        viruses.remove(i);
        numViruses--;
      }
    }
  }
  if (lives>=1)
  {
    for (int i = 0; i < golders.size(); i++ ) {

      Gold p = (Gold) golders.get(i);
      p.display();
      p.update();
      if (p.x<-50)
      {
        golders.remove(i);
        numGolders--;
      }
    }
  }

  if (lives<1)
  {
    for (int i = 0; i < enemies.size(); i++ ) {
      enemies.remove(i);
    }

    for (int i = 0; i < lasers.size(); i++)
    {
      Laser l = (Laser) lasers.get(i);
      numOnScreen--;
      lasers.remove(i);
      l.update();
    }

    //PARTICLE STUFF
    particles2.add(new Particle2(x+21, y+10));
    for (int i = 0; i < particles2.size(); i++ ) {
      Particle2 p = (Particle2) particles2.get(i);
      p.run();
      p.yspeed += 0.1;
      p.display();
      textSize(30);
      text("GAME OVER", 350, 300);
      text("Press 'r' to restart", 400, 400);
    }
  }

  //check for collisions
  for (int i = enemies.size(); i > 0; i--) {
    for (int j = lasers.size(); j > 0; j--) {
      Laser l = (Laser)lasers.get(j - 1);
      Enemy e = (Enemy)enemies.get(i - 1);

      if (l.hitbox.intersects( e.hitbox)) { //get the two hitboxes and check for an intersection
        enemies.remove(e);
        score++;
        speed = speed+1;
        if (speed>9)
        {
          speed=9;
        }
        numenemies--;
        velocity+=0.05;
        break;
      }
    }
  }
  for (int i = golders.size(); i > 0; i--) {
    for (int j = lasers.size(); j > 0; j--) {
      Laser l = (Laser)lasers.get(j - 1);
      Gold e = (Gold)golders.get(i - 1);
      if (l.hitbox.intersects( e.hitbox)) { //get the two hitboxes and check for an intersection
        golders.remove(e);
        int rando3 = (int)random(3, 10);
        score = score+rando3;
        numGolders--;
        break;
      }
    }
  }
  for (int i = viruses.size(); i > 0; i--) {
    for (int j = lasers.size(); j > 0; j--) {
      Laser l = (Laser)lasers.get(j - 1);
      Virus e = (Virus)viruses.get(i - 1);
      if (l.hitbox.intersects( e.hitbox)) { //get the two hitboxes and check for an intersection
        viruses.remove(e);
        numViruses--;
        velocity-=0.5;
        if(velocity < 0)
        {
          velocity=0.5;
        }
        break;   
      }
    }
  }
  for (int i = healers.size(); i > 0; i--) {
    for (int j = lasers.size(); j > 0; j--) {
      Laser l = (Laser)lasers.get(j - 1);
      Special_Enemy e = (Special_Enemy)healers.get(i - 1);

      if (l.hitbox.intersects( e.hitbox)) { //get the two hitboxes and check for an intersection
        healers.remove(e);
        lives++;
        e.vel=velocity;
        e.vel+=0.3;
        numHealers--;
        break;
      }
    }
  }
}

