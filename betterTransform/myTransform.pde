class myTransform extends Event{
  
  myTransform(int t){
    super(t);
  }
  
  PVector f(PVector p){
    
    float x = p.x;
    float y = p.y;
    
    //float nX = x*x*x-3*x*y*y;
    //float nY = 3*x*x*y - y*y*y;
    
    float nX = x-sin(y);
    float nY = y+sin(x);
    
    return new PVector(nX,nY);
  }
}