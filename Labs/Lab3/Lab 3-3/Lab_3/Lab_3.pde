
//@login:C00217019
//@Author:Sean Nash
//Lab 3

  PVector ballPlace;//Where the Ball is
  PVector mousePlace;//Where the Mouse is
  PVector movementVector;//The Vector to move one to the other

void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
  ballPlace = new PVector(100,100);
  mousePlace = new PVector(300, 350);//Variables Initialised  
  movementVector = new PVector(0, 0);
  print(ballPlace.dist(mousePlace));
}

void draw() 
{  
  background(126);
  frameRate(30);
  
  if (ballPlace.dist(mousePlace) > 5.0)//If the mousepoint is not within a certain distance of the ball
  {
  ballPlace.add(movementVector);//Moves the ball by that amount
  }
  ellipse(ballPlace.x, ballPlace.y, 33, 33);//Draws the ball
}

void mouseMoved() //Function called when the mouse moves
{
   mousePlace.set(mouseX,mouseY);//Sets the current mouse Location
     if(ballPlace != mousePlace)//if the Mouse is not equal to the ball location
  {

    movementVector = new PVector(ballPlace.x - mousePlace.x,ballPlace.y - mousePlace.y);//It creates a vector between the two points
    movementVector.normalize();//Normalizes its length to 1
    movementVector.mult(-(random(100)/10));//Inverts it and scales by a random amount
  }
}
