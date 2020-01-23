class Grid extends ShapeGroup{
  Grid(int xBound, int yBound, float xHue, float yHue, float brightness){
    for (int i = -xBound; i <= xBound; i++){
      addShape(new Line(i,yBound,i,-yBound,xHue, brightness));
    }
    
    for (int i = -yBound; i <= yBound; i++){
      addShape(new Line(xBound,i,-xBound,i,yHue, brightness));
    }
  }
  
  Grid(int xBound, int yBound, float xHue, float yHue){
    this(xBound,yBound,xHue,yHue,255);
  }
}