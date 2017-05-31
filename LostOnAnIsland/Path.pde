// Path leads from one location to another
// Locations kind of work like linked lists in that regard
import java.awt.geom.*;
import java.awt.Polygon;
import java.awt.*;

class Path{
  
  /*** VARIABLES ***/
  Location _destination; //which place this path links to
  Shape _shape; //Shape has a contains() method which makes boundaries and can be used to check if mouse or player is touching it
  float xcoor; //coordinates of the path on the screen
  float ycoor;
  
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
  
  //pre-condition: type should either be "door" or "hole"
  //easier to set up path this way instead of making the polygon externally
  Path(Location pathLeadsTo, float x, float y, String type){
    _destination = pathLeadsTo;
    //_shape = null;
    if(type.equals("door")){
      makeDoor(x, y);
    }
    else if(type.equals("hole")){
      makeHole(x, y);
    }
  }
  
  String toString(){
    String pathName = "Path to ";
    // _destination name
    return pathName;
  }
  
  //checks if x and y are within its shape's boundaries
  boolean contains(int x, int y){
    if(_shape == null) {
      System.out.println("no shape");
      return false;}
    else{
    return _shape.contains(x,y);}
  }
  
  void setDestination(Location place){
    _destination = place;
  }
  
  void setShape(int[] x, int[] y, int n){
    _shape = new Polygon(x, y, n);
  }
  
  // if the path is a door, makes a 30x50 rectangular polygon to contain bounds
  void makeDoor(float x, float y){
    xcoor = x;
    ycoor = y;
    int[] xcors = {(int) x, (int) (x + 30), (int) x, (int)(x + 30)};
    int[] ycors = {(int) y, (int) y, (int) (y + 50), (int) (y + 50)};
    _shape = new Polygon(xcors, ycors, 4);
  }
  
  // if you want to make a hole, it sets shape of the "path" to an ellipse w/ same height and width
  void makeHole(double x, double y){
    xcoor = (float) x;
    ycoor = (float) y;
    Ellipse2D.Double circle = new Ellipse2D.Double(x, y, 30, 30);
    _shape = circle;
  }
  
  
  void displayShape(){
    fill(245, 0, 155); //sets it bright pink so it will get noticed
    //checks if it's a door or hole
    if(_shape instanceof Polygon){
      rect(xcoor, ycoor, 30, 50);
    }
    else if(_shape instanceof Ellipse2D.Double){
      ellipseMode(CORNER);
      ellipse(xcoor, ycoor, 30, 30);
    }
  }
  
 Location getDestination(){
    // returns destination or null if there is no destination
    return _destination;
  }
  
}