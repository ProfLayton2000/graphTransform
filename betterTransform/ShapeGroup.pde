class ShapeGroup implements Displayable{
  ArrayList<Displayable> shapes;
  
  ShapeGroup(){
    shapes = new ArrayList<Displayable>();
  }
  
  void addShape(Displayable d){
    shapes.add(d);
  }
  
  void show(float t){
    for (Displayable d: shapes){
      d.show(t);
    }
  }
  
  void setGoal(Event e){
    for (Displayable d: shapes){
      d.setGoal(e);
    }
  }
  
  void moveOn(){
    for (Displayable d: shapes){
      d.moveOn();
    }
  }
}