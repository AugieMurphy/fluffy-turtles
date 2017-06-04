class Inventory{
  
  ArrayList<Tool> _inventory;
  
  Inventory(){
    _inventory = new ArrayList<Tool>();
  }
  
  void collect(Tool t , Location l){
    _inventory.add( l.removeTool(t) );
  }
  
  Tool select(){
    return null;
  }

  void discard(Tool t){
    for( int i = 0; i < _inventory.size(); i++ ){
      //if( (_inventory.get(i)) == t ){
      // drop/use tool
      }
  }
  
  Tool get(int i){
    return _inventory.get(i);
  }
  
  int size(){
    return _inventory.size();
  }
  
  void sideBar(){
    strokeWeight(2);
    stroke(#95FFA9);
    for(int i = 0; i < 10; i++ ){
      fill(#065201);
      rect(20,65+48*i,50,48);
      if( (_inventory.size()) > i ){
        (_inventory.get(i)).display(40,68+i*6);
        fill(255);
        text((_inventory.get(i)).getName(),45,110+48*i);
      }
    }
    stroke(0);
    strokeWeight(0);
  }
  
  public void display(){
    /**
    stroke(0);
    fill(#C6C6C6);
    for(int i = 0; i < _inventory.length; i++ ){
      rect(0,0,50,60);
      translate(0,60);
      if( _inventory[i] != null ){
      _inventory[i].display(10,i*10);
      }
    }
    translate(0,-600);
  }
  **/
  
    background(#E1E7EA);
    stroke(#0A075D);
    fill(#BCDAFF);
    for(int i = 0; i < _inventory.size(); i++ ){
      if( i > 25 ){ /* idk, tell them they can't carry that much or make another page*/ }
      else if( _inventory.get(i) != null ){
        (_inventory.get(i)).display((i%5)*12+6,(i/5)*10+6);
        fill(0);
        text( (_inventory.get(i)).getName(), (i%5)*12+6, (i/5)*10+12);
      }
    }
  }
}