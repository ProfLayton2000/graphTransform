class Polygon extends Shape{
  Polygon(ArrayList<PVector> points, float hue){
    super(hue,100);
    int nSides = points.size();
    int normalDist = floor(divs/nSides);
    
    PVector u,v;
    for (int i = 0; i < nSides-1; i++){
      for (int j = 0; j < normalDist; j++){
        float t = 1.0*j/normalDist;
        u = points.get(i);
        v = points.get(i+1);
        addVertex((1-t)*u.x + t*v.x, (1-t)*u.y + t*v.y);
      }
    }
    int remainingDivs = divs - (nSides-1)*normalDist;
    u = points.get(points.size()-1);
    v = points.get(0);
    for (int j = 0; j < remainingDivs; j++){
      float t = 1.0*j/normalDist;
      addVertex((1-t)*u.x + t*v.x, (1-t)*u.y + t*v.y);
    }
  }
}