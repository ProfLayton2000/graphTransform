class Circle extends Shape{
  Circle(int divs, int h, PVector cent, float r, float alpha){
    hue = h;
    alpha = 255;
    for (int i = 0; i <= divs; i++){
      float t = 1.0*i/divs;
      float angle = map(t,0.0,1.0,0,2*PI);
      vertices.add(new PVector(r*cos(angle)+cent.x,r*sin(angle)+cent.y));
    }
  }
}