class Player{
  String name;
  //ArrayList<Tool> inventory;
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
   xcoor = 400;
   ycoor = 300;
   
 }
 
 int getX(){
   System.out.println("X: " + xcoor);
   return (int) xcoor;
 }
 
 void setLocation(Location l){
   place = l;
 }
 
 int getY(){
   System.out.println("Y: " + ycoor);
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
 
 String addTool(Tool tool){
   inventory.add(tool);
   return tool.getName();
 }*/
 
 //decBy = amt to decrease reputation by
 double decReputation(double decBy){
   reputation -= decBy;
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
   // add other cases for different kinds of quest  
 }
 
 Quest peekQuest(){
   return quests.peek();
 }
 
 /*void advanceStory(int pathChosen){
   if(pathChosen < 0){
     current_node = current_node.getLeft();
   }
   else if(pathChosen > 0){
     current_node = current_node.getRight();
   }
 }*/
 
 //user can move around the player instead of just pointing and clicking
 //problem is, user must press a new key in order to stop its movement
 void move(){
   if(keyPressed){
     if(keyCode == UP || key == 'w' || key == 'W'){
       ycoor -= 3;
     }
     else if(keyCode == DOWN || key == 's' || key == 'S'){
       ycoor += 3;
      
     }
     else if(keyCode == RIGHT || key == 'd' || key == 'D'){
       xcoor += 3;
      
     }
     else if(keyCode == LEFT || key == 'a' || key == 'A'){
       xcoor -= 3;
      
     }
   }
   image(image, xcoor, ycoor); //display updated character's location
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
}