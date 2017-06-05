class Quest{
 String message;
 int ID;
 boolean complete;
 Requirement req;
 
 
   //Constructor - contructor must be called with a certain ID in mind.
   
   Quest(int id){
     ID = id;// Quests wil have identifiers so that it will internally know how to be solved
     //or maybe not
     if(ID == 0){//each individual quest will have its own text and completion requirement
       message ="this is a dummy quest. please reboot if you somehow get this error";
       complete = false;
     }
     if(ID == 1){//each individual quest will have its own text and completion requirement
       message ="Go to village";
       complete = false;
     }
     if(ID == 2){//each individual quest will have its own text and completion requirement
       message ="Talk to villagers to find clues";
       complete = false;
     }
     if(ID == 3){//each individual quest will have its own text and completion requirement
       message ="Go to the forest to find the first wood piece";
       complete = false;
     }
    
  
   }
   
   Quest(int id, String m){//Quests can be made wit ha certain ID and message in mind
     ID = id;
     message = m;
     complete = false;
     //current = null;
   }
   
   Quest(int id, String m, Requirement r){
     ID = id;
     message = m;
     complete = false;
     req = r;
   }
   
   String getMessage(){
     return message;
   }
   
   boolean completionReq(Location Loc, Islander Isl, Features item){
     if (ID == 1){
       if(Loc.ID == 1){
         return true;}}
     if (ID == 2){
       if(Islander.ID == 5){//Arbitratry Islander ID, will give specefic clue
         return true;}}
     if (ID == 3){
       if(item.id == 2){//ID for WP 1
         return true;}} 
         
       return false;}
    
   
   Requirement getReq(){
     return req;
   }
   
   String getStatus(){
     if( complete ){ return "STATUS: COMPLETE"; }
     else{ return "STATUS: IN PROGRESS"; }
   }
   
 
}