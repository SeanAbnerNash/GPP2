
//@login:C00217019
//@Author:Sean Nash
//Lab 3

  PVector firstClick;
  PVector secondClick;//Variables to track Click Locations
  int clickCounter;//Variable to track click number

void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
  clickCounter = 0;
  firstClick = new PVector(0, 0);
  secondClick = new PVector(0, 0);//Variables Initialised

}

void draw() 
{  
  
  background(126);
  stroke(255);
  if (clickCounter != 0)//Draws the Line once both points have been selected
  {
  line(firstClick.x,firstClick.y,secondClick.x,secondClick.y);
  }
  if(clickCounter == 2)//Finds the prints the magnitude of vector when both points are selected
  {
  float distance = firstClick.dist(secondClick);
  println(distance);
  }

}
void mouseReleased() {//A function called whenever the mouse button is released
//Placed out of numerical order so the function doesnt go through every option
      if(clickCounter == 2)//Both points were selcted, This Resets them and sets the counter to the temp value 3 to avoid setting off the 0 if statement
     {
       clickCounter = 3;
       firstClick = new PVector(0, 0);
       secondClick = new PVector(0, 0);
     }
      if(clickCounter == 1)//1 point was selected, now both points are selected, the line and magnitude will be shown at this point
     {
       clickCounter = 2;
       secondClick = new PVector(mouseX, mouseY);
     }
      if(clickCounter == 0)//no points are selected, sets the first point and the second point to the same location to prevent the last values from drawing the line early.
     {
       clickCounter = 1;
       firstClick = new PVector(mouseX, mouseY);
       secondClick = new PVector(mouseX, mouseY);
     } 
      if(clickCounter == 3)//A temporary values which never lasts past this function. Used to reset the counter without setting of any if statements
     {
       clickCounter = 0;
     }
}
