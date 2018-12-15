class Level
{
  int id=0;
  int gridSize=25;
  Tile[] tiles = new Tile[512];
  Candy[] candies = new Candy[50];
  Skeleton[] skeletons = new Skeleton[50];
  Exit exit;
  Monster[] monsters = new Monster[30];

  //constructer
  Level(int l)
  {
    id=l;
    String[] lines = loadStrings("map"+id+".txt"); //load level id
    //instatiating the classes needed
    exit = new Exit();
    for (int i=0; i<tiles.length; i++) {
      tiles[i] = new Tile();
    }
    for (int i=0; i<candies.length; i++) {
      candies[i] = new Candy(false);
    }
    for (int i=0; i<skeletons.length; i++) {
      skeletons[i] = new Skeleton();
    }
    for (int i=0; i<monsters.length; i++) {
      monsters[i] = new Monster();
    }

    int currentTile=0;
    int currentCandy=0;
    int currentSkeletons=0;
    int currentMonsters=0;
    for (int i=0; i<lines.length; i++) //goes through lines
    {
      for (int j=0; j<lines[i].length(); j++) //goes through rows
      {
        if (lines[i].charAt(j)=='1') {
          tiles[currentTile].addTile(j*gridSize, i*gridSize, true);
          //tiles[currentTile].collide=true;
          currentTile++;
        } else if (lines[i].charAt(j)=='2') {
          candies[currentCandy].addCandy(j*gridSize, i*gridSize, true);
          currentCandy++;
        } else if (lines[i].charAt(j)=='3') {
          skeletons[currentSkeletons].addSkeleton(j*gridSize, i*gridSize, true);
          currentSkeletons++;
        } else if (lines[i].charAt(j)=='5') {
          exit.addExit(j*gridSize, i*gridSize, true);
        } else if (lines[i].charAt(j)=='4') {
          monsters[currentMonsters].addMonster(j*gridSize, i*gridSize, true);
          currentMonsters++;
        }
      }
    }
  }

  //class methods
  void display()
  {
    for (int i=0; i<tiles.length; i++) {
      tiles[i].display();
    }
    for (int i=0; i<candies.length; i++) {
      candies[i].display();
    }
    for (int i=0; i<skeletons.length; i++) {
      skeletons[i].display();
    }
    for (int i=0; i<monsters.length; i++) {
      monsters[i].display();
      monsters[i].moveTowardsPlayer();
    }
    exit.display();
  }

  void checkAllCollisions() {
    if (exit.collidingWithPlayer()==true) {
      println("EXIT WORKS");
      weAreInLevel++;
      for (int i=0; i<playerCount; i++) {
        players[i].resetPlayerCoordinate();
      }
    }
    for (int i=0; i <skeletons.length; i++) {
      if (skeletons[i].areYouHit()==true) {
        println("shooting skeletons WORKS");
      }
    }
    for (int i=0; i <candies.length; i++) {
      if (candies[i].areYouHit()==true) {
        println("CANDIES WORKS");
      }
    }
    for (int i=0; i <tiles.length; i++) {
      if (tiles[i].checkPlayerAndTileCollision()==true)
      {
        println("player colliding with tile "+i);
      }
    }
    //for (int i=0; i< monsters.length; i++) {
    //  if (monsters[i].checkMonsterAndTileCollision()==true) {
    //    println("monsters colliding with tiles");
    //  }
    //}
    if (checkMonsterAndTileCollision()==true);
    {
      println("monsters colliding with tiles");
    }
  }

  boolean checkMonsterAndTileCollision() {
    for (int i=0; i<tiles.length; i++) {
      if (!tiles[i].isOn) { 
        return false;
      }
      for (int m=0; m< monsters.length; m++) {
        if (!monsters[m].isOn) {
          return false;
        }
        if ((monsters[m].getX()+monsters[m].getW()>=tiles[i].getX()) &&
          (monsters[m].getX()< tiles[i].getX()+tiles[i].getW()) &&
          (monsters[m].getY()+monsters[m].getH() >= tiles[i].getY()) &&
          (monsters[m].getY() < tiles[i].getY()+tiles[i].getH())) 
        { 
          monsters[m].stopMoving(); //reaction for colliosion
          return true;
        }
      }
    }
    return false;
  }

  void resetGame() {
    if (weAreInLevel > levels.length) {
      for (int i=0; i<tiles.length; i++)
      {
        tiles[i].isOn=false;
      }
      for (int i=0; i<candies.length; i++)
      {
        candies[i].isOn=false;
      }
      for (int i=0; i<skeletons.length; i++)
      {
        skeletons[i].isOn=false;
      }
      for (int i=0; i<monsters.length; i++) {
        monsters[i].isOn=false;
      }
      exit.isOn=false;
    }
  }
}
