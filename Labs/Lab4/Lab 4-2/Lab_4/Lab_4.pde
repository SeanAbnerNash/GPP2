
//@login:C00217019
//@Author:Sean Nash
//Lab 4

  PVector ballPlace[] = new PVector[2];//Where the Ball is
  PVector ballMovement[] = new PVector[2];//Stores the Ball Velocity
  boolean contactMade;
  int timer;

void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
  for (int i = 0; i < 2; i++)
  {
  ballPlace[i] = new PVector(300,350);
  ballMovement[i] = new PVector(random(15), random(15));//Initialises a random direction
  ballMovement[i].normalize();
  ballMovement[i].mult(8);//Normalizes it then scales it by  8 to a constant speed in a random direction
  }
  contactMade = false;
  timer = 0;
}

void draw() 
{  
  background(126);
  if(dist(ballPlace[0].x,ballPlace[0].y,ballPlace[1].x,ballPlace[1].y) < 60)//Checks to see if the balls radii are within touching distance.
  {
    fill(255,0,0);
    contactMade = true;
    timer = millis();//Resets the timer, Sets the colour if touching
  }
  else if(contactMade & timer+1000 < millis())//If they arent touching it checks to see if 1000 miliseconds have passed (1 sec) Resets the bool and colour
  {
    contactMade = false;
    fill(255);
  }
  
 for (int i = 0; i < 2; i++)//Moves the ball then checks for border collisions.
  { 
  ballPlace[i] = ballPlace[i].add(ballMovement[i]);//Moves the ball
  ellipse(ballPlace[i].x, ballPlace[i].y, 60, 60);//Draws the ball
  
 if (ballPlace[i].x < 30 ||ballPlace[i].x > 570)//If the ball comes within the range of its radius of the screen borders it inverts the given axis.
  {
    ballMovement[i].x = ballMovement[i].x * -1;
  }
    if ( ballPlace[i].y < 30 || ballPlace[i].y > 670)
  {
    ballMovement[i].y = ballMovement[i].y * -1;
  }
  }
}
