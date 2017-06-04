class Tool{
  
  String _name;
  PImage _tool;
  
  int xcoor;
  int ycoor;
  
  Tool(){
    _tool = null;
    xcoor = 100;
    ycoor = 100;
    _name = "";
  }
  
  Tool(String toolName, int x, int y, String fileName){
    _tool = loadImage(fileName);
    xcoor = x;
    ycoor = y;
    _name = toolName;
  }
  
  public void display(){
    if( _tool == null){ }
    else{ image(_tool,xcoor,ycoor); }
  }
  
  public void display(int x, int y){
    if( _tool == null){ }
    else{
      image(_tool,x,y);
    }
  }
  
  //checks if x and y are within its shape's boundaries
  boolean contains(int x, int y){
    if(_tool == null) {
      System.out.println("no shape");
      return false;
  }
    else{
      if( abs(xcoor - x) < 20 && abs(ycoor - y ) < 20 ){ return true; }
      else{ return false; }
    }
  }
  
  public void applyTo(/*Feature f*/){
  }
  
  public void select(){
    // if it's not in the inventory, pick it up.
    // if it's in the inventory, highlight the box
  }
}