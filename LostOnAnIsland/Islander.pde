
class Islander{
  
  /*** VARIABLES ***/
  
  boolean talking = false;
  
  int x; // x-cor of position
  int y; // y-cor of position
  
  LLStack<String> _dialogue; // what to say when they're clicked on
  String curr;
  
  String _name; // name
  //PShape _character, _head, _robeBody, _leftArm, _rightArm, _leftEye, _rightEye, _hair, _mouth;
  PImage _image;

  Islander(int iX, int iY, String iNAME, PImage iIMAGE){
    
    curr = "";
    _name = iNAME;
    x = iX;
    y = iY;
    _dialogue = new LLStack<String>();
    /**
    _character = createShape(GROUP);
    _character.setStrokeWeight(4);
    _hair = createShape(ELLIPSE,x,y+25,80,150);
    _hair.setFill(0xff400601);
    _character.addChild(_hair);
    
    _head = createShape(ELLIPSE,x,y,50,50);
    _head.setFill(0xffBC9C74);
    _character.addChild(_head);
    
    _robeBody = createShape(QUAD,x-15,y+25,x-50,y+175,x+50,y+175,x+15,y+25);
    _robeBody.setFill(0xff329B85);
    _character.addChild(_robeBody);
    
    _leftArm = createShape(QUAD,x-25,y+25,x-45,y+100,x-25,y+100,x-15,y+25); 
    _rightArm = createShape(QUAD,x+25,y+25,x+45,y+100,x+25,y+100,x+15,y+25); 
    _rightArm.setFill(0xff329B85);
    _leftArm.setFill(0xff329B85);
    _character.addChild(_leftArm);
    _character.addChild(_rightArm);
    
    _leftEye = createShape(ELLIPSE,x-10,y-5,5,5);
    _rightEye = createShape(ELLIPSE,x+10,y-5,5,5);
    _leftEye.setStroke(0xff05417C);
    _leftEye.setFill(0xff05417C);
    _rightEye.setStroke(0xff05417C);
    _rightEye.setFill(0xff05417C);
    _character.addChild(_leftEye);
    _character.addChild(_rightEye);
    
    _mouth = createShape(ELLIPSE,x,y+10,10,2);
    _mouth.setStroke(0xffE54175);
    _character.addChild(_mouth);
    **/
    _image = iIMAGE;
  }
   
  public void addCrown(){
    /**
    PShape _crown = createShape();
    _crown.beginShape();
    _crown.noStroke();
    _crown.vertex(x-20,y-30);
    _crown.vertex(x-20,y-40);
    _crown.vertex(x-15,y-35);
    _crown.vertex(x-10,y-40);
    _crown.vertex(x-5,y-35);
    _crown.vertex(x,y-45);
    _crown.vertex(x+5,y-35);
    _crown.vertex(x+10,y-40);
    _crown.vertex(x+15,y-35);
    _crown.vertex(x+20,y-40);
    _crown.vertex(x+20,y-30);
    _crown.vertex(x-20,y-30);
    _crown.endShape();
    _crown.setFill(0xffFAD177);
    _character.addChild(_crown);
    **/
  }
  
  public void display(){
    image(_image,x,y);
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
    return abs(mouseX - x) < 50 && abs(mouseY - y) < 50;
  }
  
  public void interact(){
      stroke(0);
      strokeWeight(2);
      PShape txtBox = createShape(RECT,x-250,y-25,200,75,5,5,5,5);
      txtBox.setFill(255);
      fill(0);
      shape(txtBox);
      text( curr, x-150, y-5 );
  }
  

}