class Asteroids
{
  int x,y;
  Asteroids(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  void render()
  {
    //draw an alien
    fill(Asteroids); 
    ellipse(x,y,30,30); 
    move();
  }
  
  void move()
  {
    int step = int(random(7.0)) - 3;
    x = x+step;
    y = y+2;
    if(y > 150)
    {
      step = step/2 - step;
      x = x-step*2;
      y = y-step*2;
    }
    else if (y > 250)
    {
      step = step*2 +step;
      x = x+step*2;
      y = y+step*2;
    }
    else if (y > 350)
    {
      step = step/2 - step;
      x = x-step*2;
      y = y-step*2;
    }
    else if (y > 450)
    {
      step = step*2 +step;
      x = x+step*2;
      y = y+step*2;
    }
    else if (y > 550)
    {
      step = step/2 - step;
      x = x-step*2;
      y = y-step*2;
    }
  }
}