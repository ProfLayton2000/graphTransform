class InGrid extends ShapeGroup{
  InGrid(int xBound, int yBound, float xHue, float yHue, float brightness){
    for (int i = -xBound; i <= xBound; i++){
      if (i == 0) { continue; }
      addShape(new Line(1.0/i,yBound,1.0/i,-yBound,xHue, brightness));
    }
    
    for (int i = -yBound; i <= yBound; i++){
      if (i == 0) { continue; }
      addShape(new Line(xBound,1.0/i,-xBound,1.0/i,yHue, brightness));
    }
  }
  
  InGrid(int xBound, int yBound, float xHue, float yHue){
    this(xBound,yBound,xHue,yHue,255);
  }
}