class Tool{
  
  Shape _tool;
  
  int xcoor;
  int ycoor;
  
  Tool(int x, int y){
    xcoor = x;
    ycoor = y;
    int[] xcors = {(int) x, (int) (x + 30), (int) x, (int)(x + 30)};
    int[] ycors = {(int) y, (int) y, (int) (y + 30), (int) (y + 30)};
    _tool = new Polygon(xcors, ycors, 4);
  }
  
  Tool(Polygon p){
    _tool = p;
  }
  
  Shape getShape(){
    return _tool;
  }
  
  public void display(){
    if( _tool == null){ }
    else if(_tool instanceof Polygon){
      rect(xcoor, ycoor, 30, 50);
    }
  }
  
  public void display(int x, int y){
    if( _tool == null){ }
    else if(_tool instanceof Polygon){
      rect(x, y, 30, 30);
    }
  }
  
  //checks if x and y are within its shape's boundaries
  boolean contains(int x, int y){
    if(_tool == null) {
      System.out.println("no shape");
      return false;}
    else{
      return _tool.contains(x,y);
    }
  }
  
  public void applyTo(/*Feature f*/){
  }
  
  public void select(){
    // if it's not in the inventory, pick it up.
    // if it's in the inventory, highlight the box
  }
  
}