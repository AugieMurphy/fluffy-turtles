class WorldMap{
  
  int _screen = 0;
  Location current;
  LLStack<Quest> QuestStack; //might not need this
  boolean gameOver = false;
  Player p; //mainly to keep track of player's place && update location
  Islander leader;
  Tool _MAP;
  
  WorldMap(Player player){
    
    
    p = player;
    
    //Create the different Locations
    Location map = new Location( "MAP!!!", "Get your bearings", -1);
    Location l0 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 0 );
    Location l1 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 1 );
    Location l2 = new Location("Village Entrance", "You've stumbled upon the entrance to a small village...",2 );
    Location l3 = new Location("Main Square", "This is the Main Square of the village...",3);
    
    current = l0;
    setupl0();
    
    l0.setImage("Shipwreck.png");
    l1.setImage("shore.jpg");
    l2.setImage("village.jpg");
    l3.setImage("store.jpg");
  
  
    //add characters
    l0.addIslander(leader);
    
    
    //Connect the nodes using paths 
    
    
    map.addExit( new Path(l0, 0, 300,"door") );
    map.addExit( new Path(l1, 100, 300,"door") );
    map.addExit( new Path(l2, 200, 300,"door") );
    map.addExit( new Path(l3, 300, 300,"door") );
    
    l0.addExit( new Path(map,550,0,"door") );
    l1.addExit( new Path(map,550,0,"door") );
    l2.addExit( new Path(map,550,0,"door") );
    l3.addExit( new Path(map,550,0,"door") );
    
    
    l0.addExit( new Path(l1,250,230,"door"));
    l1.addExit( new Path(l0, 200, 300, "door"));
    l1.addExit( new Path(l2, 250, 230, "door"));
    l2.addExit(new Path(l1, 230, 350, "hole"));
    l2.addExit(new Path(l3, 400, 200, "door"));
    l3.addExit(new Path(l1, 200, 360, "hole"));
    
    p.addQuest((new Quest(0, "No quests left")));
    p.addQuest((new Quest(2, "Get to Square", l3)));
    p.addQuest((new Quest(1, "Get to Village", l2)));
    //System.out.println(current.getDescription());
    
    _MAP = new Tool("Map in a Bottle",100,100,"messageInABottle.png",13,33);
    l0.addTool(_MAP);
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
      if((current._exits.get(x).contains(mouseX, mouseY) && mousePressed ) || (current._exits.get(x).contains(p.getX() + 20, p.getY() + 25)))
      {
        i = x;
      }
    }
    if(i > -1){
      setLocation(current._exits.get(i).getDestination());
    }
  }
  
  void locateTools(){
    int i = -1;
    for(int x = 0; x < current._tools.size(); x++){
      if( ((current._tools.get(x)).contains(mouseX, mouseY) && mousePressed) || ((current._tools.get(x).contains(p.getX() + 20, p.getY() + 25))) )
      {
        i = x;
      }
    }
    if(i > -1){
      p.addTool(current._tools.get(i),current);
    }
  }
  
  public void setupl0(){
    size(600,600);
    leader = new Islander(500,450,"Leader", "PrincessPeach_fwd.png",40,76);
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
    current.display();
    leader.display();
    current.displayTools();
    current.showExits();
    p.sideBar();
  }
  
  public void pressMouse(){
    if( _screen == 0 ){ if( leader.isHotspot() ){ leader.speakSwitch(); } }
  }
}