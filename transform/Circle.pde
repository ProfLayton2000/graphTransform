class Circle extends Shape{
  Circle(int divs, int h, int r){
    hue = h;
    for (int i = 0; i <= divs; i++){
      float t = 1.0*i/divs;
      float angle = map(t,0.0,1.0,0,2*PI);
      vertices.add(new PVector(r*cos(angle),r*sin(angle)));
    }
  }
}
