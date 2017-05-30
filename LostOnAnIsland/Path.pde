// Path leads from one location to another
class Path{
  
  /*** VARIABLES ***/
  Location _destination;
  Polygon _shape;
  
  Path(){
    _destination = null;
  }
  
  Path( Location pathLeadsTo, Polygon shapeOfEntrance ){
    _destination = pathLeadsTo;
    _shape = shapeOfEntrance;
  }
  
  Path(Location pathLeadsTo){
    _destination = pathLeadsTo;
    _shape = null;
  }
  
  String toString(){
    String pathName = "Path to ";
    // _destination name
    return pathName;
  }
  
  boolean contains(int x, int y){
    return _shape.contains(x,y);
  }
  
  void setDestination(Location place){
    _destination = place;
  }
  
  void setShape(int[] x, int[] y, int n){
    _shape = new Polygon(x, y, n);
  }
  
 Location getDestination(){
    // returns destination
    //return null;
    return _destination;
  }
  
}