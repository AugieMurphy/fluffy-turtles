class Inventory{
  Tool[] _inventory;
  int _size;
  
  Inventory(){
    _inventory = new Tool[10];
    _size = 0;
  }
  
  public void collect(Tool t , Location l){
    _inventory[_size] = t;
    l.removeTool(t);
  }
  
  public Tool select(int x, int y){
    // highlight the tool that was chosen
    // figure out which tool was chosen based on coors
    return null;
  }

  public void discard(Tool t){
    for( int i = 0; i < _inventory.length; i++ ){
      if( _inventory[i] == t ){
      // drop/use tool
      }
    }
  }
  
  public void display(){
    stroke(0);
    strokeWeight(4);
    fill(#94DB99);
    for(int i = 0; i < _inventory.length; i++ ){
      rect(0,0,50,60);
      translate(0,60);
      if( _inventory[i] != null ){
      _inventory[i].display(10,i*10);
      }
    }
    translate(0,-600);
  }
}