class Aliens
{
  int step = int(random(1, 5));
  //int speedX = 5;
  int x, y, speedX;
  int counter = 0;
  int countDir = 24;
  PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10;
  Aliens(int x, int y, int speedX)
  {
    this.x = x;
    this.y = y;
    this.speedX = speedX;
    img1 = loadImage("Images/Enemy/Enemy2_0.png");
    img2 = loadImage("Images/Enemy/Enemy2_1.png");
    img3 = loadImage("Images/Enemy/Enemy2_2.png");
    img4 = loadImage("Images/Enemy/Enemy2_3.png");
    img5 = loadImage("Images/Enemy/Enemy2_4.png");
    img6 = loadImage("Images/Enemy/Enemy2_5.png");
    img7 = loadImage("Images/Enemy/Enemy2_6.png");
    img8 = loadImage("Images/Enemy/Enemy2_7.png");
    img9 = loadImage("Images/Enemy/Enemy2_8.png");
    img10 = loadImage("Images/Enemy/Enemy2_9.png");
  }
  void render()
  {
    //draw an alien
    //fill(Aliens1); 
    //rect(x,y,30,10);
    move();
    spawn();
    colDetc();
    //shoot();
  }
  void spawn()
  {
    //y=100;
    //for(int i=0;i<2;i=i+1)
    //{
    //y=y-5;
    //rect(x,y,30,10);
    if (counter>=0 && counter<=40)
    {
      image(img1, x, y);
    } else if (counter>=40 && counter <= 80)
    {
      image(img2, x, y);
    } else if (counter>=80 && counter <= 120)
    {
      image(img3, x, y);
    } else if (counter>=120 && counter <= 160)
    {
      image(img4, x, y);
    } else if (counter>=160 && counter <= 200)
    {
      image(img5, x, y);
    } else if (counter>=200 && counter <= 240)
    {
      image(img6, x, y);
    } else if (counter>=240 && counter <= 280)
    {
      image(img7, x, y);
    } else if (counter>=280 && counter <= 320)
    {
      image(img8, x, y);
    } else if (counter>=320 && counter <= 360)
    {
      image(img9, x, y);
    } else if (counter>=360 && counter <= 400)
    {
      image(img10, x, y);
    } else
    {
      countDir = -countDir;
    }
    counter = counter + countDir; 
    //}
  }

  void move()
  {
    x = x + speedX;//*step;
    if (x >= 950)
    {
      speedX = -speedX;
      y+=50;
    }
    if (x <= 0)
    {
      speedX = -speedX;
      y+=50;
    }
    if (y > 1000)
    {
      //println("CRASHED");
      gameMode = dead;
      //setup();
    }
  }
  void shoot()
  {
    RailBullet.add(new EnemyBullet(this.x-50, this.y));
  }
  void colDetc()
  {
    color pixel;
    for (int i=0; i<50; i++)
    {
      for (int j=0; j<50; j++)
      {
        pixel=get(x+i, y+j);
        if (pixel == BulletCol)
        {
          //println("CRASHED");
          enemyState = FallenAngels;
          //setup();
        }
      }
    }
  }
}