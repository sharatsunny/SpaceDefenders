class Bullet
{
  //boolean enemyHit = false;
  int x,y;  
  Bullet(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  void render()
  {
    noStroke();
    fill(BulletCol);
    rect(x,y,5,20);
  }
  void move()
  {
    //int shotIncrement = 1000;
    int shotSpeed = 10; //int (random(10));//+20;  
    this.y -= shotSpeed;
  }
}