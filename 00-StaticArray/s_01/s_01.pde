/* Static Array Grid
 In this serie of experiment, we will learn how to use tables, list and class 
 in order to generate an animated and interactive pattern.
 
 e-art sup - option Digital Lab - Alexandre Rivaux // 2014
 */

//Programs variables
int pWidth = 1280;
int pHeight = 720;
float version = 2.0;

//Pattern variables declaration
float marginLeft;
float marginRight;
float marginTop;
float marginBottom;
float patternWidth;
float patternHeight;
float patternResolution;
int cols;
int rows;

//Pattern Component variables declaration
int[][] orientationList;


void setup()
{
  size(pWidth, pHeight, P2D);
  smooth(8);
  colorMode(HSB, 360, 100, 100, 100);

  //pattern variables instaciation
  marginLeft = 50;
  marginRight = 50;
  marginTop = 50;
  marginBottom = 50;
  patternWidth = width-(marginLeft+marginRight);
  patternHeight = height-(marginTop+marginBottom);
  patternResolution = 25;
  cols = round(patternWidth/patternResolution);
  rows = round(patternHeight/patternResolution);
  
  //pattern component instanciation
  orientationList = new int[cols][rows];
  
   for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
      orientationList[i][j] = round(random(3));
    }
  }
}

void draw()
{
  background(0, 0, 20);
  debugGrid();
  
  //draw Pattern
   for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
      int orientation = orientationList[i][j];
      float cx = (i*patternResolution)+(patternResolution/2)+marginLeft;
      float cy = (j*patternResolution)+(patternResolution/2)+marginTop;
      
      float ax = cx;
      float ay = cy;
      float bx = cx;
      float by = cy;
      
      if(orientation == 0)
      {
        ax = cx - patternResolution/2;
        ay = cy - patternResolution/2;
        
        bx = cx + patternResolution/2;
        by = cy + patternResolution/2;
      }
      else if(orientation == 1)
      {
        ax = cx - patternResolution/2;
        ay = cy + patternResolution/2;
        
        bx = cx + patternResolution/2;
        by = cy - patternResolution/2;
      }
      else if(orientation == 2)
      {
        ax = cx - patternResolution/2;
        ay = cy;
        
        bx = cx + patternResolution/2;
        by = cy;
      }
      else
      {
        ax = cx;
        ay = cy - patternResolution/2;
        
        bx = cx;
        by = cy + patternResolution/2;
      }
      
      //Draw lines
      stroke(0, 0, 100);
      strokeWeight(1);
      line(ax, ay, bx, by);
      
    }
  }
  
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

