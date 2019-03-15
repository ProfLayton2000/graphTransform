void setup(){
  size(1920,1080);
  frameRate(120);
}

Shape l = new Shape(new PVector(-960,0),
                  new PVector(960,0),
                  8000);
                  
int frame = 0;
int totalFrames = 90;
void draw(){
  if (frame > totalFrames){
    noLoop();
    exit();
  }
  background(0);
  translate(width/2,height/2);
  float t = (1.0*frame)/(1.0*totalFrames);
  l.show(1,doubleCubicEasing(t,1));
  saveFrame("output/lineToCircle_####.png");
  frame++;
}