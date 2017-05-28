class Location{
  
  /*** VARIABLES ***/
  String _name;
  String _description;
  ArrayList<Path> _exits; //we could use a linked list here
  PImage _background;
  
  Location(){
    _name = "";
    _description = "";
    _exits = new ArrayList<Path>();
  }
  
  Location(String title, String moreInfo){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
  }
    Location(String title, String moreInfo, PImage scenery){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    _background = scenery;
  }
  
  void addExit(Path p){
    _exits.add(p);
  }
  
}