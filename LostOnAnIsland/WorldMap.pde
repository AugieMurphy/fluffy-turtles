class WorldMap{
  
  int _screen = 0;
  Location current;
  LLStack<Quest> QuestStack; //might not need this
  boolean gameOver = false;
  Player p; //mainly to keep track of player's place && update location
  Islander leader;
  Tool _MAP;
  Location map;
  boolean inMap = false;
  
  WorldMap(Player player){
    
    
    p = player;
    
    //Create the different Locations
    map = new Location( "MAP!!!", "Get your bearings", -1);
    Location l0 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 0 );
    Location l1 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 1 );
    Location l2 = new Location("Village Entrance", "You've stumbled upon the entrance to a small village...",2 );
    Location l3 = new Location("Main Square", "This is the Main Square of the village...",3);
    
    current = l0;
    setupl0();
    
    map.setImage("emptyMap.jpg");
    l0.setImage("beach2.png");
    l1.setImage("shore.jpg");
    l2.setImage("village.jpg");
    l3.setImage("store.jpg");
  
  
    //add characters
    l0.addIslander(leader);
    
    
    //Connect the nodes using paths 
         
    map.addExit( new Path(l0, 300, 300,"door",142, 7, 170) );
   /* map.addExit( new Path(l1, 100, 300,"door") );
    map.addExit( new Path(l2, 200, 300,"door") );
    map.addExit( new Path(l3, 300, 300,"door") );*/
 
    l0.addExit( new Path(map,520,75,"mapIcon", 7, 13, 170) );
    l1.addExit( new Path(map,520,75,"mapIcon", 9, 170, 7));
    l2.addExit( new Path(map,520,75,"mapIcon", 66, 120, 22));
    l3.addExit( new Path(map,520,75,"mapIcon", 250, 0, 175) );
    
    
    l0.addExit( new Path(l1,250,230,"door", 9, 170, 7));
    l1.addExit( new Path(l0, 200, 300, "door", 9, 170, 7));
    l1.addExit( new Path(l2, 250, 230, "door", 7, 13, 170));
    l2.addExit(new Path(l1, 230, 350, "hole", 7, 13, 170));
    l2.addExit(new Path(l3, 400, 200, "door", 250, 0, 175));
    l3.addExit(new Path(l1, 200, 360, "hole", 66, 120, 22));
    

    p.addQuest((new Quest(0, "No quests left")));
    p.addQuest((new Quest(2, "Get to Square", l3)));
    p.addQuest((new Quest(1, "Get to Village", l2)));
    //System.out.println(current.getDescription());
    
    _MAP = new Tool("Bottle",300,500,"messageInABottle.png",13,33);
    l0.addTool(_MAP);
    
     leader.addQuest(new Quest(4, "Get the bottle", _MAP));
     leader.setQuestion("Can you get me a bottle?");
     leader.setOptions("Yea, sure!", "Haha nope.");
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
    
    if(!inMap){
    for(int x = 0; x < current._exits.size(); x++){
      if((current._exits.get(x).contains(p.getX() + 20, p.getY() + 25)) || (current._exits.get(x).getDestination() == map && current._exits.get(x).contains(mouseX, mouseY) &&
      mousePressed))
      {
        i = x;
      }
      }
    }
    else{
       if(map._exits.get(0).contains(mouseX, mouseY) && mousePressed) inMap = !inMap;
    }
    if(i > -1){
      if(current._exits.get(i).getDestination() == map) inMap = true;
      else{
        setLocation(current._exits.get(i).getDestination());
      }
    }
    map._exits.get(0).setDestination(current);
    p.setLocation(current);
  }
  
  void locateTools(){
    int i = -1;
    for(int x = 0; x < current._tools.size(); x++){
      if( (current._tools.get(x).contains(p.getX() + 20, p.getY() + 25)))
      {
        i = x;
      }
    }
    if(i > -1){
      p.addTool(current._tools.get(i),current);
    }
  }

  public void setupl0(){
    leader = new Islander(500,450,"Princess", "PrincessPeach_fwd.png",40,76, 0);
    leader.addSpeech("BUT, maybe I can help you... \n complete these quests and \n then  come find me. \n I'll get you off of this island.");
    leader.addSpeech("I hope you have another boat. \n Nobody's left this island in years.");
    leader.addSpeech("Were you in a shipwreck \n during the storm \n last night?");
    leader.addSpeech("I've never seen you \n before.");
    leader.addSpeech("That's strange...");
   
  }
  
  void showScreen(){
    locateTools();
    updateLocation();
    p.popQuest();
    if(!inMap) {current.display(); current.showExits(); current.displayTools();}
    else{map.display(); map.showExits();
      fill(255);
      textAlign(CENTER);
      text("Exit\nMap", 315, 325);}
    
    
    p.sideBar();
    hovering();
  }
  
  void hovering(){
    current.hovering();
  }
  
  void mousePressed(){
    current.mousePressed();
  }
  
  void keyPressed(){
    current.keyPressed();
    questioning = !questioning;
  }
}