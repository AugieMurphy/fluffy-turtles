Player _player;
World _world;
QuestStack _quests;
int _displayScreen = 0;
storyTree _story;
Location _currentLocation;

import java.awt.Polygon;

/*** VARIABLES ***/

// We display the screen that is indicated by the _screen variable.
// 0: Initial Screen/Backstory
// 1: Room Screen
// 2: End-Game Screen

int _screen = 0;
ArrayList<Location> _places = new ArrayList<Location>();

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
  Location _room = new Location();
  _places.add(_room);
}

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
  for( int i = 0; i < _places.size(); i++){
    if((_places.get(i)).contains(mouseX,mouseY)){ return i;}
  }
  return -1;
}

void examine(){
  
}