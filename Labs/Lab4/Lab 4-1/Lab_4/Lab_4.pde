
//@login:C00217019
//@Author:Sean Nash
//Lab 4

  PVector ballPlace;//Where the Ball is
  PVector ballMovement;//Stores the Ball Velocity

void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
  ballPlace = new PVector(300,350);
  ballMovement = new PVector(random(15), random(15));//Initialises a random direction
  ballMovement.normalize();
  ballMovement.mult(8);//Normalizes it then scales it by  8 to a constant speed in a random direction

}

void draw() 
{  
  background(126);
  ballPlace = ballPlace.add(ballMovement);//Moves the ball
  ellipse(ballPlace.x, ballPlace.y, 30, 30);//Draws the ball
  
  if (ballPlace.x < 15 ||ballPlace.x > 585)//If the ball comes within the range of its radius of the screen borders it inverts the given axis.
  {
    ballMovement.x = ballMovement.x * -1;
  }
    if ( ballPlace.y < 15 || ballPlace.y > 685)
  {
    ballMovement.y = ballMovement.y * -1;
  }
 
}
