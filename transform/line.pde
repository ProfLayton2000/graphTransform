class Line extends Shape {
  Line(int h, PVector s, PVector e) {
    hue = h;
    alpha = 0;
    for (int i = 0; i < divs; i++) {
      float t = 1.0*i/divs;
      vertices.add(lineMidpoint(s, e, t));
    }
  }
}