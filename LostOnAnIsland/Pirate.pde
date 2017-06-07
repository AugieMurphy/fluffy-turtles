class Pirate extends Sprite{
  
  Pirate(int pX, int pY, String pNAME, String pIMAGE,int id, int nX, int nY){
    super(pX, pY, pNAME, pIMAGE,id,nX,nY);
  }
  
  void draw(){
    super.draw();
  }
  
  void mousePressed(){
    super.mousePressed();
  }
  
  void addSpeech(String s){ // add a new thing to say to _dialogue
    super.addSpeech(s);
  }
  
  boolean isHotspot(){
    return super.isHotspot();
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
  
}