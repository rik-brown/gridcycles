/*
GOAL:
Draw first column at LEFT EDGE of allocated space
Draw last column at RIGHT EDGE of allocated space
Draw first row at TOP EDGE of allocated space
Draw last row at BOTTOM EDGE of allocated space
*/

int rows = 5;
int cols = 5;
float canvasScale = 0.5; // 1.0 = use 100% of canvas
float colWidth, rowHeight;
float radiusX, radiusY;
float radiusScale;
PVector position;
boolean iso = true;


void setup () {
size(800,800);
//radius = width * 0.1;
radiusScale = 1.0;
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
  
  //canvasScale = map(mouseX, 0, width, 0, 2);
  //canvasScale = map(sin(frameAngle*2), -1, 1, 0.5, 2.0);
  //rows = int(map(mouseY,0,height,1,100));
  //rows = int(map(cos(frameAngle), -1, 1, 1, 10));
  //cols = rows;
  
  
  //radiusScale = map(sin(frameAngle*3), -1, 1, 0.05, 0.8);
  //fill(map(sin(frameAngle), -1, 1, 0, 255));
  //stroke(map(cos(frameAngle), -1, 1, 0, 255));
  
  
  
  float gridWidth = width * canvasScale;
  float gridHeight = height * canvasScale;
  float xOffset = (width-gridWidth)*0.5;
  float yOffset = (height-gridHeight)*0.5;
  noFill();
  stroke(255);
  rect(xOffset, yOffset, gridWidth, gridHeight);
  //fill(255);
  colWidth = gridWidth/cols;
  if (iso) {rowHeight = gridHeight/rows * sqrt(3) * 0.5;} else {rowHeight = gridHeight/rows;}
  
  radiusX = colWidth*0.5*radiusScale;
  radiusY = (gridHeight/rows)*0.5*radiusScale;
   
  for(int row = 1; row<=rows; row++) {
    // row will take the values 0, 1, 2 (upto rows-1)
    for(int col = 1; col<=cols; col++) {
      
      // col will take the values 0, 1, 2 (upto columns-1)
      
      //println("Row: " + row + " Col: " + col);
      //float xpos = map(col, 0, columns-1, 0, gridWidth) + xOffset;
      //float ypos = map(row, 0, rows-1, 0, gridHeight) + yOffset;
      float xpos = ((col*2)-1)*colWidth*0.5 + xOffset;
      float ypos = ((row*2)-1)*rowHeight*0.5  + yOffset;
      if (iso && isOdd(row)) {xpos += colWidth*0.5;}
      position = new PVector(xpos, ypos);
      ellipse(position.x, position.y, radiusX,radiusY);
      
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
