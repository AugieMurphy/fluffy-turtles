class WorldMap{
  
  int _screen = 1;
  Location current;
  LLStack<Quest> QuestStack; //might not need this
  boolean gameOver = false;
  Player p; //mainly to keep track of player's place && update location
  
  WorldMap(Player player){
    p = player;
    //Create the different Locations
    Location l1 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 1 );
    Location l2 = new Location("Village Entrance", "You've stumbled upon the entrance to a small village...",2 );
    Location l3 = new Location("Main Square", "This is the Main Square of the village...",3);
    
    l1.setImage("shore.jpg");
    l2.setImage("village.jpg");
    l3.setImage("store.jpg");
  
    //Connect the nodes using paths 
    l1.addExit( new Path(l2, 250, 230, "door"));
    l2.addExit(new Path(l1, 230, 350, "hole"));
    
    p.addQuest((new Quest(0, "No quests left")));
    p.addQuest((new Quest(2, "Get to Square")));
    p.addQuest((new Quest(1, "Get to Village", l2)));
    current = l1;
    //System.out.println(current.getDescription());
  }
  
  LLStack<Quest> getQuests(){
    return QuestStack;
  }
  
  void setLocation(Location p){
    current = p;
  }
  
  Polygon sign(int x, int y){    
    return null;
  }
  
  Location getLocation(){
    return current;
  }
  
  
  //checks if player and mouse clicks a path to a new location and updates current location to that location
  void updateLocation(){
    int i = -1;
    for(int x = 0; x < current._exits.size(); x++){
      if(current._exits.get(x).contains(mouseX, mouseY) && mousePressed)
      /*&&  
      ((current._exits.get(x).contains((int)(p.getX() + 30), (int)(p.getY() + 30))) || (current._exits.get(x).contains((int)(p.getX() - 30), (int)(p.getY() - 30))))*/
      {
        //System.out.println("true door");
        i = x;
      }
    }
    if(i > -1){
      //System.out.println("new door");
      setLocation(current._exits.get(i).getDestination());
    }
  }
  
  //in case the image-loading takes forever, this is an alternative -- just drawing everything out manually
  void displayL1(){
    background(#9DC8FF);
    int[] cors = {50,0,75,50,100,100,300,250,325,350,350,400,400,450,600,525};
    stroke(0);
    strokeWeight(4);
    fill(#FFD27E);
    beginShape();
    curveVertex(25,0);
    for( int i = 0; i < cors.length; i+=2 ){
      curveVertex(cors[i],cors[i+1]);
    }
    curveVertex(600,450);
    endShape();
    noStroke();
    beginShape();
    vertex(50,0);
    vertex(600,525);
    vertex(600,0);
    endShape();
  }
  
  void displayL2(){
  }
  void displayL3(){
  }
  
  void showScreen(){
    updateLocation();
    p.setLocation(current);
    p.popQuest();
    System.out.println(p.peekQuest().getMessage());
    current.display();
    //System.out.println(current.getDescription());
    if( _screen == 1 ){ }//displayL1(); }
    else if( _screen == 2 ){ }//displayL2(); }
    else if( _screen == 3 ){ }//displayL3(); }
  }
}