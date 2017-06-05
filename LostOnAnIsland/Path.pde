// Path leads from one location to another
// Locations kind of work like linked lists in that regard
import java.awt.geom.*;
import java.awt.Rectangle;
import java.awt.*;

class Path{
  
  /*** VARIABLES ***/
  Location _destination; //which place this path links to
  Shape _shape; //Shape has a contains() method which makes boundaries and can be used to check if mouse or player is touching it
  float xcoor; //coordinates of the path on the screen
  float ycoor;
  color c;
  int shapeID; // 0 for circle, 1 for rec, 2 for mapIcon
  
  Path(){
    _destination = null;
    shapeID = -1;
  }
  
  Path( Location pathLeadsTo, Polygon shapeOfEntrance ){
    _destination = pathLeadsTo;
    _shape = shapeOfEntrance;
    shapeID = -1;
  }
  
  Path(Location pathLeadsTo){
    _destination = pathLeadsTo;
    _shape = null;
    shapeID = -1;
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
    else if(type.equals("mapIcon")){
      mapIcon(x,y);
    }
  }
  
  String toString(){
    return "Path to " + getDestination();
  }
  
  //checks if x and y are within its shape's boundaries
  boolean contains(int x, int y){
    if(_shape == null) {
      System.out.println("no shape");
      return false;}
    else{
    return _shape.contains(x,y);}
  }
  
  boolean contains(int x, int y, int radius){
    if(_shape != null){
      if(_shape.contains(x + 20, y + 25)) {
        return true;
      }
    }
      return false;
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
    _shape = new Rectangle((int)xcoor, (int)ycoor, 30, 50);
  //  shapeID = 1;
  }
  
  // if you want to make a hole, it sets shape of the "path" to an ellipse w/ same height and width
  void makeHole(double x, double y){
    xcoor = (float) x;
    ycoor = (float) y;
    Ellipse2D.Double circle = new Ellipse2D.Double(x, y, 30, 30);
    _shape = circle;
  //  shapeID = 0;
  }
  
  void mapIcon(float x, float y){
    xcoor = x;
    ycoor = y;
    int[] xcors = {(int) x, (int) (x + 48), (int) x, (int)(x + 48)};
    int[] ycors = {(int) y, (int) y, (int) (y + 48), (int) (y + 48)};
    _shape = new Polygon(xcors, ycors, 4);
    shapeID = 2;
  }
  
  void hovering(){
    if( contains(mouseX,mouseY) ){ text( toString(), xcoor, ycoor - 50 ); }
  }
  
  void displayShape(){
    stroke(0);
    fill(245, 0, 155); //sets it bright pink so it will get noticed
    //checks if it's a door or hole
    if( _shape instanceof Rectangle){ //_shape instanceof Polygon){
      rect(xcoor, ycoor, 30, 50);
    }
    else if( _shape instanceof Ellipse2D.Double ){ //_shape instanceof Ellipse2D.Double){
      ellipseMode(CORNER);
      ellipse(xcoor, ycoor, 30, 30);
    }
    else if( _shape instanceof Polygon ){
      image( loadImage("map.png"),xcoor,ycoor,48,48);
    }
  }
  
 Location getDestination(){
    // returns destination or null if there is no destination
    return _destination;
  }
  
}