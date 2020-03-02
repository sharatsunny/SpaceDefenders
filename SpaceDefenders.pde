int shot;
int counter = 0;
int lives = 500;
int newLives = lives/100;
int level = 1;
float maxFireRate = .9995;

//2d array variables for enemies
int col= 15;
int row = 5;
int newRow = 0;
int newCol = 0;

//score variables
int enemiesNullifiedCounter = 0;
int maxEnemyCount = col * row;
int score;
int newScore;

//variables for color detection
final color Asteroids = color (255, 170, 0);
final color Aliens1 = color (0, 166, 221);
final color BulletCol = color (255, 255, 0);
final color EnemyBulCol = color (255, 0, 255);
final color HeroCol = color (179, 179, 179);

//game state variables
final int Intro = 0;
final int playing = 1;
final int dead = 2;
final int levelClear = 3;
final int victory = 4;
int gameMode = Intro;

//enemy state variables used in 2D array
final int AliveAngels = 0;
final int FallenAngels = 1;
int enemyState = AliveAngels;

//initializing other classes
Defender Hero;
Health HP1;
Health HP2;
Health HP3;
Health HP4;
Health HP5;
ArrayList<Bullet> Beams = new ArrayList<Bullet>();
ArrayList<EnemyBullet> RailBullet = new ArrayList<EnemyBullet>();
Aliens[][] Angels =  new Aliens[col][row];


void setup()
{ 
  int shot = 10;

  size(1000, 1000);  

  //initialize the hero location
  Hero = new Defender(925, 925);
  scale(0.5);
  HP1 = new Health(880, 5);
  HP2 = new Health(835, 5);
  HP3 = new Health(790, 5);
  HP4 = new Health(745, 5);
  HP5 = new Health(700, 5);
  //initialize the enemy locations
  for (int i = 0; i < col; i++) 
  {
    for (int j = 0; j < row; j++) 
    {      
      Angels[i][j] = new Aliens (i*50, j*50, 5*level);
    }
  }

  //initialize the very first bullet to be used as arrays
  for (int i = 0; i < shot; i++)
  {
    Beams.add(new Bullet(Hero.x+1, Hero.y-90050));
    Beams.add(new Bullet(Hero.x+50, Hero.y-90050));
  }
}

void draw()
{
  if (gameMode == Intro)
  {
    waitForStart();
  } else if (gameMode == playing)
  {
    startLevel1();
  } else if (gameMode == dead)
  {
    gameOver();
  } else if (gameMode == levelClear)
  {
    reset();
  } else if (gameMode == victory)
  {
    winScreen();
  }
  //keyPressed();
  //reset();
}

void waitForStart()
{
  background(0, 0, 0);
  String introText = "SpaceDefenders!";
  String ButtonToStart = "Press S to start";
  textSize(40);
  fill(255, 255, 255);
  text(introText, 330, 450);
  text(ButtonToStart, 270, 500);
  if (keyPressed) 
  {
    if (key == 'S' || key == 's')
    {
      gameMode = playing;
    }
  }
}

void startLevel1()
{
  String LivesRem = "HP: ";
  String LivesNum = lives + "";
  String justALine = "---";
  String MaxLives = "500";
  String Score = "Score: "+ score;
  //int newx = int(random(20,530));
  //int newy = int(random(20,250));
  background(0, 0, 0); //background white
  textSize(40);
  fill(255, 255, 255);
  text(Score, 20, 50);
  textSize(35);
  text(LivesRem, 645, 45);
  textSize(25);
  text(LivesNum, 930, 31);
  text(justALine, 930, 40);
  text(MaxLives, 930, 53);

  //Render Hero
  Hero.render();
  //Handlers for longer codes
  LivesHandler();
  PlayerBulletHandler();
  EnemyBulletHandler();
  EnemyHandler();

  //do not end the game until all the bullets are gone, this stops the enemies in next level from dying early
  if (enemiesNullifiedCounter == maxEnemyCount && Beams.size() == 0)
  {
    for (int i = 0; i < Beams.size(); i ++)
    {
      Beams.remove(i);
    }
    enemiesNullifiedCounter = 0;
    gameMode = victory;
    level++;
    println("Win");
  }
}

