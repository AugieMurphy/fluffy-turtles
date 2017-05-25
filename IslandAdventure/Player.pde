class Player{
  String name;
  ArrayList<Tool> inventory;
  QuestStack quests;
  storyNode current_node;
  double reputation;
  float xcoor;
  float ycoor;
  PIMage image;
  
 Player(String n, node){
   name = n;
   inventory = new ArrayList<Tool>();
   quests = new QuestStack();
   current_node = node;
   reputation = 50.0;
   image = 
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
 
 void move(){
   if(keyPressed()){
     if(keyCode == UP || key == 'w' || key == 'W')
 }
 
}