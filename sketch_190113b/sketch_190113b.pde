import gifAnimation.*;
GifMaker gifExport;

void setup(){
  size(600,600,P3D);
  colorMode(RGB,width);
  frameRate(10);
  
  gifExport = new GifMaker(this, "export.gif");
  gifExport.setRepeat(0);
  gifExport.setQuality(10);
  gifExport.setDelay(20);
}

void draw(){
  background(240,250,260);
  
  translate(width/2, height/2, -height);
  for(int y = -3; y <= 3; y+=1){
    for(int x = -3; x <=3; x+=1){
      for(int z = -3; z<= 3; z+=1){
        pushMatrix();
        translate(150*x, 150*y , -150*z);
        stroke(z*400,y*300,x*300);
        fill(z*400,y*300,x*300,300);
        line(width/2, height/2, x,y);
        rotateY(random(360));
        makeCube(15,450);
        popMatrix();
      }
    }
  }
  if(frameCount <= 10*3){
    gifExport.addFrame();
  }else{
    gifExport.finish();
  }
}

void makeCube(int x,int al){
  beginShape(QUADS);

    fill(600,600,600,al);
    vertex(-x,-x,x);
    vertex(-x,x,x);
    vertex(x,x,x);
    vertex(x,-x,x);
    
    fill(600,0,600,al);
    vertex(x,-x,-x);
    vertex(x,x,-x);
    vertex(-x,x,-x);
    vertex(-x,-x,-x);
    
    fill(0,600,600,al);
    vertex(-x,-x,x);
    vertex(x,-x,x);
    vertex(x,-x,-x);
    vertex(-x,-x,-x);
    
    fill(600,0,0,al);
    vertex(-x,x,x);
    vertex(-x,x,-x);
    vertex(x,x,-x);
    vertex(x,x,x);
    
    fill(0,600,0,al);
    vertex(-x,-x,-x);
    vertex(-x,x,-x);
    vertex(-x,x,x);
    vertex(-x,-x,x);
    
    fill(0,0,600,al);
    vertex(x,-x,x);
    vertex(x,x,x);
    vertex(x,x,-x);
    vertex(x,-x,-x);
        
  endShape();  
}
