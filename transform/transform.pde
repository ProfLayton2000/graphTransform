int save = 1;

int frame = 0;
int totalFrames = 150;

int res = 8000;
int scale = 100; //100 pixels is 1 unit
int bound = 1000;

ArrayList<Line> horizontals = new ArrayList<Line>();
ArrayList<Line> verticals = new ArrayList<Line>();

void setup(){
  size(1920,1080);
  //frameRate(120);
  int nX = 25;
  for (int i = -nX; i < nX; i++){
    horizontals.add(new Line(res, 100, new PVector(-bound,i), new PVector(bound,i)));
  }
  
  int nY = 15;
  for (int i = -nY; i < nY; i++){
    horizontals.add(new Line(res, 0, new PVector(i,-bound), new PVector(i,bound)));
  }
  
}

//Line   l1 = new 

//Sine   l2 = new Sine(res, 100, 1, 1, 2);
//Circle l3 = new Circle(res, 0, 2);
//Sine   l4 = new Sine(res, 150, 14, 1, 50);

void draw(){
  if (frame > totalFrames){
    noLoop();
    exit();
  }
  background(0);
  translate(width/2,height/2);
  scale(1,-1); //flip x and y graphs to normal
  
  backGraph(scale,1);
  
  float t = (1.0*frame)/(1.0*totalFrames);
  t = doubleCubicEasing(t,1);
  
  //l2.show(1,scale);
  
  //showMidgraph(res,t,l4,l2,scale);
  for (Line l: horizontals){
    showMidFormula(res,t,l,scale);
  }
  
  for (Line l: verticals){
    showMidFormula(res,t,l,scale);
  }
  if (save == 1) saveFrame("output/rawOutput/functionExample/functionExample_####.png");
  frame++;
}
