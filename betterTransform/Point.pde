class Point implements Displayable{
  float hue;
  PVector u;
  PVector v;
  
  Point(PVector p, float hue){
    this.u = p;
    this.v = p;
    this.hue = hue;
  }
  
  Point(float x, float y, float hue){
    this(new PVector(x,y),hue);
  }
  
  void show(float t){
    colorMode(HSB);
    noStroke();
    fill(hue,255,255);
    ellipse(((1-t)*u.x+t*v.x)*scale,((1-t)*u.y+t*v.y)*scale,10,10);
  }
  
  void setGoal(Event e){
    if (e == null) { return; }
    //v = new PVector(u.x,u.y);
    v = e.f(u);
  }
  
  void moveOn(){
    u = new PVector(v.x,v.y);
  }
}