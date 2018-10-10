
//@login:C00217019
//@Author:Sean Nash
//Lab 4

  PVector ballPlace[] = new PVector[10];//Where the Ball is
  PVector ballMovement[] = new PVector[10];//Stores the Ball Velocity
  float ballMass[] = new float [10];//Stores Ball Mass
  int ballRadius[] = new int [10];
  color ballColour[] = new color [10];
  boolean contactMade;
  int timer;

void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
  for (int i = 0; i < 10; i++)
  {
  ballRadius[i] = int(random(15,30));
  ballMass[i] = ballRadius[i] * 1.2;
  ballPlace[i] = new PVector(random(50,500),random(50,600));
  ballMovement[i] = new PVector(random(15), random(15));//Initialises a random direction
  ballMovement[i].normalize();
  ballMovement[i].mult(8);//Normalizes it then scales it by  8 to a constant speed in a random direction
  ballColour[i] = color(random(255),random(255),random(255));
  }
  contactMade = false;
  timer = 0;
}

void draw() 
{  
  background(126);
  for (int i = 0; i < 9; i++)
  {
    for(int u = 0+i; u < 10; u++)
    {
        if(dist(ballPlace[i].x,ballPlace[i].y,ballPlace[u].x,ballPlace[u].y) < ballRadius[i] + ballRadius[u])//Checks to see if the balls radii are within touching distance.
        {
          contactBetween(i,u);
          contactMade = true;
          timer = millis();//Resets the timer, Sets the colour if touching
        }
        else if(contactMade & timer+1000 < millis())//If they arent touching it checks to see if 1000 miliseconds have passed (1 sec) Resets the bool and colour
        {
          contactMade = false;
          fill(255);
        }
      
    }
  }
 for (int i = 0; i < 10; i++)//Moves the ball then checks for border collisions.
  { 
  ballPlace[i] = ballPlace[i].add(ballMovement[i]);//Moves the ball
  fill(ballColour[i]);
  ellipse(ballPlace[i].x, ballPlace[i].y, ballRadius[i]*2,ballRadius[i]*2);//Draws the ball
  
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

void contactBetween(int firstBall,int secondBall)
{
  PVector ballTwoVel;
  PVector ballOneVel;

  ballOneVel = PVector.mult(ballMovement[firstBall],ballMass[firstBall] - ballMass[secondBall]);
  ballOneVel.add(PVector.mult(ballMovement[secondBall],ballMass[secondBall]*2));
  ballOneVel.div(ballMass[firstBall] + ballMass[secondBall]);
  
  ballTwoVel = PVector.mult(ballMovement[secondBall],ballMass[secondBall] - ballMass[firstBall]);
  ballTwoVel.add(PVector.mult(ballMovement[firstBall],ballMass[firstBall]*2));
  ballTwoVel.div(ballMass[secondBall] + ballMass[firstBall]);
  
  ballMovement[firstBall] = ballOneVel;
  ballMovement[secondBall] = ballTwoVel;
}
