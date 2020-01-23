boolean save = !true;
String name = "spiral";
int divs = 500; //Resolution
int scale = 100; //#pixels is 1 unit
int bound = 20;
int frame = 0;
int totalFrames = 300;

ArrayList<Line> horizontals = new ArrayList<Line>();
ArrayList<Line> verticals = new ArrayList<Line>();
//ArrayList<Circle> circles = new ArrayList<Circle>();

ArrayList<Shape> shapes = new ArrayList<Shape>();
//ax + by + c = 0
//by = -ax - c
//y = -(ax+c)/b

//float a = 3;
//float b = 1;
//float c = -4;
//float p = -5;
//float q = 5;
//Line l1 = new Line(80, new PVector(p, -(a*p+c)/b), new PVector(q, -(a*q+c)/b));

//Line l2 = new Line(50, new PVector(0, 0), new PVector(1, 0));
//Sine s1 = new Sine(120, PI, 1, 2);
//Polygon P1;
//Polygon P2;

void setup() {
  size(1400, 800);
  //frameRate(120);
  int nX = ceil(width/(2*scale)) + 2;
  bound = ceil(height/scale) + 2;
  for (int i = -nX; i < nX; i++) {
    verticals.add(new Line(150, new PVector(i, -bound), new PVector(i, bound)));
    //verticals.add(new Line(150, new PVector(1.0/i, -bound), new PVector(1.0/i, bound)));
  }

  int nY = ceil(height/(2*scale)) + 2;
  //int nY = 4;
  for (int i = -nY; i < nY; i++) {
    horizontals.add(new Line(0, new PVector(-bound, i), new PVector(bound, i)));
    //horizontals.add(new Line(0, new PVector(-bound, 1.0/i), new PVector(bound, 1.0/i)));
  }
  
  shapes.add(new Circle(200, new PVector(0, 0), 2, 50));
  //shapes.add(new Circle(50, new PVector(-2, -2), 1, 100));
  //shapes.add(new Circle(100, new PVector(2, -2), 1, 150));
  //shapes.add(new Circle(100, new PVector(-2, 2), 1, 200));
  
  //ArrayList<PVector> points = new ArrayList<PVector>();
  //float s = 0.1;
  //points.add(new PVector(1+s,1+s));
  //points.add(new PVector(1+s,1-s));
  //points.add(new PVector(1-s,1-s));
  //points.add(new PVector(1-s,1+s));
  
  //P1 = new Polygon(100,points,100);

  smooth();
}

PVector function(PVector p) {
  //if (p.x == 0 && p.y == 0){
  //  return function(new PVector (0.001,0.001));
  //}
  float x = p.x;
  float y = p.y;
  
  //float nX = x - 2*a*(a*x+b*y+c)/(a*a+b*b);
  //float nY = y - 2*b*(a*x+b*y+c)/(a*a+b*b);
  
  float nX = x/sqrt(x*x+y*y);
    float nY = -y/sqrt(x*x+y*y);
  
  //float nX = x+2*y;
  //float nY = -0.5*x + y;
  
  return new PVector(nX, nY);
}

void draw() {
  if (frame > totalFrames) {
    println("Finished");
    noLoop();
    if (save) exit();
    return;
  }
  translate(width/2, height/2);
  scale(1, -1); //flip x and y graphs to normal

  float t = (1.0*frame/(1.0*totalFrames));
  t = doubleCubicEasing(t);

  background(0);
  backGraph(true);

  for (Line l: horizontals){
    showMidFormulaLine(t,l);
  }

  for (Line l: verticals){
    showMidFormulaLine(t,l);
  }

  for (Shape s: shapes) {
    showMidFormulaLine(t,s);
  }
  


  if (save) saveFrame("output/rawOutput/"+name+"/"+name+"_####.png");
  println("Done frame "+str(frame));
  frame++;
}