class Location{
  
  /*** VARIABLES ***/
  String _name;
  String _description;
  public ArrayList<Path> _exits; //we could use a linked list here
  PImage _background;
  int ID;
  
  Location(){
    _name = "";
    _description = "";
    _exits = new ArrayList<Path>();
    ID = 0;
  }
  
  Location(String title, String moreInfo,int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    ID = id;
    _background = null;
  }
    Location(String title, String moreInfo, PImage scenery, int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    _background = scenery;
    ID = id;
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
    //should include some bg characters too
    //but mostly should display the bg
    if(_background != null) {
     // System.out.println("root");
      image(_background, 20, 65, 560, 480);
    }
    else {
      fill(0, 216, 242);
      rect(20, 60, 560, 480);
      fill(250, 241, 222);
      ellipse(250, 250, 250, 250);
    }

  }
  
  void addExit(float xcoor, float ycoor, Location place){
    Path p = new Path(place, xcoor, ycoor);
    _exits.add(p);
  }
  
  void addExit(Path p){
    _exits.add(p);
  }
  
}