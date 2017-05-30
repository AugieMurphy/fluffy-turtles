class WorldMap{
  
  int _screen = 1;
  Location current;
  LLStack<Quest> QuestStack;
  
  WorldMap(){
    //Create the different Locations
    Location l1 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 1 );
    Location l2 = new Location("Village Entrance", "You've stumbled upon the entrance to a small village...",2 );
    Location l3 = new Location("Main Square", "This is the Main Square of the village...",3);
    
  
    //Connect the nodes using paths 
    l1.addExit( new Path(l2));
    l2.addExit(new Path(l1));
    
    QuestStack = new LLStack<Quest>();
    QuestStack.push(new Quest(0, "No quests left"));
    QuestStack.push(new Quest(1, "Get to Village"));
    QuestStack.push(new Quest(2, "Get to Square"));
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
  
  void doSomething(){
    System.out.println("do something");
  }
  
  void updateLocation(){
    int i = -1;
    for(int x = 0; x < current._exits.size(); x++){
      if(current._exits.get(x).contains(mouseX, mouseY)){
        i = x;
      }
    }
    if(i > -1){
      setLocation(current._exits.get(i).getDestination());
    }
  }
  
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
   // updateLocation();
    //current.display();
    //System.out.println(current.getDescription());
    if( _screen == 1 ){ displayL1(); }
    else if( _screen == 2 ){ displayL2(); }
    else if( _screen == 3 ){ displayL3(); }
  }
}