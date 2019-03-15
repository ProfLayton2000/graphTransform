class Line extends Shape{
  Line(int divs, int h, PVector s, PVector e){
    hue = h;
    for (int i = 0; i < divs; i++){
      float t = 1.0*i/divs;
      vertices.add(weightedMidpoint(s,e,t));
    }
  }
}
