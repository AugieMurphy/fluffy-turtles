class WorldMap{
  
  int _screen = 0;
  Location current;
  LLStack<Quest> QuestStack; //might not need this
  boolean gameOver = false;
  Player p; //mainly to keep track of player's place && update location
  Islander leader;
  
  WorldMap(Player player){
    
    
    p = player;
    
    //Create the different Locations
    Location l0 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 0 );
    Location l1 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site...", 1 );
    Location l2 = new Location("Village Entrance", "You've stumbled upon the entrance to a small village...",2 );
    Location l3 = new Location("Main Square", "This is the Main Square of the village...",3);
    
    current = l0;
    setupl0();
    
    l1.setImage("shore.jpg");
    l2.setImage("village.jpg");
    l3.setImage("store.jpg");
  
    //Connect the nodes using paths 
    
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
    
    l0.addTool(new Tool(100,100));
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
  /**
  void updateLocation(){
    int i = -1;
    for(int x = 0; x < current._exits.size(); x++){
      if((current._exits.get(x).contains(mouseX, mouseY) && mousePressed ) || (current._exits.get(x).contains(p.getX() + 20, p.getY() + 25)))
      {
        i = x;
      }
    }
    if(i > -1){
      //System.out.println("new door");
      setLocation(current._exits.get(i).getDestination());
    }
  }
  **/
    void locateTools(){
    int i = -1;
    for(int x = 0; x < current._tools.size(); x++){
      if( ((current._tools.get(x)).contains(mouseX, mouseY) && mousePressed) || ((current._tools.get(x).contains(p.getX() + 20, p.getY() + 25))) )
      {
        i = x;
      }
    }
    if(i > -1){
      //System.out.println("new door");
      p.addTool(current._tools.get(i),current);
    }
  }
  public void setupl0(){
    size(600,600);
    leader = new Islander(525,75,"Leader");
    leader.addCrown();
    leader.addSpeech("BUT, maybe I can help you... \n complete these quests and \n then  come find me. \n I'll get you off of this island.");
    leader.addSpeech("I hope you have another boat. \n Nobody's left this island in years.");
    leader.addSpeech("Were you in a shipwreck \n during the storm \n last night?");
    leader.addSpeech("I've never seen you \n before.");
    leader.addSpeech("That's strange...");
   /**
    // DOCK SUPPORTS and column
    PShape dockP1 = createShape(RECT,190,220,410,25);
    current.addFeature(dockP1,0xff987B68,0xff67452F,4);
    PShape dockP2 = createShape(RECT,190,250,75,380);
    current.addFeature(dockP2,0xff987B68,0xff67452F,4);
    PShape dockP3 = createShape(RECT,400,290,200,25);
    current.addFeature(dockP3,0xff987B68,0xff67452F,4);
    
    // DOCK PLANKS
    int x = 450;
    int y = 300;
    for( int i = 0; i < 7; i++ ){
      PShape tmp = createShape(QUAD, x,y,x+50,y,x-250,y-100,x-300,y-100);
      current.addFeature(tmp,0xff987B68,0xff67452F,4);
      x += 75;
    }
    
    // SAND
    PShape sand = createShape();
    sand.beginShape();
    sand.curveVertex(0,600);
    sand.curveVertex(0,600);
    sand.curveVertex(0,575);
    sand.curveVertex(300,525);
    sand.curveVertex(600,450);
    sand.curveVertex(600,600);
    sand.curveVertex(600,600);
    sand.endShape(CLOSE);
    current.addFeature(sand,0xffFFEB86, 0xffB26E00, 4);
    
    // DOCK COLUMN
    PShape dockP4 = createShape(RECT,400,320,75,275);
    current.addFeature(dockP4,0xff987B68,0xff67452F,4);
    
    //PShape ocean = createShape(RECT,0,350,600,250);
    //current.addFeature(ocean,0xff94D6E8,79);
 **/
  }
  
  public void displayl0(){
    
    //draw dock
    stroke(0xff67452F);
    strokeWeight(4);
    fill(0xff987B68);
    rect(190,220,410,25);
    rect(190,250,75,380);
    rect(400,290,200,25);
    int x = 450;
    int y = 300;
    for( int i = 0; i < 7; i++ ){
      quad(x,y,x+50,y,x-250,y-100,x-300,y-100);
      x += 75;
    }
    
    translate(0,-150);
    quad(450,450,500,450,200,350,150,350);
    translate(75,0);
    quad(450,450,500,450,200,350,150,350);
    translate(75,0);
    quad(450,450,500,450,200,350,150,350);
    translate(75,0);
    quad(450,450,500,450,200,350,150,350);
    translate(75,0);
    quad(450,450,500,450,200,350,150,350);
    translate(75,0);
    quad(450,450,500,450,200,350,150,350);
    translate(75,0);
    quad(450,450,500,450,200,350,150,350);
    
    translate(-75*6,150);
   
   
    //draw sand
    beginShape();
    stroke(0xffB26E00);
    fill(0xffFFEB86);
    curveVertex(0,600);
    curveVertex(0,600);
    curveVertex(0,575);
    curveVertex(300,525);
    curveVertex(600,450);
    curveVertex(600,600);
    curveVertex(600,600);
    endShape();
    
    stroke(0xff67452F);
    fill(0xff987B68);
    rect(400,320,75,275);
    
    
    //draw ocean
    noStroke();
    fill(0xff94D6E8, 79);
    rect(0,350,600,250);
    leader.addCrown();
  
    //leader.display();
  
  }
  /*
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
      //System.out.println("new door");
      setLocation(current._exits.get(i).getDestination());
    }
  }
  */
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
    locateTools();
    //updateLocation();
    //p.setLocation(current);
    p.popQuest();
    //System.out.println(p.peekQuest().getMessage());
    current.display();
    //System.out.println(current.getDescription());
    if( current.getID() == 0 ){ displayl0(); }
    else if( _screen == 1 ){ displayL1(); }
    else if( _screen == 2 ){ }//displayL2(); }
    else if( _screen == 3 ){ }//displayL3(); }
    //current.showExits();
    //current.displayTools();
    leader.display();
    current.displayTools();
    current.showExits();
    p.showInventory();
  }
  
  public void pressMouse(){
    if( _screen == 0 ){ if( leader.isHotspot() ){ leader.speakSwitch(); } }
  }
}