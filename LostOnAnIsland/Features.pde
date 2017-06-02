class Features{
  
  ArrayList<PShape> _place;
  int skyColor;
  
  Features(){
    _place = new ArrayList<PShape>();
    skyColor = -1;
  }
  
  void skyColor(int i){
    skyColor = i;
  }
  
  public void add(PShape p, int fillColor, int strokeColor, int strokeWidth){
    p.setFill(fillColor);
    p.setStroke(strokeColor);
    p.setStrokeWeight(strokeWidth);
    _place.add(p);
  }
  
  public void add(PShape p, int fillColor, int transparency, int strokeColor, int strokeWidth){
    p.setStroke(strokeColor);
    p.setStrokeWeight(strokeWidth);
    p.setFill(fillColor, transparency);
    _place.add(p);
  }
  
  public void add(PShape p, int fillColor, int transparency){
    p.setFill(fillColor, transparency);
    _place.add(p);
  }
  
  public void display(){
    if( skyColor == -1 ){ 
      background(0xffE5EFFF); 
    }
    else{ background(skyColor); }
    for( PShape p: _place ){
      shape(p);
    }
  }
  
  
}