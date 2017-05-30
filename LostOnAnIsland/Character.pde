class Character{
  String name;
  int ID;
  Quest _sideQ;
  String[] messages;
  int state;
  
  String talk(){
    return messages[0];
    if state == 1; state =0;
    else state =1;
    
  }
  Quest giveQ(){
    return _sideQ;
  }
}
  
  