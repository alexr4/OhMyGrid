/* Static Array Grid
 In this serie of experiment, we will learn how to use tables, list and class 
 in order to generate an animated and interactive pattern.
 
 e-art sup - option Digital Lab - Alexandre Rivaux // 2014
 */

//Programs variables
int pWidth = 1280;
int pHeight = 720;
float version = 1.0;

//Pattern variables
float marginLeft;
float marginRight;
float marginTop;
float marginBottom;
float patternWidth;
float patternHeight;
float patternResolution;
int cols;
int rows;

void setup()
{
  size(pWidth, pHeight, P2D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  //pattern variables
  marginLeft = 50;
  marginRight = 50;
  marginTop = 50;
  marginBottom = 50;
  patternWidth = width-(marginLeft+marginRight);
  patternHeight = height-(marginTop+marginBottom);
  patternResolution = 25;
  cols = round(patternWidth/patternResolution);
  rows = round(patternHeight/patternResolution);
}

void draw()
{
  background(0, 0, 20);
  
  debugGrid();
}

void debugGrid()
{
  for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
       float x = (i*patternResolution)+(patternResolution/2)+marginLeft;
      float y = (j*patternResolution)+(patternResolution/2)+marginTop;

      strokeWeight(1);
      stroke(0, 100, 100);
      noFill();
      rectMode(CENTER);
      rect(x, y, patternResolution, patternResolution);
      
      strokeWeight(5);
      point(x, y);
    }
  }
}

