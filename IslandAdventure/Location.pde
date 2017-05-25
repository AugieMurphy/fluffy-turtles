class Location{
  
  Polygon _path;
  String _description;
  ArrayList<Integer> _vertices = new ArrayList<Integer>();
  
  Location(){
    drawWalls();
    drawFloor();
    drawRoof();
    createDoor();
    drawDoor();
  }
  
  Location(Polygon p){
    drawWalls();
    drawFloor();
    drawRoof();
    _path = p;
  }
  
  /* Helpers */
  void drawWalls(){
    background(255);
    stroke(0);
    strokeWeight(4);
    fill(#FFE4E1); 
    quad(0,600,0,0,100,100,100,500);
    quad(600,600,600,0,500,100,500,500);   
    quad(100,100,100,500,500,500,500,100); 
  }
     
  void drawFloor(){
   stroke(0);
   strokeWeight(4);
   fill(#8B4513);
   quad(0,600,100,500,500,500,600,600);
  }
  
  void drawRoof(){
   stroke(0);
   strokeWeight(4);
   fill(#F0FFFF);
   quad(0,0,100,100,500,100,600,0);
  }
  
  void drawDoor(){
    fill(#D6FFB9);
    quad(250,500,350,500,350,300,250,300);
    fill(255);
  }
  /*End of GameScreen Helpers*/ 
  
  void addPoint(int x,int y){
    _vertices.add(x); _vertices.add(y);
    _path.addPoint(x,y);
  }
  
  void createDoor(){
    _path = new Polygon();
    _path.addPoint(250,500);
    _path.addPoint(350,500);
    _path.addPoint(250,300);
    _path.addPoint(350,300);
  }
  
   Polygon getPath(){
    return _path;
  }
  
  boolean contains(int x, int y){
    return _path.contains(x,y);
  }
}