void LivesHandler()
{
  if (HP1 != null || HP2 !=null || HP3 != null || HP4 != null || HP5 != null)
  {
    if (lives >= 401 && lives <= 500)
    {
      HP1.render();
      HP2.render();
      HP3.render();
      HP4.render();
      HP5.render();
    } 
    if (lives >= 301 && lives <= 400)
    {
      HP1 = null;
      HP2.render();
      HP3.render();
      HP4.render();
      HP5.render();
    } 
    if (lives >= 201 && lives <= 300)
    {
      HP2 = null;
      HP3.render();
      HP4.render();
      HP5.render();
    } 
    if (lives >= 101 && lives <= 200)
    {
      HP3 = null;
      HP4.render();
      HP5.render();
    } 
    if (lives >= 1 && lives <= 100)
    {
      HP4 = null;
      HP5.render();
    } 
    if (lives <= 0)
    {
      gameMode=dead;
    }
  }
}

void PlayerBulletHandler()
{
  //Bullets update (handles player bullets)
  for (int k = 0; k < Beams.size(); k++)
  {
    Bullet Shoot = Beams.get(k);
    Shoot.render();
    Shoot.move();
    //remove the bullet if the bullet reaches the top of the screen
    if (Shoot.y < 0)   
    {
      Beams.remove(0);
      break;
    }
  }
}

void EnemyBulletHandler()
{
  //Bullet update (Handle enemy bullets)
  for (int n = 0; n < RailBullet.size(); n++)
  {
    EnemyBullet EnemyShot = RailBullet.get(n);
    EnemyShot.render();
    EnemyShot.move();
  }
}

void EnemyHandler()
{
  //Enemies update (handles the enemies)
  for (int i = 0; i < Angels.length; i++) 
  {
    for (int j = 0; j < Angels[i].length; j++) 
    {
      //render the enemies if they are not null
      if (Angels[i][j] != null)
      {
        Angels[i][j].render();
        if (random(1) > maxFireRate)
        {
          Angels[i][j].shoot();
        }
      }
      //if the enemy state is changed then remove an enemy from the 2D array and 
      //remove the bullet from the scene as well after setting the state of the enemy back to normal
      if (enemyState == FallenAngels)
      {
        Angels[i][j] = null;
        enemyState = AliveAngels;
        if (Beams.size() != 0)
        {
          Beams.remove(0);
        }
        enemiesNullifiedCounter ++;
        newScore = enemiesNullifiedCounter * 50;
        score = score+newScore;
        //println(enemiesNullifiedCounter);
        //println(Angels[j].length);
        break;
      }
    }
  }
}

void winScreen()
{
  background(0, 0, 0);
  String winText = "Level Clear";
  String yourScore = "Your score is: "+score;
  String retryText = "press N to go to level: "+ level;
  textSize(40);
  text(winText, 280, 450);
  text(yourScore, 310, 500);
  text(retryText, 290, 550);
  if (keyPressed) 
  {
    if (key == 'N' || key == 'n')
    {
      setup();
      gameMode = playing;
      lives = 500;
      maxFireRate -= .0015;
    }
  }
}

void gameOver()
{
  background(0, 0, 0);
  String loseText = "game over!";
  String yourScore = "Your score is: "+score;
  String retryText = "press G to go back to menu";
  textSize(40);
  text(loseText, 330, 450);
  text(retryText, 270, 550);
  text(yourScore, 310, 500);
  if (keyPressed) 
  {
    if (key == 'G' || key == 'g')
    {
      enemiesNullifiedCounter = 0;


      score = 0;
      newScore = 0;
      level = 1;
      maxFireRate = .9995;
      //Score = "Score: " + score;
      setup();
      gameMode = Intro;
      lives = 500;
    }
  }
}

void reset()
{
  background(0, 0, 0);
  setup();
  gameMode = playing;
}

void keyPressed()
{
  if (keyPressed) 
  {
    if (key == ' ')
    {
      counter = counter +1;
      for (int i = 0; i < 2; i++)
      {
        /*if (counter == 1)
         {
         Beams.add(new Bullet(Hero.x+25, Hero.y-50));
         counter = 0;
         }*/
        if (counter == 1)
        {
          Beams.add(new Bullet(Hero.x+1, Hero.y-50));
        } else if (counter == 2)
        {
          Beams.add(new Bullet(Hero.x+50, Hero.y-50));
          counter = 0;
        }
      }
    }
  }
}