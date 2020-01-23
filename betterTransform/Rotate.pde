class Rotate extends Event{
  float c;
  PVector cent;
  
  Rotate(float c, int t){
    this(new PVector(0,0),c,t);
  }
  
  Rotate(PVector p, float c, int t){
    super(t);
    this.cent = p;
    this.c = c;
  }
  
  Rotate(float x, float y, float c, int t){
    this(new PVector(x,y),c,t);
  }
  
  PVector f(PVector p){
    PVector temp = new PVector(p.x-cent.x,p.y-cent.y);
    temp = new PVector(cos(c)*temp.x - sin(c)*temp.y, sin(c)*temp.x + cos(c)*temp.y);
    return new PVector(temp.x+cent.x,temp.y+cent.y);
  }
}