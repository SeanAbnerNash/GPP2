
//@login:C00217019
//@Author:Sean Nash
//Lab 3

  PVector ballPlace;//Where the Ball is
  PVector mousePlace;//Where the Mouse is
  PVector movementVector;//The Vector to move one to the other

void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
  ballPlace = new PVector(300,350);
  mousePlace = new PVector(300, 350);//Variables Initialised  
}

void draw() 
{  
  background(126);
  frameRate(30);
   mousePlace.set(mouseX,mouseY);//Sets the current mouse Location
  if(ballPlace != mousePlace)//if the Mouse is not equal to the ball location
  {

    movementVector = new PVector(ballPlace.x - mousePlace.x,ballPlace.y - mousePlace.y);//It creates a vector between the two points
    movementVector.normalize();//Normalizes its length to 1
    movementVector.mult(-1.1);//Inverts it and scales it up a bit
    ballPlace.add(movementVector);//Moves the ball by that amount
  }
   ellipse(ballPlace.x, ballPlace.y, 33, 33);//Draws the ball
}
