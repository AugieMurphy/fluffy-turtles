
class Islander{
  
  /*** VARIABLES ***/
  
  boolean talking = false;
  int ID;
  int x; // x-cor of position
  int y; // y-cor of position
  int iWidth; // new width of islander
  int iHeight; // new height of islander
  
  LLStack<String> _dialogue; // what to say when they're clicked on
  String curr; // next thing to say
  
  String _name; // name
  PImage _image;
  ArrayList<Tool> _tools;
  LLStack<Quest> _quests;

  Islander(int iX, int iY, String iNAME, String iIMAGE int id){
    curr = "";
    _name = iNAME;
    x = iX;
    y = iY;
    _dialogue = new LLStack<String>();
    _image = loadImage(iIMAGE);
    iWidth = 15;
    iHeight = 30;
    _tools = new ArrayList<Tool>();
    _quests = new LLStack<Quest>();
    ID = id;
  }
  
  Islander(int iX, int iY, String iNAME, String iIMAGE, int newWidth, int newHeight,int id){
    curr = "";
    _name = iNAME;
    x = iX;
    y = iY;
    _dialogue = new LLStack<String>();
    _image = loadImage(iIMAGE);
    iWidth = newWidth;
    iHeight = newHeight;
    _tools = new ArrayList<Tool>();
    _quests = new LLStack<Quest>();
    ID = id;
  }
  
  void display(){
    image(_image,x,y,iWidth,iHeight);
    if( talking ){ interact(); }
    if( _dialogue == null ){ 
      while( _tools != null ){ giveGift(); } 
      while( _quests != null ){ giveQuest(_quests.pop()); }
    }
  }
  
  void mousePressed(){
    if( isHotspot() ){ 
      if( _dialogue.isEmpty() ){ talking = false; }
      else{ talking = true; curr = _dialogue.pop(); }
    }
  }
  
  public void addSpeech(String s){ // add a new thing to say to _dialogue
    _dialogue.push(s);
    curr = _dialogue.peek();
  }
  
  public boolean isHotspot(){
    return (mouseX > x && mouseX < x + iWidth) && (y < mouseY && mouseY < iHeight + y);
  }
  
  void interact(){
      stroke(0);
      strokeWeight(2);
      PShape txtBox = createShape(RECT,x-150,y-85,200,75,5,5,5,5);
      txtBox.setFill(255);
      fill(0);
      shape(txtBox);
      text( curr, x-50, y-65 );
      strokeWeight(0);
  }
  
  void hovering(){
    if( isHotspot() ){ text(_name, x,y); }
  }
  
  void giveGift(){ 
    p.receiveTool(_tools.remove(0));
  }
  
  void giveQuest(Quest q){
    p.addQuest(q);
    _messages.push("NEW QUEST ALERT: \n" + q.getMessage() + q.getStatus());
    messaging = true;
    currMessage = _messages.pop();
  }
  
  void addQuest(Quest q){
    _quests.push(q);
  }

  void addTool(Tool t){
    _tools.add(t);
  }
  
}