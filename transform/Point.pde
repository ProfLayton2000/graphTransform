//class Point{
//  PVector p;

//  Point(PVector point){
//    p = point;
//  }
//  PVector getP(){
//    return p;
//  }
//}

void showPoint(PVector p) {
  colorMode(HSB);
  fill(40, 255, 255, 100);
  stroke(40, 255, 255);
  strokeWeight(1);
  ellipse(p.x*scale, p.y*scale, 10, 10);
}