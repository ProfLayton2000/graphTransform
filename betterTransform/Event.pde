abstract class Event {
  int time = 0;
  
  Event(int t){
    time = t;
  }
  
  int getTime(){
    return time;
  }
  
  boolean inTime(float t){
    return 0 <= t && t < time;
  }
  
  abstract PVector f(PVector p);
}