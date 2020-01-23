boolean save = !true;
String name = "sqrt";
float scale = 50;
int divs = 1000;

Timeline t1;
Timeline stat;
void setup(){
  size(800,800);
  background(0);
  
  t1 = new Timeline();
  stat = new Timeline();
  
  //t1.addDisplayable(new Grid(8,8,0,150));
  //t1.addDisplayable(new Point(1,1,0));
  //t1.addDisplayable(new InGrid(7,7,0,150));
  //t1.addDisplayable(new Circle(0,0,2,50));
  
  ArrayList<PVector> points = new ArrayList<PVector>();
  points.add(new PVector(1,1));
  points.add(new PVector(1,-1));
  points.add(new PVector(-1,-1));
  points.add(new PVector(-1,1));
  
  Polygon sq = new Polygon(points,240);
  Circle c = new Circle(0,0,2,50);
  t1.addDisplayable(sq);
  t1.addDisplayable(c);
  
  stat.addDisplayable(new Grid(10,7,0,0,100));
   
  
  t1.addEvent(new Translate(1,1,50));
  t1.addEvent(new Rotate(PI/2,50));
  //for (int i = 0; i < 100; i++){
  t1.addEvent(new myTransform(100));
  //t1.addEvent(new Morph(sq,c,100));
  //  t1.addEvent(new Rotate(2*PI/3,50));
  //  t1.addEvent(new Translate(1,1,50));
  //}
  
  t1.reset();
  stat.reset();
  
  smooth(4);
}

void draw(){
  translate(width/2,height/2);
  scale(1,-1);
  background(0);
  
  stat.tick();
  t1.tick();
  
  if (save) saveFrame("output/rawOutput/"+name+"/"+name+"_####.png");
  if (t1.finished() && save) { exit(); }
}