int save = 1;

int frame = 0;
int totalFrames = 150;

int res = 8000;
int scale = 50; //100 pixels is 1 unit
int bound = 10;

ArrayList<Line> horizontals = new ArrayList<Line>();
ArrayList<Line> verticals = new ArrayList<Line>();
//ArrayList<Circle> circles = new ArrayList<Circle>();

void setup(){
  size(1920,1080);
  //frameRate(120);
  int nX = ceil(width/(2*scale)) + 2;
  bound = ceil(height/scale) + 2;
  for (int i = -nX; i < nX; i++){
    verticals.add(new Line(res, 150, new PVector(i,-bound), new PVector(i,bound)));
  }
  
  int nY = ceil(height/(2*scale)) + 2;
  //int nY = 4;
  for (int i = -nY; i < nY; i++){
    horizontals.add(new Line(res, 0, new PVector(-bound,i), new PVector(bound,i)));
  }
  
  //for (int i = 1; i < nX; i++){
  //  circles.add(new Circle(res,200,i));
  //}
  
}

//Line   l1 = new 

//Sine   l2 = new Sine(res, 100, 1, 1);
Circle l3 = new Circle(res, 200, 2);
//Sine   l4 = new Sine(res, 150, 14, 1, 50);

void draw(){
  if (frame > totalFrames){
    noLoop();
    if (save == 1) exit();
  }
  background(0);
  translate(width/2,height/2);
  scale(1,-1); //flip x and y graphs to normal
  
  backGraph(scale,1);
  
  float t = (1.0*frame)/(1.0*totalFrames);
  t = doubleCubicEasing(t,1);
  
  for (Line l: horizontals){
    showMidFormulaLine(res,t,l,scale);
  }
  
  for (Line l: verticals){
    showMidFormulaLine(res,t,l,scale);
  }
  
  //for (Circle l: circles){
  //  showMidFormulaLine(res,t,l,scale);
  //}
  
  if (save == 1) saveFrame("output/rawOutput/z^3/z^3_####.png");
  frame++;
}
