class Shape implements Displayable{
  float hue;
  float alpha;
  float brightness;
  ArrayList<PVector> lastGoal = new ArrayList<PVector>();
  ArrayList<PVector> nextGoal = new ArrayList<PVector>();
  
  Shape(float hue, float alpha, float brightness){
    this.hue = hue;
    this.alpha = alpha;
    this.brightness = brightness;
  }
  
  Shape(float hue, float alpha){
    this(hue,alpha,255);
  }
  
  Shape(float hue){
    this(hue,0,255);
  }
  
  void addVertex(PVector p){
    lastGoal.add(p);
    nextGoal.add(p);
  }
  
  void addVertex(float x, float y){
    addVertex(new PVector(x,y));
  }
  
  int findVertex(PVector v){
    int i = 0;
    while (i < lastGoal.size()){
      PVector p = lastGoal.get(i);
      if (p.x == v.x && p.y == v.y){
        return i;
      }
      i++;
    }
    return -1;
  }
  
  PVector getVertex(int i){
    return lastGoal.get(i);
  }
  
  void moveOn(){
    lastGoal = new ArrayList<PVector>(nextGoal);
  }
  
  void setGoal(Event e){
    if (e == null) { return; }
    nextGoal = new ArrayList<PVector>();
    for (PVector v: lastGoal){
      nextGoal.add(e.f(v));
    }
  }

  void show(float t) {
    strokeWeight(1);
    colorMode(HSB);
    stroke(hue, 255, brightness);

    fill(hue, 255, brightness, alpha);
    beginShape();
    for (int i = 0; i < lastGoal.size(); i++){
      PVector u = lastGoal.get(i);
      PVector v = nextGoal.get(i);
      vertex(((1-t)*u.x+t*v.x)*scale,((1-t)*u.y+t*v.y)*scale);
    }

    if (alpha == 0) {
      endShape();
    } else {
      endShape(CLOSE);
    }
  }
}