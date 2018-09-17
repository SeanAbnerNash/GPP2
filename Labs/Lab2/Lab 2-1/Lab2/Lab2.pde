//@login:C00217019
//@Author:Sean Nash
//Lab 1
void setup() { //Sets Up The Display window, Size(Window Size)
  size(600, 700);
}

void draw() 
{  
//ackground(51);

// rect(1, 1, 78,98);
 
    float randomR = random(255);
  float randomG = random(255);
  float randomB = random(255);
   stroke(randomR, randomG, randomB);
   float randomWeight = random(5);
   strokeWeight(randomWeight);
   randomR = random(255);
   randomG = random(255);
   randomB = random(255);
   fill(randomR, randomG, randomB);

  float randomX = random(600);
  float randomY = random(700);
  float randomRad = random(50);
  ellipse(randomX,randomY,randomRad,randomRad);

}
