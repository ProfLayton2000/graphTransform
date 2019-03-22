class Shape{
  int divs;        //Number of divisions, higher = more resolution
  int hue;
  float alpha = 0;
  
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  
  void show(int scale, float newAlpha){
    strokeWeight(1);
    colorMode(HSB);
    stroke(hue,255,255);
    
    alpha = newAlpha;
    
    beginShape();
    fill(hue,255,255,alpha);
    for (PVector v : vertices){
      vertex(v.x*scale,v.y*scale);
    }
    
    if (alpha == 0){
      endShape();
    } else{
      endShape(CLOSE);
    }
    
  }
  
  PVector getKthVertex(int k){
    return vertices.get(k);
  }
  
  int getHue(){
    return hue;
  }
  
  float getAlpha(){
    return alpha;
  }
  
}