class Location implements Requirement{
  
  /*** VARIABLES ***/
  // What makes this location unique
  String _name;
  String _description;
  ArrayList<Path> _exits; //basically makes a linked list because each location links to others
  PImage _background;
  int ID;
  
  // What has this location got in it?
  ArrayList<Tool> _tools;
  Location _currLocation;
  ArrayList<Feature> _features;
  ArrayList<Islander> _villagers;
  ArrayList<Pirate> _pirateClan;
  
  // Where can the player walk in this location?
  float xborderI;// These represent the universal border for all objects
  float yborderI;
  float xborderII;
  float yborderII;
  Polygon _path;
  
  Location(){
    _name = "";
    _description = "";
    _exits = new ArrayList<Path>();
    ID = 0;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new ArrayList<Feature>();
    _villagers = new ArrayList<Islander>();
    xborderI = 20;
    yborderI = 65;
    xborderII = 580;
    yborderII = 545;;
  }
  
  Location(String title, String moreInfo,int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    ID = id;
    _background = null;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new ArrayList<Feature>();
    _villagers = new ArrayList<Islander>();
    _pirateClan = new ArrayList<Pirate>();
    xborderI = 20;
    yborderI = 65;
    xborderII = 580;
    yborderII = 545;
  }
  
  Location(String title, String moreInfo, PImage scenery, int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    _background = scenery;
    ID = id;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new ArrayList<Feature>();
    _villagers = new ArrayList<Islander>();
    _pirateClan = new ArrayList<Pirate>();
    xborderI = 20;
    yborderI = 65;
    xborderII = 580;
    yborderII = 545;
  }
  
  /*** USER INPUT ***/
  void mousePressed(){
    for( Islander i: _villagers ){ i.mousePressed(); }
    for( Pirate p: _pirateClan ){ p.mousePressed(); }
  }
  
  void keyPressed(){
    for(Islander i: _villagers) {
      if(i.keyTriggered() == -1) {
        p.decReputation(20);
        _messages.push("YOU REFUSED THE ISLANDER! \n YOUR REPUTATION HAS GONE DOWN!");
        messaging = true;
        currMessage = _messages.pop();
        questioning = false;
      }
      else if(i.keyTriggered() == 1){ p.incReputation(20); questioning = false;}
    }
  }
  
  void hovering(){
    fill(255);
    for( Islander i: _villagers ){ i.hovering(); } // if the mouse's coordinates are a villager's coordinates
    for( Tool t: _tools ){ t.hovering(); } // if the mouse's coordinates are a tool's coordinates
    for( Path p: _exits ){ p.hovering(); } // if the mouse's coordinates are a path's coordinates
  }
  /*** END USER INPUT ***/
  
  /** POSSIBLE PLAYER LOCATIONS **/
  void addPoint(int x, int y){
    _path.addPoint(x,y);
  }
  
  void isPath(int x, int y ){
    _path.contains(x,y);
  }
  /*** END POSSIBLE PLAYER LOCATIONS ***/
  
  String getDescription(){
    return _description;
  }
  
  String getName(){
    return _name;
  }
  
  void setImage(String filename){
    _background = loadImage(filename);
  }
  
  /*** should display the background ***/
  void draw(){ 
    // if there's a background image, display it
    if(_background != null) { 
      image(_background, 20, 65, 560, 480);
    }
    showFeatures();
    showExits();
    displayTools();
    showIslanders();
  }
  
  void showFeatures(){
    for( Feature f: _features ){
      f.draw();
    }
  }
  
  void showExits(){
     for(int i = 0; i < _exits.size(); i++){
       (_exits.get(i)).displayShape();
     }
  }
  
  void addExit(Path p){
    _exits.add(p);
  }
  
  void addTool(Tool t){
    _tools.add(t);
  }
  
  Tool removeTool(Tool t){
    for( int i = 0; i < _tools.size(); i++ ){ 
      if( _tools.get(i) == t ){ return _tools.remove(i); }
    }
    return null;
  }
  
  void displayTools(){
    for( int i = 0; i < _tools.size(); i++ ){ 
      _tools.get(i).display();
    }
  }
  
  int getID(){
    return ID;
  }
  
  void addFeature(PShape p, int fillColor, int strokeColor, int strokeWidth){
    _features.add(new Feature(p, fillColor, strokeColor, strokeWidth));
  }
  
  void addFeature(PShape p, int fillColor, int transparency, int strokeColor, int strokeWidth){
    _features.add(new Feature(p, fillColor, transparency, strokeColor, strokeWidth));
  }
  
  void addFeature(PShape p, int fillColor, int transparency){
    _features.add(new Feature(p, fillColor, transparency));
  }
  
  void addIslander(Islander i){
    _villagers.add(i);
  }
  
  void removeIslander(Islander i){
    _villagers.remove(i);
  }
  
  void showIslanders(){
    for( Islander i: _villagers ){
      i.draw();
    }
  }
}