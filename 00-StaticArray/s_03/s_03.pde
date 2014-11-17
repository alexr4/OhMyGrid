/* Static Array Grid
 In this serie of experiment, we will learn how to use tables, list and class 
 in order to generate an animated and interactive pattern.
 
 e-art sup - option Digital Lab - Alexandre Rivaux // 2014
 */

//Programs variables
int pWidth = 1280;
int pHeight = 720;
float version = 3.0;

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
float marginLine;


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
  marginLine = 5;

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
  //debugGrid();

  //draw Pattern
  for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
      //compute line
      int orientation = orientationList[i][j];
      float cx = (i*patternResolution)+(patternResolution/2)+marginLeft;
      float cy = (j*patternResolution)+(patternResolution/2)+marginTop;

      float ax = cx;
      float ay = cy;
      float bx = cx;
      float by = cy;

      if (orientation == 0)
      {
        ax = cx - (patternResolution/2 - marginLine);
        ay = cy - (patternResolution/2 - marginLine);

        bx = cx + (patternResolution/2 - marginLine);
        by = cy + (patternResolution/2 - marginLine);
      } else if (orientation == 1)
      {
        ax = cx - (patternResolution/2 - marginLine);
        ay = cy + (patternResolution/2 - marginLine);

        bx = cx + (patternResolution/2 - marginLine);
        by = cy - (patternResolution/2 - marginLine);
      } else if (orientation == 2)
      {
        ax = cx - (patternResolution/2 - marginLine);
        ay = cy;

        bx = cx + (patternResolution/2 - marginLine);
        by = cy;
      } else
      {
        ax = cx;
        ay = cy - (patternResolution/2 - marginLine);

        bx = cx;
        by = cy + (patternResolution/2 - marginLine);
      }

      //compute interaction
      float distFromPointToMouse = dist(cx, cy, mouseX, mouseY);
      float diagonalProgram = sqrt(pow(width, 2)+pow(height, 2));
      float limit = diagonalProgram/4;
      if (distFromPointToMouse < limit)
      {
        float sWeight = map(distFromPointToMouse, 0, limit, 10, 1);
        strokeWeight(sWeight);
      } else
      {
        strokeWeight(1);
      }

      //Draw line
      stroke(0, 0, 100);
      strokeCap(SQUARE);
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

void keyPressed()
{
  if (key == 'u')
  {
    for (int i=0; i<cols; i++)
    {
      for (int j=0; j<rows; j++)
      {
        orientationList[i][j] = round(random(3));
      }
    }
  }
}

