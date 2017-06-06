class Player{
  
  String name;
  Inventory _inventory;
  LLStack<Quest> quests;
  //LLNode<Story> current_node;
  double reputation;
  float xcoor; //keep track of location in case it gets to a path
  float ycoor; //keep track of location
  PImage image;
  Location place;
  
 Player(String n/*, LLNode<Story> node*/){
   name = n;
   //inventory = new ArrayList<Tool>();
   quests = new LLStack<Quest>();
   //current_node = node;
   reputation = 50.0;
   image = loadImage("player_fwd.png");
   xcoor = 425;
   ycoor = 475;
   _inventory = new Inventory();
 }
 
 int getX(){

   return (int) xcoor;
 }
 
 void setLocation(Location l){
   place = l;
 }
 
 int getY(){

   return (int) ycoor;
 }
 //returns player sprite
 PImage getImage(){
   return image;
 }
 
 String getName(){
   return name;
 }

 //methods not implemented yet because we may not be using them yet
 /*void use(Tool tool){
   tool.triggerEvent();
 }
 */
 
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
   reputation -= incBy;
   return reputation;
 }
 
 void addQuest(Quest quest){
   quests.push(quest);
 }
 
 void popQuest(){
   Quest q = quests.peek();
   if (q.getReq() instanceof Location) {
     if (this.place == q.getReq())
       quests.pop();
   }
   else if(q.getReq() instanceof Tool){
     Tool t = (Tool) q.getReq();
     if(hasTool(t)) {
       quests.pop();
     }
   }
   // add other cases for different kinds of quest  
 }
 
 void questAlert(Quest q){
    _messages.push("NEW QUEST ALERT: \n" + q.getMessage() + "  " + q.getStatus());
    messaging = true;
    currMessage = _messages.pop();
 }
 
 Quest peekQuest(){
   return quests.peek();
 }
 
 
 //user can move around the player instead of just pointing and clicking
 //problem is, user must press a new key in order to stop its movement
 //b is if key is pressed
 void move(boolean b){
   //display updated character's location
   if(place != null){
    if(b){
    if(keyCode == UP || key == 'w' || key == 'W'){
       ycoor -= 10;
     }
     else if(keyCode == DOWN || key == 's' || key == 'S'){
       ycoor += 10;
      
     }
     else if(keyCode == RIGHT || key == 'd' || key == 'D'){
       xcoor += 10;
      
     }
     else if(keyCode == LEFT || key == 'a' || key == 'A'){
       xcoor -= 10;
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
    image(image, xcoor, ycoor, 40, 50); 
 }
 
 
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
 
 void showInventory(){
   _inventory.display();
 }
 
 void sideBar(){
   _inventory.sideBar();
 }
 
 void updateQuest(){
   
 }
 
}