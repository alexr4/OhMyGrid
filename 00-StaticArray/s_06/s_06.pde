/* Static Array Grid
 In this serie of experiment, we will learn how to use tables, list and class 
 in order to generate an animated and interactive pattern.
 
 e-art sup - option Digital Lab - Alexandre Rivaux // 2014
 */

//Programs variables
int pWidth = 1280;
int pHeight = 720;
float version = 6.0;

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
float[][] cxList;
float[][] cyList;
float[][] axList;
float[][] ayList;
float[][] bxList;
float[][] byList;
float marginLine;
float noiseColor;
float zOff;
float noiseXInc;
float noiseYInc;
float noiseZInc;
float theta;
float speedTheta;


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
  cxList = new float[cols][rows];
  cyList = new float[cols][rows];
  axList = new float[cols][rows];
  ayList = new float[cols][rows];
  bxList = new float[cols][rows];
  byList = new float[cols][rows];
  marginLine = 5;
  noiseColor = 0.0;
  zOff = 0.0;
  noiseXInc = random(5, 10);
  noiseYInc = random(5, 10);
  noiseZInc = 0.025;//random(0.01, 0.02);
  speedTheta = (TWO_PI / 500) * patternResolution;

  for (int i=0; i<cols; i++)
  {
    for (int j=0; j<rows; j++)
    {
      orientationList[i][j] = round(random(3));

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

      cxList[i][j] = cx;
      cyList[i][j] = cy;
      axList[i][j] = ax;
      ayList[i][j] = ay;
      bxList[i][j] = bx;
      byList[i][j] = by;
    }
  }
}

void draw()
{
  background(0, 0, 20);
  //debugGrid();


  //draw Pattern
  float xOff = 0.0;
  for (int i=0; i<cols; i++)
  {
    float yOff = 0.0;

    float gamma = theta;
    for (int j=0; j<rows; j++)
    {
      //color
      float colorInc = sin(gamma)*100;
      noiseColor = noise(xOff, yOff, zOff);
      noiseColor = map(noiseColor, 0, 1, 0, 200);
      noiseColor = noiseColor+colorInc;

      float cx = cxList[i][j];
      float cy = cyList[i][j];
      float ax = axList[i][j];
      float ay = ayList[i][j];
      float bx = bxList[i][j];
      float by = byList[i][j];

      //compute interaction
      float distFromPointToMouse = dist(cx, cy, mouseX, mouseY);
      float diagonalProgram = sqrt(pow(width, 2)+pow(height, 2));
      float limit = diagonalProgram/4;
      float hue = 160;
      float sWeight = 1;

      if (distFromPointToMouse < limit)
      {
        sWeight = map(distFromPointToMouse, 0, limit, 10, 2);
        hue = map(distFromPointToMouse, 0, limit, 200, 160);
      } else
      {
        sWeight = 2;
        hue = 160;
      }

      //Draw line
      stroke(noiseColor, 100, 100);
      strokeWeight(sWeight);
      strokeCap(SQUARE);
      line(ax, ay, bx, by);

      yOff += noiseYInc;
      gamma += speedTheta;
    }

    xOff += noiseXInc;
  }

  zOff += noiseZInc;
  theta += 0.02;
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

    noiseXInc = random(5, 10);
    noiseYInc = random(5, 10);
    noiseZInc = 0.025;//random(0.01, 0.02);
    for (int i=0; i<cols; i++)
    {
      for (int j=0; j<rows; j++)
      {
        orientationList[i][j] = round(random(3));

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

        cxList[i][j] = cx;
        cyList[i][j] = cy;
        axList[i][j] = ax;
        ayList[i][j] = ay;
        bxList[i][j] = bx;
        byList[i][j] = by;
      }
    }
  }
}

