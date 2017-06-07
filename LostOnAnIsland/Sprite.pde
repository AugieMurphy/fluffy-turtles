abstract class Sprite{
  
  /*** VARIABLES ***/
  String _name; // name
  int ID;
  int health;
  
  PImage _spritesheet;
  PImage[] _sprites = new PImage[12];
  int DIM;
  int W;
  int H;
  int frame;
  int xcoor;
  int ycoor;
  
  ArrayList<Tool> _tools;
  LLStack<Quest> _quests;
  
  boolean talking = false;
  LLStack<String> _dialogue; // what to say when they're clicked on
  String curr; // next thing to say
  
  String question = "";
  String good = "";
  String bad = "";
  boolean questAccepted = false;
  boolean givingOptions = false;
  
  Sprite(int nX,int nY){
    curr = "";
    _name = "";
    xcoor = -1;
    ycoor = -1;
    _dialogue = new LLStack<String>();
    imageMode(CENTER);
    _spritesheet = loadImage("charlieBrownSprite.png");
    W = _spritesheet.width/nX;
    H = _spritesheet.height/nY;
    xcoor = 100;
    ycoor = 100;
    for( int i = 0; i < _sprites.length; i++ ){
      int x = i%nX*W;
      int y = i/nX*H;
      _sprites[i] = _spritesheet.get(x,y,W,H);
    }
    _tools = new ArrayList<Tool>();
    _quests = new LLStack<Quest>();
  }
  
 Sprite(int iX, int iY, String iNAME, String spriteFile, int id, int nX, int nY){
    curr = "";
    _name = iNAME;
    xcoor = iX;
    ycoor = iY;
    _dialogue = new LLStack<String>();
    _spritesheet = loadImage(spriteFile);
    W = _spritesheet.width/nX;
    H = _spritesheet.height/nY;
    for( int i = 0; i < _sprites.length; i++ ){
      int x = i%nX*W;
      int y = i/nX*H;
      _sprites[i] = _spritesheet.get(x,y,W,H);
    }
    ID = id;
    _tools = new ArrayList<Tool>();
    _quests = new LLStack<Quest>();
  }
  
  void draw(){
    image(_sprites[frame],xcoor,ycoor,100,180);
    if( talking ){ interact(); }
    if(questAccepted){ 
      while( !(_quests.isEmpty()) ){ 
          Quest quest = _quests.pop();
          giveQuest(quest); 
      }
    }
  }
  
  int keyTriggered(){
    givingOptions = false; 
    questAccepted = (key == 'X' || key == 'x');
    boolean questDenied = (key == 'Y' || key == 'y');
    if(questAccepted){ return 1; }
    else if(questDenied){ return -1; }
    else{ return 0; }
  }
  
  /**
  void keyPressed(){
    frame++;
  
      frame = frameCount%3;
      if(keyCode == UP || key == 'w' || key == 'W'){
         ycoor -= 10;
         frame+=9;
       }
       else if(keyCode == DOWN || key == 's' || key == 'S'){
         ycoor += 10;
        
       }
       else if(keyCode == RIGHT || key == 'd' || key == 'D'){
         xcoor += 10;
         frame+= 6;
       }
       else if(keyCode == LEFT || key == 'a' || key == 'A'){
         xcoor -= 10;
         frame += 3;
       }
  
  }
  **/
  
  void mousePressed(){
    if( isHotspot() ){ 
      if( _dialogue.isEmpty() ){ talking = false; }
      else{ 
        talking = true; 
        curr = _dialogue.pop(); 
        if(curr.equals(question)) {
          questioning = true; 
          giveOptions();
        }
      }
    }
  }
  
  public void addSpeech(String s){ // add a new thing to say to _dialogue
    _dialogue.push(s);
    curr = _dialogue.peek();
  }
  
  public boolean isHotspot(){
    return (mouseX > xcoor && mouseX < xcoor + W) && (ycoor < mouseY && mouseY < H + ycoor);
  }
  
  void hovering(){
    if( isHotspot() ){ text(_name, xcoor, ycoor); }
  }
  
  
  void giveQuest(Quest q){
    p.addQuest(q);
    while(!(_messages.isEmpty())) {System.out.println(_messages.pop());}
    _messages.push("NEW QUEST ALERT: \n" + q.getMessage() + "  " + q.getStatus());
     messaging = true;
     currMessage = _messages.pop();
     System.out.println(currMessage);
   //questAccepted = false;
  }
  
  void setQuestion(String s){
    question = s;
    _dialogue.pushLast(s);
    curr = _dialogue.peek();
  }
  
  void giveOptions(){
    givingOptions = true;
    _messages.push("Press X: " + good + "\n \n Y: " + bad);
    messaging = true;
    currMessage = _messages.pop();
   
  }
  
  void setOptions(String _good, String _bad){
    good = _good;
    bad = _bad;
  }
  
  void addQuest(Quest q){
    _quests.push(q);
  }

  void addTool(Tool t){
    _tools.add(t);
  }
  
  void removeTool( Tool t ){
    for( int i = 0; i <_tools.size(); i++ ){
      if( _tools.get(i) == t ){ _tools.remove(i); }
    }
  }
  
  abstract void interact();
  
}