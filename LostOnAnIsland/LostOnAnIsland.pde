import java.awt.Polygon;

/*** VARIABLES ***/
// We display the screen that is indicated by the _screen variable.
// 1: Initial Screen/Backstory
// 2: Location-in-World Screen
// 3: End-Game Screen

int _screen = 1;

Player p; // the user
WorldMap _map;
String [] _instructions; // how to play the game, parsed from plaintext file if the user gets confused

// MESSAGING
LLStack<String> _messages; // tutorial/guide for users that allows the game to communicate with them
String currMessage; 
boolean messaging;

boolean paused; // when the player is in the inventory or menu screen, this is true
boolean instructing; // when instructions are being shown, this is true
boolean menuOpen;

PImage menuIcon;
PImage inventoryIcon;

PImage redX;

void setup(){
  size(600,600);
  p = new Player("Player");
  _map = new WorldMap(p);
  _messages = new LLStack<String>();
  addMessage("Click on another character to talk to them... \n (click anywhere to make this message disappear)");
  currMessage = _messages.peek();
  messaging = false;
  paused = false;
  _instructions = loadStrings("Instructions.txt");
  menuIcon = loadImage("menuIcon.png");
  inventoryIcon = loadImage("bag2.png");
  redX = loadImage("redX.png");
}

void draw(){
  if( _screen == 1 ){ launchScreen(); }
  else if( _screen == 2 ){ 
    if( !paused ){ gameScreen(); } 
    else if( instructing ){ readInstructions(); }
    else if( menuOpen ){ menuScreen(); }
    else{ inventoryScreen(); }
  }
  else if( _screen == 3 ){ endScreen(); }
}

void mousePressed(){
  
 if(_screen == 1){_screen += 1; }
 
  else if( _screen == 2 ){ 
    switchMessage();
    _map.pressMouse(); 
    if( !paused && !messaging){ // if we don't need to tell the user something
        if( isInventory() ){ inventoryScreen(); } // they see what tools they have if they click on the inventory
        else if( isMenu() ){ menuScreen(); } // if they click the menu button, pop-up menu appears
      }
     else if( paused ){ 
       if( redX() && instructing){ paused = !paused; instructing = !instructing; }
       else if( redX() && menuOpen){ paused = !paused; gameScreen(); menuOpen = !menuOpen; }
       else if( redX() ){ paused = !paused; gameScreen(); }
       else if( menuButton1() && menuOpen ){ readInstructions(); }
       else if( menuButton2() && menuOpen ){ _screen++; menuOpen = !menuOpen; }
       //else if( menuButton3() && menuOpen ){ _screen = 0; menuOpen = !menuOpen; p = new Player("newPlayer"); _map = new WorldMap(p); } 
    }
   }
    
   if( _screen == 3 ){ }
  
}

void keyPressed(){
  p.move(true);
}

/*** DISPLAY SCREENS ***/
// USER INPUT HELPERS
boolean isInventory(){
  image(inventoryIcon,450,70,45,65);
  if( (mouseX > 450 && mouseX < 495) && (mouseY > 70 && mouseY < 135) ){ paused = true; return true; }
  else{ return false; }
}

boolean isMenu(){
  if( mouseX < 50 && mouseY < 50 ){ paused = true; return true; }
  else{ return false; }
}

boolean menuButton1(){
  return (mouseX < 475 && mouseX > 125) && (mouseY > 145 && mouseY < 195);
}
boolean menuButton2(){
  return (mouseX < 475 && mouseX > 125) && (mouseY > 220 && mouseY < 270);
}
boolean menuButton3(){
  return (mouseX < 475 && mouseX > 125) && (mouseY > 295 && mouseY < 345);
}

boolean redX(){
  if( abs(mouseX-500) < 20 && abs(mouseY-100) < 20 ){ return true; }
  else{ return false; }
}

// END USER INPUT HELPERS

/*** END USER INPUT ***/

/*** DISPLAY SCREENS ***/
void launchScreen(){
  // code to display the first screen (title + "click to start")
  background(#1A341A);
  fill(255);
  textAlign(CENTER);
  text("Oh no, you're stranded on a deserted island! \n How will you ever escape? \n Click to start", height/2, width/2);
}

void gameScreen(){
  
  // if there are no more quests and the user has found peach (at the dock), the game ends, _screen += 3;
  
  //code to display main quest, current location
  background(0);
  fill(255, 247, 219); 
  rect(74, 15, 506, 45); //makes the background box for the location text
  fill(255);
  rect(20, 550, 560, 45); //makes the background box for the quest text
  fill(0, 0, 0);
  textAlign(CENTER); // text is displayed now
  text("QUEST: " + p.peekQuest().getMessage(), 250, 580);
  text((_map.getLocation()).getName() + ": " +_map.getLocation().getDescription(), 300, 40);
  _map.getLocation().display();
  _map.showScreen(); //location/setting is displayed now
  
  fill(255);
  image(inventoryIcon,450,70,45,65);
  image(menuIcon,20,15,50,45);
  
  p.move(false); //character is now displayed
  
  if( messaging ){ displayMessage(); } // displays any waiting messages
}

void endScreen(){
  // code for the end of the game (leave the island!!!)
  background(0);
  textAlign(CENTER);
  fill(255);
  text("You've escaped from the island!!!", height/2, width/2);
}

void inventoryScreen(){
  
  p.showInventory();
  image(redX,495,95,10,10);
}

void menuScreen(){
  menuOpen = true;
  
  stroke(#E58176);
  strokeWeight(5);
  fill(#4B0700);
  rect(100,100,400,400,10,10,10,10);
  
  fill(255);
  rect(125,145,350,50,10,10,10,10);
  rect(125,220,350,50,10,10,10,10);
  rect(125,295,350,50,10,10,10,10);
  
  fill(0);
  textAlign(CENTER);
  text("HOW TO PLAY \n (click HERE for instructions)",300,165);
  text("ENDGAME \n (use with caution, there are no take-backs!)",300,240);
  text("RESTART \n (new game)",300,315);
  
  strokeWeight(1); // reset strokeWeight so that it doesn't make other outlines thicker
  
  image(redX,495,95,10,10);
  
}

void readInstructions(){
  instructing = true;

  background(255);
  textAlign(CENTER);
  fill(0);
  String str = "";
  for (int i = 0 ; i < _instructions.length; i++) {
    str += _instructions[i] + "\n";
  }
  text(str,300,300);
  
    
  image(redX,495,95,10,10);
  
}

/*****/
public void switchMessage(){
    if( messaging && _messages.isEmpty() ){ messaging = !messaging;}
    else if( !messaging && _messages.isEmpty() ){ messaging = messaging; }
    else if( messaging ){ currMessage = _messages.pop(); }
    else if( messaging ){ _messages.pop(); }
    else{ messaging = true; }
}
 //<>//
public void addMessage(String s){
  _messages.push(s);
  currMessage = s;
}

public void displayMessage(){
  stroke(0);
  fill(255);
  rect(100,275,400,50);
  textAlign(CENTER);
  fill(0);
  text(currMessage,300,295);
}