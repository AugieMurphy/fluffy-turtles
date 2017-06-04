
class Islander{
  
  /*** VARIABLES ***/
  
  boolean talking = false;
  
  int x; // x-cor of position
  int y; // y-cor of position
  int iWidth;
  int iHeight;
  
  LLStack<String> _dialogue; // what to say when they're clicked on
  String curr;
  
  String _name; // name
  //PShape _character, _head, _robeBody, _leftArm, _rightArm, _leftEye, _rightEye, _hair, _mouth;
  PImage _image;

  Islander(int iX, int iY, String iNAME, String iIMAGE){
    
    curr = "";
    _name = iNAME;
    x = iX;
    y = iY;
    _dialogue = new LLStack<String>();
    _image = loadImage(iIMAGE);
    iWidth = 15;
    iHeight = 30;
  }
  
  Islander(int iX, int iY, String iNAME, String iIMAGE, int newWidth, int newHeight){
    
    curr = "";
    _name = iNAME;
    x = iX;
    y = iY;
    _dialogue = new LLStack<String>();
    _image = loadImage(iIMAGE);
    iWidth = newWidth;
    iHeight = newHeight;
  }
  
  public void display(){
    image(_image,x,y,iWidth,iHeight);
    //shape(_character);
    if( talking ){ interact(); }
  }
  
  public String talk(){ // remove and return the next thing to say from _dialogue
    if( !_dialogue.isEmpty() ){
      return _dialogue.pop();
    }
    else return "";
  }
  
    
  public void speakSwitch(){
    if( talking && _dialogue.isEmpty() ){ talking = !talking; }
    else if( !talking && _dialogue.isEmpty() ){ curr = talk(); }
    else if( talking ){ curr = talk(); }
    else{ talking = true; }
  }
  
  public void addSpeech(String s){ // add a new thing to say to _dialogue
    _dialogue.push(s);
    curr = _dialogue.peek();
  }
  
  public boolean isHotspot(){
    
    return (mouseX > x && mouseX < x + iWidth) && (y < mouseY && mouseY < iHeight + y);
  }
  
  public void interact(){
      stroke(0);
      strokeWeight(2);
      PShape txtBox = createShape(RECT,x-150,y-85,200,75,5,5,5,5);
      txtBox.setFill(255);
      fill(0);
      shape(txtBox);
      text( curr, x-50, y-65 );
      strokeWeight(0);
  }
  

}