/*
GOAL:
Draw first column at LEFT EDGE of allocated space
Draw last column at RIGHT EDGE of allocated space
Draw first row at TOP EDGE of allocated space
Draw last row at BOTTOM EDGE of allocated space
*/

int rows = 5;
int columns = 5;
float scale = 1.0; // 1.0 = use 100% of canvas
float radius, xStep, yStep;
float radiusScale;
PVector position;
boolean iso = true;


void setup () {
size(800,800);
//radius = width * 0.1;
radiusScale = 0.5;
background(0);
fill(255, 128);
noStroke();
ellipseMode(RADIUS);
}


void draw() {
  //background(0);
  //fill(frameCount%255);
  pushMatrix();
  translate(width*0.5, height*0.5);
  float frameAngle = radians(frameCount%360);
  //rotate(frameAngle);
  //translate(0, 0); // This is a mistake! It means "translate 0 pixels in no direction"
  translate(-width*0.5, -height*0.5); // is the correct way to translate back to the origin (but that would've been less interesting!)
  //scale = map(mouseX, 0, width, 0, 2);
  //scale = map(sin(frameAngle*2), -1, 1, 0.5, 2.0);
  //rows = int(map(mouseY,0,height,1,100));
  //rows = int(map(cos(frameAngle), -1, 1, 1, 10));
  //radiusScale = map(sin(frameAngle*3), -1, 1, 0.05, 0.8);
  //fill(map(sin(frameAngle), -1, 1, 0, 255));
  //stroke(map(cos(frameAngle), -1, 1, 0, 255));
  columns = rows;
  
  
  float gridWidth = width * scale;
  float gridHeight = height * scale;
  float xOffset = (width-gridWidth)*0.5;
  float yOffset = (height-gridHeight)*0.5;
  radius = gridWidth/(columns*2);
  xStep = radius;
  if (iso) {yStep = radius * sqrt(3) * 0.5;}
  else {yStep = radius;}
 
  
  for(int row = 1; row<=rows; row++) {
    // row will take the values 0, 1, 2 (upto rows-1)
    for(int col = 1; col<=columns; col++) {
      
      // col will take the values 0, 1, 2 (upto columns-1)
      
      //println("Row: " + row + " Col: " + col);
      //float xpos = map(col, 0, columns-1, 0, gridWidth) + xOffset;
      //float ypos = map(row, 0, rows-1, 0, gridHeight) + yOffset;
      float xpos = ((col*2)-1)*xStep + xOffset;
      float ypos = ((row*2)-1)*yStep  + yOffset;
      if (isOdd(row)) {xpos += xStep*0.5;}
      position = new PVector(xpos, ypos);
      ellipse(position.x, position.y, radius * radiusScale,radius * radiusScale);
      
      //println("Col: " + col + " Row: " + row + " Xpos: " + position.x + " Ypos: " + position.y);    
    }
  }
  popMatrix();
  //exit();
}


//Test if a number is even:
boolean isEven(int n){
  return n % 2 == 0;
}
  
//Test if a number is odd:
boolean isOdd(int n){
  return n % 2 != 0;
}
