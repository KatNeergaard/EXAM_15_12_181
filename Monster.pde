class Monster {

  //class variables
  int durationOneFrame = 100; //in milliseconds
  int frame = 0;
  int frameMax = 3;
  int ticksLast = millis();
  PImage spriteSheet;
  float xPos;
  float yPos;
  float mxWas;
  float myWas;
  int h = 50;
  int w = 50;
  boolean wasMonsterHit=false;
  int monsterLife=8;
  int speed;
  boolean isOn=false;

  //constructor
  Monster(boolean o) {
    spriteSheet = loadImage("mon1.png"); //250x250 pixels
    speed = 2;
    o=isOn;
  }

  //class methods
  void display()
  {
    //if (isOn) {
      PImage monster = spriteSheet.get(0 + (frame * w), h, w, h); //display frame from sprite sheet with Magic Numbers (frame 0 starts at (0, 50) with a size of 50X50 pixels):
      image(monster, xPos, yPos, w, h);
      timeFix();
    //}
  }

  void addMonster(int posX, int posY, boolean s)
  {
    xPos=posX;
    yPos=posY;
    isOn=s;
  }

  void moveTowardsPlayer() {
    mxWas = xPos; //mxWas is saving the value for where the monster was
    myWas = yPos;
    float xDir; 
    float yDir; 
    float monsterSpeed = 10;
    for (int i=0; i<players.length; i++) {
      xDir = (players[i].xPos - xPos)/width * monsterSpeed;
      yDir = (players[i].yPos - yPos)/height * monsterSpeed;
      xPos = xPos + xDir;
      yPos = yPos + yDir;
    }
  }

  float normalizedVector() {
    //would normalize the speed of the monster towards the player
    return (height^2+width^2)/ (width/height);
  }

  void shoot() {
    //should shoot on a timed event
  }

  void stopMoving() {
    println(mxWas);
    xPos=mxWas;
    yPos=myWas;
  }

  void wasMonsterHit() {
    //if( collisionDetection with shot class){
    //wasMonsterHit=true;
  }

  void timeFix() {
    int delta = millis() - ticksLast;
    if (delta >= durationOneFrame)
    {
      frame++;
      if (frame >= frameMax) { 
        frame = 0;
      }
      //ticksLast = millis(); //adds up time overshooting error
      ticksLast += delta; //avoids adding up error
    }
  }

  float getX() {
    return xPos;
  }

  float getY() {
    return yPos;
  }
  float getH() {
    return xPos;
  }

  float getW() {
    return yPos;
  }

  //  boolean checkMonsterAndTileCollision() {
  //    if (!isOn) {
  //      return false;
  //    }    
  //    for (int i=0; i<tiles.length; i++) {
  //      //if (!tiles[i].isOn) { 
  //      //  return false;
  //      //}
  //      if ((xPos+w>=tiles[i].getX()) &&
  //        (xPos< tiles[i].getX()+tiles[i].getW()) &&
  //        (yPos+h >= tiles[i].getY()) &&
  //        (yPos < tiles[i].getY()+tiles[i].getH()))
  //      { 
  //        stopMoving(); //reaction for collision
  //        return true;
  //      }
  //    }
  //    return false;
  //  }
  //

  //void die() {
  //  if (wasMonsterHit==true) {
  //    monsterLife--;
  //  }
  //  if (monsterLife<0) {
  //    //something something call anothe rpart of the spritesheet.
  //  }
  //}
}
