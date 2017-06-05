class Location implements Requirement{
  
  /*** VARIABLES ***/
  String _name;
  String _description;
  ArrayList<Path> _exits; //basically makes a linked list because each location links to others
  PImage _background;
  int ID;
  ArrayList<Tool> _tools;
  Location _currLocation;
  Features _features;
  ArrayList<Islander> _villagers;
  
  Location(){
    _name = "";
    _description = "";
    _exits = new ArrayList<Path>();
    ID = 0;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new Features();
    _villagers = new ArrayList<Islander>();
  }
  
  Location(String title, String moreInfo,int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    ID = id;
    _background = null;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new Features();
    _villagers = new ArrayList<Islander>();
  }
  
  Location(String title, String moreInfo, PImage scenery, int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    _background = scenery;
    ID = id;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new Features();
    _villagers = new ArrayList<Islander>();
  }
  
  void mousePressed(){
    for( Islander i: _villagers ){ i.mousePressed(); }
  }
  
  void hovering(){
    for( Islander i: _villagers ){ i.hovering(); }
    for( Tool t: _tools ){ t.hovering(); }
    for( Path p: _exits ){ p.hovering(); }
  }
  
  String getDescription(){
    return _description;
  }
  
  String getName(){
    return _name;
  }
  
  void setImage(String filename){
    _background = loadImage(filename);
  }
  
  void display(){
    
    /*** should display the background ***/
    
    // if there's a background image, display it
    if(_background != null) { 
      image(_background, 20, 65, 560, 480);
    }
    
    else if( _features != null ){
      _features.display();
    }
    
    showExits();
    displayTools();
    showIslanders();
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
    _features.add(p, fillColor, strokeColor, strokeWidth);
  }
  
  void addFeature(PShape p, int fillColor, int transparency, int strokeColor, int strokeWidth){
    _features.add(p, fillColor, transparency, strokeColor, strokeWidth);
  }
  
  void addFeature(PShape p, int fillColor, int transparency){
    _features.add(p, fillColor, transparency);
  }
  
  void addIslander(Islander i){
    _villagers.add(i);
  }
  
  void removeIslander(Islander i){
    _villagers.remove(i);
  }
  
  void showIslanders(){
    for( Islander i: _villagers ){
      i.display();
    }
  }
}