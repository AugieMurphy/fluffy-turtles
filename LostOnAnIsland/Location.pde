class Location{
  
  /*** VARIABLES ***/
  String _name;
  String _description;
  ArrayList<Path> _exits; //we could use a linked list here
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
  }
    Location(String title, String moreInfo, PImage scenery, int id){
    _name = title;
    _description = moreInfo;
    _exits = new ArrayList<Path>();
    _background = scenery;
    ID = id;
  }
  
  void addExit(Path p){
    _exits.add(p);
  }
  
}