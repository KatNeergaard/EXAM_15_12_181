
//void setup()
//{
//  size(200, 200);
//  //strokeWeight(2);
////  for (int i = 0; i < sparks.length; i++)
////  {
////    sparks[i] = new Spark((width * 0.5), (height * 0.5), random(-3, 3), random(-6, 0));
////  }
////}

class Spark
{
  //class variables
  float posX = 0;
  float posY = 0;
  float velocityX = 0;
  float velocityY = 0;
  color c= color(0); //(int(random(128, 256)), int(random(128, 256)), int(random(128, 256)));
  float gravity = 0.3;

  //constructor gets position in pixels and x and y velocities, and sets the class variables accordingly
  Spark(float x, float y, float vX, float vY)
  {
    posX = x;
    posY = y;
    velocityX = vX;
    velocityY = vY;
  }

  void display()
  {
    strokeWeight(2); //changes the stroke of eveyrthing in the game right now... 
    stroke(c);
    point(posX, posY);
    //noStroke();
  }

  void move()
  {
    posX += velocityX;
    posY += velocityY;
    velocityY += gravity;
  }

  void sparksExplode()
  {
    //background(0); // this needs to be our background! 
    display();
    move();
  }
}


//for (int s = 0; s < sparks.length; s++)
//{
//  sparks[s].sparksExplode();
//}
