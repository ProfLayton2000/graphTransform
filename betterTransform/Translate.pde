class Translate extends Event{
  float x,y;
  
  Translate(float x, float y, int t){
    super(t);
    this.x = x;
    this.y = y;
  }
  
  PVector f(PVector p){
    return new PVector(p.x+x,p.y+y);
  }
}