void showMidgraphCurve(float t, Shape A, Shape B) {
  beginShape();
  colorMode(HSB);
  stroke(map(t, 0.0, 1.0, A.getHue(), B.getHue()), 255, 255);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < divs; i++) {
    PVector newV = circleMidpoint(A.getKthVertex(i), B.getKthVertex(i), t);
    //ellipse(newV.x,newV.y,3,3);
    vertex(newV.x*scale, newV.y*scale);
  }
  endShape();
}

float angle(PVector p) {
  PVector xLine = new PVector(1, 0);
  float angle = PVector.angleBetween(p, xLine);
  if (p.y < 0) angle *= -1;
  return angle;
}

PVector circleMidpoint(PVector s, PVector e, float t) {
  //float dTheta = PVector.angleBetween(s,e);
  float theta = map(t, 0.0, 1.0, angle(s), angle(e));
  //theta += angle(s);

  float mag = map(t, 0.0, 1.0, s.mag(), e.mag());

  float nX = mag * cos(theta);
  float nY = mag * sin(theta);

  return new PVector(nX, nY);
}


void showMidFormulaCurve(float t, Shape A) {
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
    PVector newV = circleMidpoint(A.getKthVertex(i), function(A.getKthVertex(i)), t);
    vertex(newV.x*scale, newV.y*scale);
  }
  endShape();
  if (A.getAlpha() > 0) {
    endShape(CLOSE);
  } else {
    endShape();
  }
}