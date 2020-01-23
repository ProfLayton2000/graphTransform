class Line extends Shape{
  Line(PVector s, PVector e, float hue, float brightness){
    super(hue,0,brightness);
    for (int i = 0; i <= divs; i++){
      float t = 1.0*i/divs;
      addVertex((1-t)*s.x+t*e.x,(1-t)*s.y+t*e.y);
    }
  }
  
  Line(PVector s, PVector e, float hue){
    this(s,e,hue,255);
  }
  
  Line(float x1, float y1, float x2, float y2, float hue){
    this(x1,y1,x2,y2,hue,255);
  }
  
  Line(float x1, float y1, float x2, float y2, float hue, float brightness){
    this(new PVector(x1,y1), new PVector(x2,y2), hue, brightness);
  }
}