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
}

void draw()
{
  background(42);
  
  for(int i=0; i<squarePerWidth; i++)
  {
    for(int j=0; j<resolutionHeight; j++)
    {
      float x = (resolutionWidth*i)+marginLeft+(resolutionWidth/2);
      float y = (resolutionWidth*j)+marginTop+(resolutionWidth/2);
      
      stroke(255, 0, 0);
      noFill();
      strokeWeight(1);
      rectMode(CENTER);
      rect(x, y, resolutionWidth, resolutionWidth);
      
      strokeWeight(5);
      point(x, y);
    }
  }
}



