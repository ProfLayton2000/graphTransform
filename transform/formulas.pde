PVector lineMidpoint(PVector s, PVector e, float t){
  float nX = (1-t)*s.x+t*e.x;
  float nY = (1-t)*s.y+t*e.y;
  return new PVector(nX,nY);
}

float cubicEasing(float t, float a){
  float bX = pow(1-t,3)*0 + 3*pow(1-t,2)*pow(t,1)*(1-a) + 3*pow(1-t,1)*pow(t,2)*a + pow(t,3);
  return bX;
}

float angle(PVector p){
  PVector xLine = new PVector(1,0);
  float angle = PVector.angleBetween(p,xLine);
  if (p.y < 0) angle *= -1;
  return angle;
}

PVector circleMidpoint(PVector s, PVector e, float t){
  PVector p1 = new PVector (dist(s.x,s.y,0,0),angle(s));
  PVector p2 = new PVector (dist(e.x,e.y,0,0),angle(e));
  
  PVector nP = lineMidpoint(p1,p2,t);
  float nX = nP.x * cos(nP.y);
  float nY = nP.x * sin(nP.y);
  
  return new PVector(nX,nY);
}

float doubleCubicEasing(float t, float a){
  return cubicEasing(cubicEasing(t,a),a);
}

PVector function(PVector p){
  float nX = p.x*p.x*p.x - 3*p.x*p.y*p.y;
  float nY = 3*p.x*p.x*p.y - p.y*p.y*p.y;
  //float nX = p.y;
  //float nY = p.x;
  return new PVector(nX,nY);
}

void showMidgraph(float divs, float t, Shape A, Shape B, int scale){
  beginShape();
  colorMode(HSB);
  stroke(map(t,0.0,1.0,A.getHue(), B.getHue()),255,255);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < divs; i++){
    PVector newV = lineMidpoint(A.getKthVertex(i),B.getKthVertex(i),t);
    //ellipse(newV.x,newV.y,3,3);
    vertex(newV.x*scale,newV.y*scale);
  }
  endShape();
}

void showMidFormulaLine(float divs, float t, Shape A, int scale){
  beginShape();
  colorMode(HSB);
  stroke(A.getHue(),255,255);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < divs; i++){
    PVector newV = lineMidpoint(A.getKthVertex(i),function(A.getKthVertex(i)),t);
    vertex(newV.x*scale,newV.y*scale);
  }
  endShape();
}

void showMidFormulaCurve(float divs, float t, Shape A, int scale){
  beginShape();
  colorMode(HSB);
  stroke(A.getHue(),255,255);
  strokeWeight(1);
  noFill();
  for (int i = 0; i < divs; i++){
    PVector newV = circleMidpoint(A.getKthVertex(i),function(A.getKthVertex(i)),t);
    vertex(newV.x*scale,newV.y*scale);
  }
  endShape();
}
