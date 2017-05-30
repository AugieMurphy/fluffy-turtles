// import Polygon
import java.awt.Polygon;
Player p;

/*** VARIABLES ***/

// We display the screen that is indicated by the _screen variable.
// 0: Initial Screen/Backstory
// 1: Location-in-World Screen
// 2: End-Game Screen

int _screen = 1;
WorldMap _map;

void setup(){
  size(600,600);
  p = new Player("Player");
  _map = new WorldMap();
}

void draw(){
  if( _screen == 1 ){ launchScreen();}
  else if( _screen == 2 ){ gameScreen(); }
  else if( _screen == 3 ){ endScreen(); }
}

void mousePressed(){
  //if(_screen == 1)
  _screen += 1;
}

/*** DISPLAY SCREENS ***/
void launchScreen(){
  // code to display the first screen (title + "click to start")
  background(0);
  textAlign(CENTER);
  text("Escape The Room \n Click to start", height/2, width/2);
}

void gameScreen(){ 
  background(0);
  fill(255, 247, 219);
  rect(20, 15, 560, 45);
   //<>//
  fill(255);
  rect(20, 560, 560, 30);
  fill(0, 0, 0);
  textAlign(CENTER);
  text("QUEST: " + _map.getQuests().peek().getMessage(), 250, 580);
  _map.getLocation().display();
  text(_map.getLocation().getName() + ": " +_map.getLocation().getDescription(), 250, 40);
  p.move();
  
}

void loadCharacter(){
  image(p.getImage(), 280, 350);
}

void endScreen(){
  // code for the end of the game (leave the island!!!)
  background(0);
  textAlign(CENTER);
  text("You've escaped from the island!!!", height/2, width/2);
}