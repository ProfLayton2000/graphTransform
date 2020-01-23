class Shape {
  int hue;
  float alpha;

  ArrayList<PVector> vertices = new ArrayList<PVector>();

  void show() {
    strokeWeight(1);
    colorMode(HSB);
    stroke(hue, 255, 255);

    fill(hue, 255, 255, alpha);
    beginShape();
    for (PVector v : vertices) {
      vertex(v.x*scale, v.y*scale);
    }

    if (alpha == 0) {
      endShape();
    } else {
      endShape(CLOSE);
    }
  }

  PVector getKthVertex(int k) {
    return vertices.get(k);
  }

  int getHue() {
    return hue;
  }

  float getAlpha() {
    return alpha;
  }
}