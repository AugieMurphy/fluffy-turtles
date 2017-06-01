import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.awt.Polygon; 
import java.util.LinkedList; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_170531d extends PApplet {



public void setup(){
  
}

public void draw(){
  
  background(0xffE5EFFF);
  
  // draw dock
  stroke(0xff67452F);
  strokeWeight(4);
  fill(0xff987B68);
  rect(400,310,165,25);
  translate(0,-150);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  translate(75,0);
  quad(450,450,500,450,200,350,150,350);
  
  translate(-75*6,150);
  
  //draw ocean
  noStroke();
  fill(0xff94D6E8, 79);
  rect(0,350,600,250);
  
  //draw sand
  beginShape();
  stroke(0xffB26E00);
  fill(0xffFFEB86);
  curveVertex(0,575);
  curveVertex(0,575);
  curveVertex(300,525);
  curveVertex(500,475);
  curveVertex(600,450);
  curveVertex(600,600);
  curveVertex(600,600);
  endShape();
}
class Islander{
  
  /*** VARIABLES ***/
  
  int x; // x-cor of position
  int y; // y-cor of position
  
  LLStack<String> _dialogue; // what to say when they're clicked on
  String _name; // name
  
  PShape _body = new PShape(GROUP); 
  PShape _head, _clothes;
  
  Islander(int nX, int nY){
    x = nX;
    y = nY;
    _name = "Islander";
    _dialogue = null;
    _head = createShape(ELLIPSE, x, y, 25, 25);
    // draw body;
    // add body and head as children
  }
  
  public String talk(){ // remove and return the next thing to say from _dialogue
    return _dialogue.pop();
  }
  
  public void addSpeech(String s){ // add a new thing to say to _dialogue
    _dialogue.push(s);
  }
  
  public boolean isHotspot(){
    if( abs(mouseX - x) < 100 && abs(mouseY - y) < 200 ){ return true; }
    else{ return false; }
  }
  
  public void interact(){
    if( isHotspot() ){ talk(); }
  }
  public void mouseClicked(){ 
    if( isHotspot() ){ talk(); } 
  }
}


 class LLStack<T> implements Stack<T> 
{
     LinkedList<T> _stack = new LinkedList<T>();
     int _stackSize = 0;

     public void push(T  x){
      _stack.addFirst(x);
      _stackSize+=1;
    }

     public T pop(){
        if(_stack.size() ==0){
            return null;
          }
        else{
          T retT =  _stack.remove();
          _stackSize -=1;
          return retT;
         } 
      }

     public T peek(){
         if(_stackSize == 0){
          return null;
          }
      return _stack.getFirst();
    }

     public boolean isEmpty(){
        if(_stackSize == 0){
            return true;
          }
        return false;
      }
}


   
class Location{
  
  /*** VARIABLES ***/
  String _name;
  String _description;
  public ArrayList<Path> _exits; //we could use a linked list here
  PImage _background;
  int ID;
  
  Location(){
    _name = "";
    _description = "";
    _exits = new ArrayList<Path>();
    ID = 0;
  }
  
  Location(String title, String moreInfo,int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    ID = id;
    _background = null;
  }
    Location(String title, String moreInfo, PImage scenery, int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    _background = scenery;
    ID = id;
  }
  
  public String getDescription(){
    return _description;
  }
  
  public String getName(){
    return _name;
  }
  
  public void setImage(String filename){
    _background = loadImage(filename);
  }
  
  public void display(){
    //should include some bg characters too
    //but mostly should display the bg
    if(_background != null) {
     
      image(_background, 20, 65, 560, 480);
    }
    else {
      fill(0, 216, 242);
      rect(20, 60, 560, 480);
      fill(250, 241, 222);
      ellipse(250, 250, 250, 250);
    }

  }
  
  public void addExit(Path p){
    _exits.add(p);
  }
  
}
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
  
  public String toString(){
    String pathName = "Path to ";
    // _destination name
    return pathName;
  }
  
  public boolean contains(int x, int y){
    return _shape.contains(x,y);
  }
  
  public void setDestination(Location place){
    _destination = place;
  }
  
  public void setShape(int[] x, int[] y, int n){
    _shape = new Polygon(x, y, n);
  }
  
 public Location getDestination(){
    // returns destination
    //return null;
    return _destination;
  }
  
}
class Scenery{

}
/*****************************************************
 * interface Stack
 * Specifies actions a stack must be able to perform.
 * Allows for generic typing.
 *****************************************************/

public interface Stack<P> 
{
    //Return true if this stack is empty, otherwise false.
    public boolean isEmpty();

    //Return top element of stack without popping it.
    public P peek();

    //Pop and return top element of stack.
    public P pop();

    //Push an element onto top of this stack.
    public void  push( P x );

}//end interface
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_170531d" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
