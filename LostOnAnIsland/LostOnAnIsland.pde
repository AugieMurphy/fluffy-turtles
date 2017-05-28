// import Polygon
import java.awt.Polygon;

/*** VARIABLES ***/

// We display the screen that is indicated by the _screen variable.
// 0: Initial Screen/Backstory
// 1: Location-in-World Screen
// 2: End-Game Screen

int _screen = 0;
WorldMap _map;

void setup(){
  size(600,600);
  _map = new WorldMap();
}

void draw(){
  if( _screen == 1 ){ launchScreen();}
  else if( _screen == 2 ){ gameScreen(); }
  else if( _screen == 3 ){ endScreen(); }
}

void mousePressed(){
}

/*** DISPLAY SCREENS ***/
void launchScreen(){
  // code to display the first screen (title + "click to start")
  background(0);
  textAlign(CENTER);
  text("Escape The Room \n Click to start", height/2, width/2);
}

void gameScreen(){ _map.showScreen(); }

void endScreen(){
  // code for the end of the game (leave the island!!!)
  background(0);
  textAlign(CENTER);
  text("You've escaped from the island!!!", height/2, width/2);
}