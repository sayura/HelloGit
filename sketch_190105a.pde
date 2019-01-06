int Y_AXIS = 1;
int X_AXIS = 2;
color b1,b2;

void setup(){
  size(600, 600, P3D);
  colorMode(RGB,width);
  frameRate(5);
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  b1 = color(150,190,198,20);
  b2 = color(500,200,258,20);
  setGradient(0,0,width,height,b1,b2,Y_AXIS);
  
}

void draw(){
  //noFill();
  float r1 = random(5,90);
  float r2 = random(5,180);
  
  setGradient(0,0,width,height,b1,b2,Y_AXIS);
  //translate(0,height/2);
  //int rot = frameCount;

  for(int x = -80; x<width; x+=100){
    for(int y = -80; y<height; y+=100){
      //stroke(x/y,width-100,x*2);
      strokeJoin(ROUND);
      strokeWeight(1);
      
      stroke(y,x,x+y,10);
      fill(100,390,490,300);
      rotate(x);
      star(x,y,r1,r2,20);
      fill(x*2,y-100,300,200);
      star(x,y,r1,r2,20);
      fill(y,x,200,450);
      star(x,y,r1*2,r2*2,8);
      
      
      rotateZ(45);
      //rotateX(rot*0.5);
      
    }
      
  }
  //saveFrame("####.png");
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis){
  noFill();
  
    for(int i = y; i <= y+h; i++){
      float inter = map(i,y,y+h,0,1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x,i,x+w,i);
    }
  }
  
void star(float x, float y, float radius1, float radius2, float npoints){
  float angle = TWO_PI/npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for(float a = 0; a < TWO_PI; a += angle){
    float sx = x + cos(a) * radius1;
    float sy = y + sin(a) * radius1;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius2;
    sy = y + sin(a+halfAngle) * radius2;
    vertex(sx,sy);
  }
  endShape(CLOSE);
}
