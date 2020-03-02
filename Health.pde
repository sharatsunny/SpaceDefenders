class Health
{
  int x, y;
  int counter = 0;
  int countDir = 24;
  PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10,
  img11, img12, img13, img14, img15, img16, img17, img18, img19, img20,
  img21, img22, img23, img24, img25, img26, img27, img28, img29, img30, img31;
  
  Health(int x, int y)
  {
    this.x = x;
    this.y = y;
    img1 = loadImage("Images/Player_Lives/Lives_0.png");
    img2 = loadImage("Images/Player_Lives/Lives_1.png");
    img3 = loadImage("Images/Player_Lives/Lives_2.png");
    img4 = loadImage("Images/Player_Lives/Lives_3.png");
    img5 = loadImage("Images/Player_Lives/Lives_4.png");
    img6 = loadImage("Images/Player_Lives/Lives_5.png");
    img7 = loadImage("Images/Player_Lives/Lives_6.png");
    img8 = loadImage("Images/Player_Lives/Lives_7.png");
    img9 = loadImage("Images/Player_Lives/Lives_8.png");
    img10 = loadImage("Images/Player_Lives/Lives_9.png");
    img11 = loadImage("Images/Player_Lives/Lives_10.png");
    img12 = loadImage("Images/Player_Lives/Lives_11.png");
    img13 = loadImage("Images/Player_Lives/Lives_12.png");
    img14 = loadImage("Images/Player_Lives/Lives_13.png");
    img15 = loadImage("Images/Player_Lives/Lives_14.png");
    img16 = loadImage("Images/Player_Lives/Lives_15.png");
    img17 = loadImage("Images/Player_Lives/Lives_16.png");
    img18 = loadImage("Images/Player_Lives/Lives_17.png");
    img19 = loadImage("Images/Player_Lives/Lives_18.png");
    img20 = loadImage("Images/Player_Lives/Lives_19.png");
    img21 = loadImage("Images/Player_Lives/Lives_20.png");
    img22 = loadImage("Images/Player_Lives/Lives_21.png");
    img23 = loadImage("Images/Player_Lives/Lives_22.png");
    img24 = loadImage("Images/Player_Lives/Lives_23.png");
    img25 = loadImage("Images/Player_Lives/Lives_24.png");
    img26 = loadImage("Images/Player_Lives/Lives_25.png");
    img27 = loadImage("Images/Player_Lives/Lives_26.png");
    img28 = loadImage("Images/Player_Lives/Lives_27.png");
    img29 = loadImage("Images/Player_Lives/Lives_28.png");
    img30 = loadImage("Images/Player_Lives/Lives_29.png");
    img31 = loadImage("Images/Player_Lives/Lives_30.png");
    img1.resize(50,50);
    img2.resize(50,50);
    img3.resize(50,50);
    img4.resize(50,50);
    img5.resize(50,50);
    img6.resize(50,50);
    img7.resize(50,50);
    img8.resize(50,50);
    img9.resize(50,50);
    img10.resize(50,50);
    img11.resize(50,50);
    img12.resize(50,50);
    img13.resize(50,50);
    img14.resize(50,50);
    img15.resize(50,50);
    img16.resize(50,50);
    img17.resize(50,50);
    img18.resize(50,50);
    img19.resize(50,50);
    img20.resize(50,50);
    img21.resize(50,50);
    img22.resize(50,50);
    img23.resize(50,50);
    img24.resize(50,50);
    img25.resize(50,50);
    img26.resize(50,50);
    img27.resize(50,50);
    img28.resize(50,50);
    img29.resize(50,50);
    img30.resize(50,50);
    img31.resize(50,50);
  }
  void render()
  {
    //draw an alien
    //fill(Aliens1); 
    //rect(x,y,30,10);
    spawn();
  }
  void spawn()
  {
    //y=100;
    //for(int i=0;i<2;i=i+1)
    //{
    //y=y-5;
    //rect(x,y,30,10);
    if (counter >= 0 && counter <= 40)
    {
      image(img1, x, y);
    } else if (counter>=0 && counter <= 40)
    {
      image(img2, x, y);
    } else if (counter>=40 && counter <= 80)
    {
      image(img3, x, y);
    } else if (counter>=80 && counter <= 120)
    {
      image(img4, x, y);
    } else if (counter>=120 && counter <= 160)
    {
      image(img5, x, y);
    } else if (counter>=160 && counter <= 200)
    {
      image(img6, x, y);
    } else if (counter>=200 && counter <= 240)
    {
      image(img7, x, y);
    } else if (counter>=240 && counter <= 280)
    {
      image(img8, x, y);
    } else if (counter>=280 && counter <= 320)
    {
      image(img9, x, y);
    } else if (counter>=320 && counter <= 360)
    {
      image(img10, x, y);
    } else if (counter>=360 && counter <= 400)
    {
      image(img11, x, y);
    } else if (counter>=400 && counter <= 440)
    {
      image(img12, x, y);
    } else if (counter>=440 && counter <= 480)
    {
      image(img13, x, y);
    } else if (counter>=480 && counter <= 520)
    {
      image(img14, x, y);
    } else if (counter>=520 && counter <= 560)
    {
      image(img15, x, y);
    } else if (counter>=560 && counter <= 600)
    {
      image(img16, x, y);
    } else if (counter>=600 && counter <= 640)
    {
      image(img17, x, y);
    } else if (counter>=640 && counter <= 680)
    {
      image(img18, x, y);
    } else if (counter>=680 && counter <= 720)
    {
      image(img19, x, y);
    } else if (counter>=720 && counter <= 760)
    {
      image(img20, x, y);
    } else if (counter>=760 && counter <= 800)
    {
      image(img21, x, y);
    } else if (counter>=800 && counter <= 840)
    {
      image(img22, x, y);
    } else if (counter>=840 && counter <= 880)
    {
      image(img23, x, y);
    } else if (counter>=880 && counter <= 920)
    {
      image(img24, x, y);
    } else if (counter>=920 && counter <= 960)
    {
      image(img25, x, y);
    } else if (counter>=960 && counter <= 1000)
    {
      image(img26, x, y);
    } else if (counter>=1000 && counter <= 1040)
    {
      image(img27, x, y);
    } else if (counter>=1040 && counter <= 1080)
    {
      image(img28, x, y);
    } else if (counter>=1080 && counter <= 1120)
    {
      image(img29, x, y);
    } else if (counter>=1120 && counter <= 1160)
    {
      image(img30, x, y);
    } else if (counter>=1160 && counter <= 1200)
    {
      image(img31, x, y);
    } else
    {
      countDir = -countDir;
    }
    counter = counter + countDir; 
    //}
  }
}