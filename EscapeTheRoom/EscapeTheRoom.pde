import java.awt.Polygon;

/*** VARIABLES ***/

// We display the screen that is indicated by the _screen variable.
// 0: Initial Screen/Backstory
// 1: Room Screen
// 2: End-Game Screen

int _screen = 0;

Room _room = new Room();
Player _player = new Player();
Polygon[] _polygons = new Polygon[1];

/*** SETUP ***/
void setup(){
    size(600,600);
}

/*** DRAW ***/
void draw(){
    // display _screen
    if( _screen == 0 ){ initScreen(); }
    else if( _screen == 1 ){ playingScreen(); }
    else if( _screen == 2 ){ endScreen(); }
}

/*** SCREENS ***/
void initScreen(){
  // code to display the first screen (title + "click to start")
  background(0);
  textAlign(CENTER);
  text("Escape The Room \n Click to start", height/2, width/2);
}

void playingScreen(){
  //draw walls and floor and roof
  drawWalls();
  drawFloor();
  drawRoof();
  //display door and other features
  Polygon p = new Polygon(); //door
  p.addPoint(250,500);
  p.addPoint(350,500);
  p.addPoint(250,300);
  p.addPoint(350,300);
  _polygons[0] = p;
  fill(#D6FFB9);
  quad(250,500,350,500,350,300,250,300);
  fill(255);
}

/* Helpers */
void drawWalls(){
  background(255);
  stroke(0);
  strokeWeight(4);
  fill(#FFE4E1); 
  quad(0,600,0,0,100,100,100,500);
  quad(600,600,600,0,500,100,500,500);   
  quad(100,100,100,500,500,500,500,100); 
}
 
void drawFloor(){
 stroke(0);
 strokeWeight(4);
 fill(#8B4513);
 quad(0,600,100,500,500,500,600,600);
}

void drawRoof(){
 stroke(0);
 strokeWeight(4);
 fill(#F0FFFF);
 quad(0,0,100,100,500,100,600,0);
}
/*End of GameScreen Helpers*/

void endScreen(){
  // code for the end of the game, escape (victory) or give up (lose)
  // code could be text saying "you escaped"
  // code to display the first screen (title + "click to start")
  background(0);
  textAlign(CENTER);
  text("You Escaped!", height/2, width/2);
}

/*** PLAYER INPUTS ***/
public void mousePressed(){
  if( _screen == 0 ){ 
    //start the game, play the tutorial 
    startGame();
  }
  else if( _screen == 1 ){
    // if( the area is a hotspot for an interactive feature ){ examine it }
    if( IndexOfclickedOnInteractiveFeature() > -1 ){ _screen++; }
    // else{ do nothing } 
  }
  else if( _screen == 2 ){
  //idk ask if they wanna play again
  }
}

/*** LAUNCHING THE GAME ***/
void tutorial(){
}

void startGame(){
    _screen++;
    // code tutorial: display "click on an object to examine it" with the Screen
}

/*** INTERACTIONS ***/
// Returns the index of the shape of the item that was clicked on
int IndexOfclickedOnInteractiveFeature(){
  for( int i = 0; i < _polygons.length; i++){
    if(_polygons[i].contains(mouseX,mouseY)){ return i;}
  }
  return -1;
}

void examine(){
  
}