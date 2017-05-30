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
  
  Path(Location destination, float xcoor, float ycoor){
    _destination = destination;
    makeDoor(xcoor, ycoor);
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
  
  void makeDoor(float xcoor, float ycoor){
    int[] x = {(int)xcoor, (int) (xcoor + 10)};
    int[] y = {(int)ycoor, (int) (ycoor + 20)};
    setShape(x, y, 4);
    fill((int) Math.random() * 255);
    rect(xcoor, ycoor, 10, 20);
  }
  
 Location getDestination(){
    // returns destination
    //return null;
    return _destination;
  }
  
}