class EnemyBullet
{
  //boolean enemyHit = false;
  int x,y;  
  EnemyBullet(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  void render()
  {
    noStroke();
    fill(EnemyBulCol);
    rect(x,y,5,20);
    colDetc();
  }
  void move()
  {
    //int shotIncrement = 1000;
    int shotSpeed = 10; //int (random(10));//+20;  
    this.y += shotSpeed;
    if(this.y > 1000 || this.y < 0)
    {
      RailBullet.remove(this);
    }
  }
  void colDetc()
  {
    color pixel;
    for (int i=0; i<20; i++)
    {
      for (int j=0; j<5; j++)
      {
        pixel=get(x+i, y+j);
        if (pixel == HeroCol)
        {
          println(lives);
          lives--;
          if(lives == 0)
          {
            gameMode = dead;
          }
          //setup();
        }
      }
    }
  }
}