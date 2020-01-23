PVector lineMidpoint(PVector s, PVector e, float t) {
  float nX = (1-t)*s.x+t*e.x;
  float nY = (1-t)*s.y+t*e.y;
  return new PVector(nX, nY);
}

float cubicEasing(float t) {
  return + 3*pow(1-t, 1)*pow(t, 2) + pow(t, 3);
}

float doubleCubicEasing(float t) {
  return cubicEasing(cubicEasing(t));
}

//have option to change shape A permanently
void showMidgraphLine(float t, Shape A, Shape B) {
  beginShape();
  colorMode(HSB);
  stroke(map(t, 0.0, 1.0, A.getHue(), B.getHue()), 255, 255);
  strokeWeight(1);
  float newAlpha = (1-t)*A.getAlpha() + t*B.getAlpha();
  float newHue = (1-t)*A.getHue() + t*B.getHue();
  if (newAlpha > 0) {
    fill(newHue, 255, 255, newAlpha);
  } else {
    noFill();
  }
  for (int i = 0; i < divs; i++) {
    PVector newV = lineMidpoint(A.getKthVertex(i), B.getKthVertex(i), t);
    //ellipse(newV.x,newV.y,3,3);
    vertex(newV.x*scale, newV.y*scale);
  }
  endShape();
}

void showMidFormulaLine(float t, Shape A) {
  beginShape();
  colorMode(HSB);
  stroke(A.getHue(), 255, 255);
  strokeWeight(1);
  if (A.getAlpha() > 0) {
    fill(A.getHue(), 255, 255, A.getAlpha());
  } else {
    noFill();
  }
  for (int i = 0; i < divs; i++) {
    PVector newV = lineMidpoint(A.getKthVertex(i), function(A.getKthVertex(i)), t);
    //ellipse(newV.x,newV.y,3,3);
    vertex(newV.x*scale, newV.y*scale);
  }
  if (A.getAlpha() > 0) {
    endShape(CLOSE);
  } else {
    endShape();
  }
}