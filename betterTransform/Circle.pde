class Circle extends Shape{
  Circle(PVector p, float r, float hue){
    super(hue,100);
    for (int i = 0; i <= divs; i++){
      float c = map(i,0,divs,0,2*PI);
      addVertex(p.x+r*cos(c),p.y+r*sin(c));
    }
  }
  
  Circle(float x, float y, float r, float hue){
    this(new PVector(x,y), r, hue);
  }
}