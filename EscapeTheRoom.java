
/*** VARIABLES ***/

// We display the screen that is indicated by the _screen variable.
// 0: Initial Screen/Backstory
// 1: Room Screen/playing the game
// 2: End-Game Screen

int _screen = 0;

/*** SETUP ***/
void setup(){
    size(100,100);
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
}
void playingScreen(){
    // code to display the feature (or room) being examined
    // code could call a display method from Room
}
void endScreen(){
    // code for the end of the game, escape (victory) or give up (lose)
    // code could be text saying "you escaped"
}

/*** PLAYER INPUTS ***/
public void mousePressed(){
    // if the area is a hotspot for an interactive feature, emaine it
}

/*** TUTORIAL ***/
void startGame(){
    _screen++;
    // code tutorial: display "click on an object to examine it" with the Screen
}
