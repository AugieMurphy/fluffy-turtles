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
  
  String toString(){
    String pathName = "Path to ";
    // _destination name
    return pathName;
  }
  
  boolean contains(int x, int y){
    return _shape.contains(x,y);
  }
  
  void setDestination(){
    // assigns destination
  }
  
 Location getDestination(){
    // returns destination
    return null;
  }
  
}