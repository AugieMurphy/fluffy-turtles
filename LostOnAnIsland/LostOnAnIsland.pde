// import Polygon
import java.awt.Polygon;

/*** VARIABLES ***/
Player p;
LLStack<String> _messages;
String currMessage;
boolean messaging;

// We display the screen that is indicated by the _screen variable.
// 0: Initial Screen/Backstory
// 1: Location-in-World Screen
// 2: End-Game Screen

int _screen = 1;
WorldMap _map;

void setup(){
  size(600,600);
  p = new Player("Player");
  _map = new WorldMap(p);
  _messages = new LLStack<String>();
  addMessage("<-- This is your inventory. \n Click on tools and they will be added to it.");
  currMessage = _messages.peek();
  messaging = false;
}

void draw(){
  if( _screen == 1 ){ launchScreen();}
  else if( _screen == 2 ){ gameScreen(); }
  else if( _screen == 3 ){ endScreen(); }
}

void mousePressed(){
 if(_screen == 1){_screen += 1; }
  else if( _screen == 2 ){ 
    switchMessage();
    _map.pressMouse(); 
  }
}

/*** DISPLAY SCREENS ***/
void launchScreen(){
  // code to display the first screen (title + "click to start")
  background(#1A341A);
  fill(255);
  textAlign(CENTER);
  //textSize(25);
  text("Oh no, you're stranded on a deserted island! \n How will you ever escape? \n Click to start", height/2, width/2);
}

public void switchMessage(){
    if( messaging && _messages.isEmpty() ){ messaging = !messaging;}
    else if( !messaging && _messages.isEmpty() ){ currMessage = _messages.pop(); }
    else if( messaging ){ currMessage = _messages.pop(); }
    else{ messaging = true; }
}

void gameScreen(){ 
  //code to display main quest, current location
  background(0);
  fill(255, 247, 219); 
  rect(20, 15, 560, 45); //makes the background box for the location text //<>//
  fill(255);
  rect(20, 560, 560, 30); //nakes the background box for the quest text
  fill(0, 0, 0);
  textAlign(CENTER); // text is displayed now
  text("QUEST: " + p.peekQuest().getMessage(), 250, 580);
  text(_map.getLocation().getName() + ": " +_map.getLocation().getDescription(), 250, 40);
  //_map.getLocation().display();
   _map.showScreen(); //location/setting is displayed now
  p.move(false); //character is now displayed
  if( messaging ){ displayMessage(); }
  
}

void keyPressed(){
  p.move(true);
}

void endScreen(){
  // code for the end of the game (leave the island!!!)
  background(0);
  textAlign(CENTER);
  text("You've escaped from the island!!!", height/2, width/2);
}


public void addMessage(String s){
  _messages.push(s);
  currMessage = s;
}

public void displayMessage(){
  stroke(#FFAF79);
  fill(#FFC4C4);
  rect(100,275,400,50);
  textAlign(CENTER);
  fill(#FA0000);
  text(currMessage,300,295);
}