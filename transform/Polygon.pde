//Should the coordinates be given as PVectors?
  //Yeah
class Polygon extends Shape {
  //Method:
    //Find number of points provided, it will automatically close
    //Distribute the number of divs accordingly
      //Needs to be a whole number
      //Assume it closes
      //Make special case for the last side
      //Assume at least 3 points given I.e. not a straight line and back
  Polygon(int h, ArrayList<PVector> points, float a){
    hue = h;
    alpha = a;
    
    int nSides = points.size();
    int normalDist = floor(divs/nSides);
    for (int i = 0; i < nSides-1; i++){
      for (int j = 0; j < normalDist; j++){
        float t = 1.0*j/normalDist;
        vertices.add(lineMidpoint(points.get(i), points.get(i+1), t));
      }
    }
    int remainingDivs = divs - (nSides-1)*normalDist;
    for (int j = 0; j < remainingDivs; j++){
      float t = 1.0*j/normalDist;
      vertices.add(lineMidpoint(points.get(points.size()-1), points.get(0), t));
    }
  }
}