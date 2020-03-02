class Defender
{
  int x,y;
  int counter = 0;
  int countDir = 1;
  PImage img1;
  Defender(int x, int y)
  {
    this.x = x;
    this.y = y;
    img1 = loadImage("Images/Player.png");
    
  }
  
  void render()
  {
    //fill(0,0,255);
    if (counter>=0 && counter<=100)
    {
        image(img1,x,y);
    }
    else
    {
      countDir = -countDir;
    }
    counter = counter + countDir;  
    //triangle(x,y,x+40,y,x+20,y-20);
    colDetc();
    move();
  }
  void move()
  {
      if (key == CODED) 
  {
    if (keyCode == LEFT) 
    {
      Hero.x = Hero.x-= 5;//speed
    } else if (keyCode == RIGHT) 
    {
      Hero.x = Hero.x+= 5;//speed
    }
  }
  }
  void colDetc()
  {
     color pixel;
     for(int i=0;i<64;i++)
     {
       for(int j=0;j<20;j++)
       {
         pixel=get(x+i, y+j);
         if(pixel == Aliens1)
         {
           //println("CRASHED INTO DA HERO");
           gameMode = dead;
           setup();
         }
       }
     }
     if(this.x < 0)
     {
       this.x = 0;
     } else if (this.x > 960)
     {
       this.x = 960;
     }
     
  }
  
}