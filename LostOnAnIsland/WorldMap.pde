class WorldMap{
  
  int _screen = 1;
  
  WorldMap(){
    //Create the different Locations
    Location l1 = new Location( "Beach-- Crash Site", "You were shipwrecked at this site..." );
    Location l2 = new Location("Village Entrance", "You've stumbled upon the entrance to a small village..." );
    Location l3 = new Location("Main Square", "This is the Main Square of the village...");
    
    //Connect the nodes using paths 
    l1.addExit( new Path(l2, sign(550,50)) );
    l2.addExit(new Path(l1, sign(50,50)) );
  }
  
  void displayl1(){
  }
  
  void displayl2(){
  }
  
  void displayl3(){
  }
  
  Polygon sign(int x, int y){    
    return null;
  }
  
  void showScreen(){
    if( _screen == 1 ){ }
    else if( _screen == 2 ){ }
    else if( _screen == 3 ){ }
  }
}