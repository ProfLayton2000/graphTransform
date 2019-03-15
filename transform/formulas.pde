PVector weightedMidpoint(PVector s, PVector e, float t){
  float nX = (1-t)*s.x+t*e.x;
  float nY = (1-t)*s.y+t*e.y;
  return new PVector(nX,nY);
}

float cubicEasing(float t, float a){
  float bX = pow(1-t,3)*0 + 3*pow(1-t,2)*pow(t,1)*(1-a) + 3*pow(1-t,1)*pow(t,2)*a + pow(t,3);
  return bX;
}

float doubleCubicEasing(float t, float a){
  return cubicEasing(cubicEasing(t,a),a);
}

PVector function(PVector p){
  float nX = p.y+sin(p.x);
  float nY = p.x+sin(p.y);
  return new PVector(nX,nY);
}

void showMidgraph(float divs, float t, Shape A, Shape B, int scale){
  beginShape();
  colorMode(HSB);
  stroke(map(t,0.0,1.0,A.getHue(), B.getHue()),255,255);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < divs; i++){
    PVector newV = weightedMidpoint(A.getKthVertex(i),B.getKthVertex(i),t);
    //ellipse(newV.x,newV.y,3,3);
    vertex(newV.x*scale,newV.y*scale);
  }
  endShape();
}

void showMidFormula(float divs, float t, Shape A, int scale){
  beginShape();
  colorMode(HSB);
  stroke(map(t,0.0,1.0,A.getHue(), A.getHue()+100),255,255);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < divs; i++){
    PVector newV = weightedMidpoint(A.getKthVertex(i),function(A.getKthVertex(i)),t);
    //ellipse(newV.x,newV.y,3,3);
    vertex(newV.x*scale,newV.y*scale);
  }
  endShape();
}
