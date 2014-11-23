//variables programme
int pWidth;
int pHeight;

//Variables matrice
float marginTop;
float marginBottom;
float marginLeft;
float marginRight;
float gridWidth;
float gridHeight;
int squarePerWidth;
float resolutionWidth;
int squarePerHeight;

//Variables pattern
int[][] orientationList;
float[][] origineXList;
float[][] origineYList;
float[][] axList;
float[][] ayList;
float[][] bxList;
float[][] byList;


void setup()
{
  pWidth = 1280;
  pHeight = 720;
  size(pWidth, pHeight, P2D);

  initGrid();  
}

void draw()
{
  background(42);

  for (int i=0; i<squarePerWidth; i++)
  {
    for (int j=0; j<squarePerHeight; j++)
    {
      float x = origineXList[i][j];
      float y = origineYList[i][j];
      float ax = axList[i][j];
      float ay = ayList[i][j];
      float bx = bxList[i][j];
      float by = byList[i][j];

/*
      stroke(255, 0, 0);
      noFill();
      strokeWeight(1);
      rectMode(CENTER);
      rect(x, y, resolutionWidth, resolutionWidth);

      strokeWeight(5);
      point(x, y);
*/
      strokeWeight(1);
      stroke(255);
      line(ax, ay, bx, by);
    }
  }
}

void mousePressed()
{
  initGrid();
}

void initGrid()
{
  //variables grille
  marginTop = 100;
  marginBottom = 100;
  marginLeft = 100;
  marginRight = 100;
  gridWidth = pWidth - (marginRight+marginLeft);
  gridHeight = pHeight - (marginTop+marginBottom);
  squarePerWidth = 20;
  resolutionWidth = gridWidth / squarePerWidth;
  squarePerHeight = round(gridHeight / resolutionWidth);

  //variables pattern
  orientationList = new int[squarePerWidth][squarePerHeight];
  origineXList  = new float[squarePerWidth][squarePerHeight];
  origineYList = new float[squarePerWidth][squarePerHeight];
  axList = new float[squarePerWidth][squarePerHeight];
  ayList = new float[squarePerWidth][squarePerHeight];
  bxList = new float[squarePerWidth][squarePerHeight];
  byList = new float[squarePerWidth][squarePerHeight];

  for (int i=0; i<squarePerWidth; i++)
  {
    for (int j=0; j<squarePerHeight; j++)
    {
      int orientation = round(random(0, 3));
      float x = (resolutionWidth*i)+marginLeft+(resolutionWidth/2);
      float y = (resolutionWidth*j)+marginTop+(resolutionWidth/2);
      
      float ax = x;
      float ay = y;
      float bx = x;
      float by = y;

      if (orientation == 0)
      {
        ax = x - (resolutionWidth/2);
        ay = y;

        bx = x + (resolutionWidth/2);
        by = y;
      } else if (orientation == 1)
      {
        ax = x;
        ay = y - (resolutionWidth/2);

        bx = x;
        by = y + (resolutionWidth/2);
      } else if (orientation == 2)
      {
        ax = x - (resolutionWidth/2);
        ay = y - (resolutionWidth/2);

        bx = x +(resolutionWidth/2);
        by = y +(resolutionWidth/2);
      } else if (orientation == 3)
      {
        ax = x - (resolutionWidth/2);
        ay = y + (resolutionWidth/2);

        bx = x + (resolutionWidth/2);
        by = y - (resolutionWidth/2);
      }


      orientationList[i][j] = orientation;
      origineXList[i][j] = x;
      origineYList[i][j] = y;
      axList[i][j] = ax;
      ayList[i][j] = ay;
      bxList[i][j] = bx;
      byList[i][j] = by;
    }
  }
}

