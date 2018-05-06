/*
GOAL:
Draw first column at LEFT EDGE of allocated space
Draw last column at RIGHT EDGE of allocated space
Draw first row at TOP EDGE of allocated space
Draw last row at BOTTOM EDGE of allocated space
*/

boolean iso = true;

int rows = 50;
int cols = 50;
float widthScale = 0.5;  // 1.0 = use 100% of canvas
float heightScale; // 1.0 = use 100% of canvas
float radiusScale = 0.111; // 1.0 = 100% of colWidth/rowHeight

float colWidth, rowHeight;
float radiusX, radiusY;
PVector position;



void setup () {
size(800,800);
//colorMode(HSB,366,255,255);
background(0);
fill(255);
noStroke();
ellipseMode(RADIUS);
//blendMode(SCREEN);
}


void draw() {
  //background(0);
  trails();
  //fill(map(frameCount%120, 1, 120, 0, 255));
  pushMatrix();
  translate(width*0.5, height*0.5);
  float frameAngle = radians((frameCount*0.5)%360);
  rotate(frameAngle);
  //translate(0, 0); // This is a mistake! It means "translate 0 pixels in no direction"
  translate(-width*0.5, -height*0.5); // is the correct way to translate back to the origin (but that would've been less interesting!)
  widthScale = map(sin(frameAngle*2), -1, 1, 0.1, 5.0);
  //widthScale = map(mouseX, 0, width, 0, 2);
  //heightScale = map(mouseX, 0, width, 0, 2);
  if (iso) {heightScale = widthScale * sqrt(3) * 0.5;} else {heightScale = widthScale;}
  //rows = int(map(mouseY,0,height,1,100));
  //rows = int(map(cos(frameAngle), -1, 1, 1, 10));
  //cols = rows;
  
  
  //radiusScale = map(sin(frameAngle*3), -1, 1, 0.25, 0.5);
  //fill(map(cos(frameAngle*2), -1, 1, 25, 255));
  //stroke(map(cos(frameAngle), -1, 1, 0, 255));
  
  
  
  float gridWidth = width * widthScale;
  float gridHeight = height * heightScale;
  float xOffset = (width-gridWidth)*0.5;
  float yOffset = (height-gridHeight)*0.5;
  //noFill();
  //stroke(255,4);
  //rect(xOffset, yOffset, gridWidth, gridHeight);
  //fill(255);
  colWidth = gridWidth/cols;
  //if (iso) {rowHeight = gridHeight/rows * sqrt(3) * 0.5;} else {rowHeight = gridHeight/rows;}
  rowHeight = gridHeight/rows;
  
  
  radiusX = colWidth*0.5*radiusScale;
  radiusY = (gridHeight/rows)*0.5*radiusScale;
  if (iso) {radiusY = radiusX;}
   
  for(int row = 1; row<=rows; row++) {
    // row will take the values 0, 1, 2 (upto rows-1)
    for(int col = 1; col<=cols; col++) {
      
      // col will take the values 0, 1, 2 (upto columns-1)
      
      //println("Row: " + row + " Col: " + col);
      //float xpos = map(col, 0, columns-1, 0, gridWidth) + xOffset;
      //float ypos = map(row, 0, rows-1, 0, gridHeight) + yOffset;
      float xpos = ((col*2)-1)*colWidth*0.5 + xOffset;
      float ypos = ((row*2)-1)*rowHeight*0.5  + yOffset;
      if (iso && isEven(row)) {xpos += colWidth*0.5;}
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

void trails() {
  blendMode(DIFFERENCE);
  noStroke();
  fill(1);
  rect(-1,-1,width+1, height+1);
  blendMode(BLEND);
  fill(255);

}
