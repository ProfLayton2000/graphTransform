PVector weightedMidpoint(PVector s, PVector e, float t){
  float nX = (1-t)*s.x+t*e.x;
  float nY = (1-t)*s.y+t*e.y;
  return new PVector(nX,nY);
}

//find out where p is supposed to go
PVector shapePoint(float t){
  //return sinePoint(1920,500,t);
  return circlePoint(300,t);
  //return linePoint(new PVector(-400,-400),new PVector(400,400),t);
}

PVector circlePoint(int r, float t){
  float angle = map(t,0.0,1.0,0,2*PI);
  return new PVector(r*cos(angle),r*sin(angle));
}

PVector linePoint(PVector s, PVector e, float t){
  return weightedMidpoint(s,e,t);
}

PVector sinePoint(int width,int amp, float t, int freq){
  float x = map(t,0.0,1.0,-PI*freq,PI*freq);
  float y = amp*sin(x);
  x *= width/(2*freq*PI);
  return new PVector(x,y);
}

float cubicEasing(float t, float a){
  float bX = pow(1-t,3)*0 + 3*pow(1-t,2)*pow(t,1)*(1-a) + 3*pow(1-t,1)*pow(t,2)*a + pow(t,3);
  return bX;
}

float doubleCubicEasing(float t, float a){
  return cubicEasing(cubicEasing(t,a),a);
}