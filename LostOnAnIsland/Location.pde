class Location implements Requirement{
  
  /*** VARIABLES ***/
  String _name;
  String _description;
  public ArrayList<Path> _exits; //basically makes a linked list because each location links to others
  PImage _background;
  int ID;
  ArrayList<Tool> _tools;
  Location _currLocation;
  Features _features;
  
  Location(){
    _name = "";
    _description = "";
    _exits = new ArrayList<Path>();
    ID = 0;
    _tools = new ArrayList<Tool>();
    _currLocation = null;
    _features = new Features();
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
  
  public void display(){
    
    updateLocation(); //if the user is clicking on an exit, go to that destination
    
    /*** should display the background ***/
    
    // if there's a background image, display it
    if(_background != null) { 
      image(_background, 20, 65, 560, 480);
    }
    
    // if there's no background image, but there's a drawn background, display it
    else if( _features != null ){
      _features.display();
    }
    
    //just displays/draws an island as default image if there is no location
    else {
      fill(0, 216, 242);
      rect(20, 60, 560, 480);
      fill(250, 241, 222);
      ellipse(250, 250, 250, 250);
    }
    
    //displays the path to a new location
    showExits();
    //displays the tools
    displayTools();
    
    /*
    for(int i = 0; i < _exits.size(); i++){
      (_exits.get(i)).displayShape();
    }
    */
    textAlign(CENTER);
    text(getDescription(),300,50);
  }
    
  public void showExits(){
     for(int i = 0; i < _exits.size(); i++){
       (_exits.get(i)).displayShape();
     }
  }
  
  void addExit(Path p){
    _exits.add(p);
  }
  
  
  public void addTool(Tool t){
    _tools.add(t);
  }
  
  public void removeTool(Tool t){
    for( int i = 0; i < _tools.size(); i++ ){ 
      if( _tools.get(i) == t ){ _tools.remove(i); }
    }
  }
  
  public void displayTools(){
    for( int i = 0; i < _tools.size(); i++ ){ 
      _tools.get(i).display();
    }
  }
  
  public int getID(){
    return ID;
  }
  
  public void updateLocation(){
    int i = -1;
    for(int x = 0; x < _exits.size(); x++){
      if((_exits.get(x).contains(mouseX, mouseY) && mousePressed ) || (_exits.get(x).contains(p.getX() + 20, p.getY() + 25)))
      {
        i = x;
      }
    }
    if(i > -1){
      //System.out.println("new door");
      _currLocation = (_exits.get(i)).getDestination();
    }
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
  
}