class Morph extends Event{
  Shape start;
  Shape end;
  
  Morph(Shape s, Shape e, int t){
    super(t);
    start = s;
    end = e;
  }
  
  PVector f(PVector p){
    return f(start.findVertex(p));
  }
  
  PVector f(int i){
    return f(end.getVertex(i));
  }
}