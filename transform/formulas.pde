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
  //float dTheta = PVector.angleBetween(s,e);
  float theta = map(t,0.0,1.0,angle(s),angle(e));
  //theta += angle(s);
  
  float mag = map(t,0.0,1.0,s.mag(),e.mag());
  
  float nX = mag * cos(theta);
  float nY = mag * sin(theta);
  
  return new PVector(nX,nY);
}

float doubleCubicEasing(float t, float a){
  return cubicEasing(cubicEasing(t,a),a);
}

PVector function(PVector p){
  //if (p.x == 0 && p.y == 0){
  //  return new PVector(0.0001,0.0001);
  //}
  float nX =  p.x + p.y;
  float nY =  p.x - p.y;
  return new PVector(nX,nY);
}

//have option to change shape A permanently
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
  strokeWeight(3);
  if (A.getAlpha() > 0){
    fill(A.getHue(),255,255,200);
  } else{
    noFill();
  }
  for (int i = 0; i < divs; i++){
    PVector newV = lineMidpoint(A.getKthVertex(i),function(A.getKthVertex(i)),t);
    vertex(newV.x*scale,newV.y*scale);
  }
  if (A.getAlpha() > 0){
    endShape(CLOSE);
  } else{
    endShape();
  }
}

void showMidFormulaCurve(float divs, float t, Shape A, int scale){
  beginShape();
  colorMode(HSB);
  stroke(A.getHue(),255,255);
  strokeWeight(1);
  if (A.getAlpha() > 0){
    fill(A.getHue(),255,255,A.getAlpha());
  } else{
    noFill();
  }
  for (int i = 0; i < divs; i++){
    PVector newV = circleMidpoint(A.getKthVertex(i),function(A.getKthVertex(i)),t);
    vertex(newV.x*scale,newV.y*scale);
  }
  endShape();
  if (A.getAlpha() > 0){
    endShape(CLOSE);
  } else{
    endShape();
  }
}

void fadeIn(float t, int scale, Shape A){
  A.show(scale, map(t,0.0,1.0,0,255));
}

void fadeOut(float t, int scale, Shape A){
  A.show(scale, map(t,0.0,1.0,255,0));
}