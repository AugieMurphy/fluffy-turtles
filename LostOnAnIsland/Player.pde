class Player extends Sprite{
  

  Inventory _inventory;
  double reputation;
  Location place;
  
 Player(String n){
   super(400,350, n, "placeHolder.png", -1, 3, 4);
   reputation = 50.0;
   _inventory = new Inventory();
   place = new Location();
 }
 
 int getX(){
   return (int) xcoor;
 }
 
 void setLocation(Location l){
   place = l;
 }
 
 int getY(){
   return (int)ycoor;
 }
 
 //returns player sprite
 PImage getImage(){
   return _sprites[frame];
 }
 
 String getName(){
   return _name;
 }
 
 boolean hasTool( Tool _tool ){
   for( int i = 0; i < _inventory.size(); i++ ){
     if( _inventory.get(i) == _tool ){ return true; }
   }
   return false;
 }
 
 void addTool(Tool tool, Location l){
     _inventory.collect(tool,l);
     _messages.push("You've found a new tool: \n" + tool.getName() + " \n has been added to your inventory!!!");
     messaging = true;
     currMessage = _messages.pop();
     //return tool.getName();
 }
 
 void receiveTool(Tool t){
   _inventory.receive(t);
   _messages.push("Woah... They just gave you a new tool: \n" + t.getName() + " \n has been added to your inventory!!!");
   messaging = true;
   currMessage = _messages.pop();
 }
 
 //decBy = amt to decrease reputation by
 double decReputation(double decBy){
   reputation -= decBy;
   return reputation;
 }
 
 double incReputation(double incBy){
   reputation += incBy;
   return reputation;
 }
 
 void addQuest(Quest quest){
   _quests.push(quest);
 }
 
 void popQuest(){
   Quest q = _quests.peek();
   if( !_quests.isEmpty() ){
     if (q.getReq() instanceof Location) {
       if (this.place == q.getReq())
         _quests.pop();
     }
     else if(q.getReq() instanceof Tool){
       Tool t = (Tool) q.getReq();
       if(hasTool(t)) {
         _quests.pop();
       }
     }
     // add other cases for different kinds of quest  
   }
 }
 
 void questAlert(Quest q){
    _messages.push("NEW QUEST ALERT: \n" + q.getMessage() + "  " + q.getStatus());
    messaging = true;
    currMessage = _messages.pop();
 }
 
 Quest peekQuest(){
   return _quests.peek();
 }
 
 
 //user can move around the player instead of just pointing and clicking
 //problem is, user must press a new key in order to stop its movement
 //b is if key is pressed
 void keyPressed(){
   if(!questioning){
     //display updated character's location
     if(place != null){
        super.frame = frameCount%3;
        if(keyCode == UP || key == 'w' || key == 'W'){
          ycoor -= 10;
          super.frame+=9;
        }
        else if(keyCode == DOWN || key == 's' || key == 'S'){
          super.ycoor += 10;
        }
        else if(keyCode == RIGHT || key == 'd' || key == 'D'){
          super.xcoor += 10;
          super.frame+= 6;
        }
        else if(keyCode == LEFT || key == 'a' || key == 'A'){
          super.xcoor -= 10;
          super.frame += 3;
        }
      }
      if(xcoor < place.xborderI+50){// The following code sets to border for how to player can walk.
        xcoor +=5;
      }
      if(xcoor > place.xborderII-40){
        xcoor -=5;
      }
      if(ycoor < place.yborderI){
        ycoor +=5;
      }
      if(ycoor > place.yborderII-50){
        ycoor -=5;
      }
   }
 }
 
 void draw(){
   image(_sprites[frame],xcoor,ycoor,50,70);
    if( talking ){ interact(); }
    if(questAccepted){ 
      while( !(_quests.isEmpty()) ){ 
          Quest quest = _quests.pop();
          giveQuest(quest); 
      }
    }
   sideBar();
 }
 
 /**
 //move the player w/o user's control
 void move(float coor, String direction){
   if(direction.equals("x"))
       xcoor += coor;
   else if(direction.equals("-x")) 
     xcoor -= coor;
   else if(direction.equals("y")) 
     ycoor += coor;
   else if(direction.equals("-y")) 
     ycoor -= coor;
   image(image, xcoor, ycoor, 40, 50); //display updated character's location
 }
 **/
 void showInventory(){
   _inventory.display();
 }
 
 void sideBar(){
   _inventory.sideBar();
 }
 
 void updateQuest(){
 }
 
 void interact(){
   for( Islander i: place._villagers ){
   }
   for( Pirate matey: place._pirateClan ){
   }
   for( Feature f: place._features ){
   }
 }
 
 void mousePressed(){
   _inventory.mousePressed();
 }
 
}