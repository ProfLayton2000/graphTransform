class Shape{
  int divs;        //Number of divisions, higher = more resolution
  int hue;
  
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  
  void show(float t,int scale){
    strokeWeight(1);
    colorMode(HSB);
    stroke(map(t,0.0,1.0,150,300),255,255);
    beginShape();
    noFill();
    for (PVector v : vertices){
      vertex(v.x*scale,v.y*scale);
    }
    endShape();
  }
  
  PVector getKthVertex(int k){
    return vertices.get(k);
  }
  
  int getHue(){
    return hue;
  }
  
}
