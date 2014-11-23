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
int resolutionHeight;

//Variables pattern
int[][] orientationList;

void setup()
{
  pWidth = 1280;
  pHeight = 720;
  size(pWidth, pHeight, P2D);

  //variables grille
  marginTop = 100;
  marginBottom = 100;
  marginLeft = 100;
  marginRight = 100;
  gridWidth = pWidth - (marginRight+marginLeft);
  gridHeight = pHeight - (marginTop+marginBottom);
  squarePerWidth = 20;
  resolutionWidth = gridWidth / squarePerWidth;
  resolutionHeight = round(gridHeight / resolutionWidth);

  //variables pattern
  orientationList = new int[squarePerWidth][resolutionHeight];


  for (int i=0; i<squarePerWidth; i++)
  {
    for (int j=0; j<resolutionHeight; j++)
    {
      int orientation = round(random(0, 3));

      orientationList[i][j] = orientation;
    }
  }
}

void draw()
{
  background(42);

  for (int i=0; i<squarePerWidth; i++)
  {
    for (int j=0; j<resolutionHeight; j++)
    {
      float x = (resolutionWidth*i)+marginLeft+(resolutionWidth/2);
      float y = (resolutionWidth*j)+marginTop+(resolutionWidth/2);

      int orientation = orientationList[i][j];
      float ax = x;
      float ay = y;
      float bx = x;
      float by = y;
      
      if(orientation == 0)
      {
        ax = x - (resolutionWidth/2);
        ay = y;
        
        bx = x + (resolutionWidth/2);
        by = y;
      }
      else if(orientation == 1)
      {
        ax = x;
        ay = y - (resolutionWidth/2);
        
        bx = x;
        by = y + (resolutionWidth/2);
      }
      else if(orientation == 2)
      {
        ax = x - (resolutionWidth/2);
        ay = y - (resolutionWidth/2);
        
        bx = x +(resolutionWidth/2);
        by = y +(resolutionWidth/2);
      }
      else if(orientation == 3)
      {
        ax = x - (resolutionWidth/2);
        ay = y + (resolutionWidth/2);
        
        bx = x + (resolutionWidth/2);
        by = y - (resolutionWidth/2);
      }

/*  
      stroke(255, 0, 0);
      noFill();
      strokeWeight(1);
      rectMode(CENTER);
      rect(x, y, resolutionWidth, resolutionWidth);

      strokeWeight(5);
      point(x, y);
      */
      
      stroke(255);
      line(ax, ay, bx, by);
    }
  }
}


