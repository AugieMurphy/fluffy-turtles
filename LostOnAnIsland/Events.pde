class Event{
  
  PImage _tileSheet;
  PImage[] _tiles = new PImage[12];
  int W;
  int H;
  int frame;
  
  Event(int nX,int nY){
    imageMode(CENTER);
    _tileSheet = loadImage("story1.png");
    W = _tileSheet.width/nX;
    H = _tileSheet.height/nY;
    for( int i = 0; i < _tiles.length; i++ ){
      int x = i%nX*W;
      int y = i/nX*H;
      _tiles[i] = _tileSheet.get(x,y,W,H);
    }
    frame = 0;
  }
  
  void draw(){
    if( frame < _tiles.length ){
      background(0);
      fill(#D1F2FF);
      rect(200,200,200,200);
      
      frame = frameCount / 100;
      imageMode(CENTER);
      image(_tiles[frame],width/2,height/2,200,200);
    }
  }
  
}