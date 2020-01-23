class Timeline{
  int currTime = 0;
  Event currEvent;
  ArrayList<Event> events = new ArrayList<Event>();
  ArrayList<Displayable> shapes = new ArrayList<Displayable>();
  
  void addEvent(Event e){
    events.add(e);
  }
  
  void addDisplayable(Displayable d){
    shapes.add(d);
  }
  
  void reset(){
    if (isEmpty()) { return; }
    currEvent = events.remove(0);
    for (Displayable d: shapes){
      d.moveOn();
      d.setGoal(currEvent);
    }
  }
  
  void tick(){
    currTime++;
    if (currEvent != null && !currEvent.inTime(currTime)){
      println("MOVING ON");
      currTime = 0;
      currEvent = (isEmpty()) ? null : events.remove(0);
      for (Displayable d: shapes){
        d.moveOn();
        d.setGoal(currEvent);
      }
    }
    float t;
    if (currEvent != null) { 
      t = map(currTime,0,currEvent.getTime(),0.0,1.0);
      t = cubicEasing(doubleCubicEasing(t));
      //println("Current time: "+currTime,"doing "+currEvent.toString());
    } else {
      t = 1.0;
    }
    for (Displayable d: shapes){
      d.show(t);
    }
  }
  
  PVector f(PVector p){
    return currEvent.f(p);
  }
  
  boolean isEmpty(){
    return events.size() == 0;
  }
  
  boolean finished(){
    return currEvent == null;
  }
  
  float cubicEasing(float t) {
    return + 3*pow(1-t, 1)*pow(t, 2) + pow(t, 3);
  }
  
  float doubleCubicEasing(float t) {
    return cubicEasing(cubicEasing(t));
  }
}