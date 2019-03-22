int save = 0;

int frame = 0;

int res = 100;
int scale = 50; //100 pixels is 1 unit
int bound = 20;

ArrayList<Line> horizontals = new ArrayList<Line>();
ArrayList<Line> verticals = new ArrayList<Line>();
//ArrayList<Circle> circles = new ArrayList<Circle>();

void setup(){
  size(1400,800);
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

//Line   l1 = new Line(res,180, new PVector(-bound,0), new PVector(bound,0));
Line   l1 = new Line(res,100, new PVector(0,1), new PVector(1,0));
Line   l2 = new Line(res,180, new PVector(1,0), new PVector(2,1));
Line   l3 = new Line(res,180, new PVector(2,1), new PVector(1,2));
Line   l4 = new Line(res,180, new PVector(1,2), new PVector(0,1));
 
//Circle l2 = new Circle(res, 150, new PVector (4,3), 1, true);

int[] sceneTimes = {1,100};
int sceneNo = 0;
int sceneLength = 0;
int sceneStart = 0;

void draw(){
  if (frame > sceneTimes[sceneTimes.length - 1]){
    println("Finished");
    noLoop();
    if (save == 1) exit();
    return;
  }
  
  if (frame > sceneTimes[sceneNo]){
    sceneNo++;
    println("New scene");
    sceneLength = sceneTimes[sceneNo] - sceneTimes[sceneNo-1];
    sceneStart = sceneTimes[sceneNo-1];
  }
  
  translate(width/2,height/2);
  scale(1,-1); //flip x and y graphs to normal
  
  //backGraph(scale,1);
  
  float t = (1.0*(frame-sceneStart)/(1.0*sceneLength));
  t = doubleCubicEasing(t,1);
  
  
  //Figure out scene number
  if (sceneNo == 1){
    background(0);
    backGraph(scale, 1);
    
    for (Line l: horizontals){
      showMidFormulaLine(res,t,l,scale);
    }
    
    for (Line l: verticals){
      showMidFormulaLine(res,t,l,scale);
    }
    
    showMidFormulaLine(res,t,l1,scale);
    showMidFormulaLine(res,t,l2,scale);
    showMidFormulaLine(res,t,l3,scale);
    showMidFormulaLine(res,t,l4,scale);
    //showMidgraph(res,t,l2,l1,scale);
    //l3.show(scale,255);
    //l2.show(scale,0);
    
  }
  
  
  if (save == 1) saveFrame("output/rawOutput/q134/q134_####.png");
  println("Done frame "+str(frame));
  frame++;
}