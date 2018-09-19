//@login:C00217019
//@Author:Sean Nash
//Lab 1

    float[] lineX = new float[1000];

    float[] lineY = new float[1000];
    float increase = 20;


void setup() 
{ //Sets Up The Display window, Size(Window Size)
  size(1500, 700);
    for (int i = 0; i<1000;i++)
  {
    lineX[i] = (i*1.5);
  }
    for (int v = 0; v<1000;v++)
  {
    lineY[v] = 0;
  }
}

void draw() 
{  
//ackground(51);

// rect(1, 1, 78,98);
strokeWeight(1);
 //float randomIncrease = random(100);
 
  float val = randomGaussian();
  float sd = 75;                  // Define a standard deviation
  float mean = lineX.length/2;           // Define a mean value (middle of the screen along the x-axis)
  float x = constrain(( val * sd ) + mean, 0, 999);  // Scale the random number by standard deviation and mean
 
 lineY[int(x)] += increase;
    for (int v = 0; v<lineX.length;v++)
  {
    line(lineX[v],0.0,lineX[v],lineY[v]);
  } 
}
