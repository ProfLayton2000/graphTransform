class Sine extends Shape {
  Sine(int h, float w, int amp, float freq) {
    hue = h;
    for (int i = 0; i < divs; i++) {
      float t = 1.0*i/divs;
      float x = map(t, 0.0, 1.0, -1.0*w, 1.0*w);
      float y = amp*sin(x*freq);
      //x *= w/(2*PI);
      vertices.add(new PVector(x, y));
    }
  }
}