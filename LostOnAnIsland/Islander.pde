import java.awt.Rectangle;

class Islander extends Sprite{
  
  /*** VARIABLES ***/

  Islander(int iX, int iY, String iNAME, String iIMAGE, int id,int nX, int nY){
    super(iX, iY, iNAME, iIMAGE,id,nX,nY);
    _tools = new ArrayList<Tool>();
    _quests = new LLStack<Quest>();
  }
  
  void draw(){
    super.draw();
  }
  
  void mousePressed(){
    super.mousePressed();
    if( (ID == 0) && (p._quests._stackSize == 1) ){
       _screen++;
    }
  }

  int keyPressed(){
    givingOptions = false;
    questAccepted = (key == 'X' || key == 'x');
    if(questAccepted){ return 1; }
    else return 0;
  }
  
  //Precondition: cannot contain a question mark
  void addSpeech(String s){ // add a new thing to say to _dialogue
    super.addSpeech(s);
  }
  
  boolean isHotspot(){
    return (mouseX > xcoor && mouseX < xcoor + W) && (ycoor < mouseY && mouseY < H + ycoor);
  }
  
  void interact(){
      stroke(0);
      strokeWeight(2);
      PShape txtBox = createShape(RECT,xcoor-150,ycoor-85,200,75,5,5,5,5);
      txtBox.setFill(255);
      fill(0);
      shape(txtBox);
      text( curr, xcoor-50, ycoor-65 );
      strokeWeight(0);
  }
  
  void hovering(){
    super.hovering();
  }
  
  void giveGift(){ 
    p.receiveTool(_tools.remove(0));
  }
  
  void giveQuest(Quest q){
    super.giveQuest(q);
  }
  
  void setQuestion(String s){
    super.setQuestion(s);
  }
  
  void giveOptions(){
    super.giveOptions();
  }
  
  void setOptions(String _good, String _bad){
    super.setOptions(_good,_bad);
  }
  
  void addQuest(Quest q){
    super.addQuest(q);
  }

  void addTool(Tool t){
    super.addTool(t);
  }
  
}