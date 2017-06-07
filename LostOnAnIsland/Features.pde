class Feature{
  
  PShape _shape;
  int skyColor;
  int id;
  
  Feature(){
    _shape = createShape();
    skyColor = -1;
  }
  
  Feature(PShape newShape, int fillColor, int strokeColor, int strokeWidth){
    newShape.setFill(fillColor);
    newShape.setStroke(strokeColor);
    newShape.setStrokeWeight(strokeWidth);
    _shape = newShape;
  }
  
  Feature(PShape newShape, int fillColor, int transparency, int strokeColor, int strokeWidth){
    newShape.setStroke(strokeColor);
    newShape.setStrokeWeight(strokeWidth);
    newShape.setFill(fillColor, transparency);
    _shape = newShape;
  }
  
  Feature(PShape newShape, int fillColor, int transparency){
    newShape.setFill(fillColor, transparency);
    _shape = newShape;
  }
  
  public void draw(){
    shape(_shape);
  }
  
  
}