class Shape{
  int divs;        //Number of divisions, higher = more resolution
  
  ArrayList<PVector> startVertices = new ArrayList<PVector>();
  ArrayList<PVector> endVertices = new ArrayList<PVector>();
  
  Shape(PVector start, PVector end, int res){
    divs = res;
    
    for (int i = 0; i <= divs; i++){
      float t = (1.0*i)/(1.0*divs);
      startVertices.add(circlePoint(500,t));
      endVertices.add(sinePoint(1000,200,t,3));
    }
  }
  
  void show(int showDots, float t){
    strokeWeight(1);
    colorMode(HSB);
    stroke(map(t,0.0,1.0,150,300),255,255);
    beginShape();
    noFill();
    for (int i = 0; i <= divs; i++){
      PVector point = weightedMidpoint(startVertices.get(i),endVertices.get(i),t);
      vertex(point.x,point.y);
    }
    endShape();
  }
  
}