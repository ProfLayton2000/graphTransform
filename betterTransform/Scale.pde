class Scale extends Event{
  float r;
  PVector cent;
  
  Scale(float r, int t){
    this(new PVector(0,0),r,t);
  }
  
  Scale(PVector p, float r, int t){
    super(t);
    this.cent = p;
    this.r = r;
  }
  
  Scale(float x, float y, float r, int t){
    this(new PVector(x,y),r,t);
  }
  
  PVector f(PVector p){
    return new PVector(r*p.x+(1-r)*cent.x,r*p.y+(1-r)*cent.y);
  }
}