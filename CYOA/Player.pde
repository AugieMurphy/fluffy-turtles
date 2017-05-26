class Player{
  String name;
  ArrayList<Tool> inventory;
  QuestStack quests;
  LLNode<Story> current_node;
  double reputation;
  float xcoor;
  float ycoor;
  PImage image;
  boolean isDoingSomething;
  
 Player(String n, LLNode<Story> node){
   name = n;
   inventory = new ArrayList<Tool>();
   quests = new QuestStack();
   current_node = node;
   reputation = 50.0;
   image = loadImage("forwards_0.png");
   isDoingSomething = false;
 }
 
 String getName(){
   return name;
 }
 void use(Tool tool){
   tool.triggerEvent();
 }
 
 String addTool(Tool tool){
   inventory.add(tool);
   return tool.getName();
 }
 
 //decBy = amt to decrease reputation by
 int decReputation(int decBy){
   reputation -= decBy;
   return reputation;
 }
 
 String[] getQuests(){
   return _quests.toArray();
 }
 
 void addQuest(Quest quest){
   QuestStack.push(quest);
 }
 
 void advanceStory(int pathChosen){
   if(pathChosen < 0){
     current_node = current_node.getLeft();
   }
   else if(pathChosen > 0){
     current_node = current_node.getRight();
   }
 }
 
 void move(){
   if(keyPressed && !(isDoingSomething)){
     if(keyCode == UP || key == 'w' || key == 'W'){
       ycoor -= 3;
       image = loadImage("back_0.png");
     }
     else if(keyCode == DOWN || key == 's' || key == 'S'){
       ycoor += 3;
       image = loadImage("forwards_0.png");
     }
     else if(keyCode == RIGHT || key == 'd' || key == 'D'){
       xcoor += 3;
       image = loadImage("right_0.png");
     }
     else if(keyCode == LEFT || key == 'a' || key == 'A'){
       xcoor -= 3;
       image = loadImage("left_0.png");
     }
   }
 }
}