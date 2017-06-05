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
   
   Requirement getReq(){
     return req;
   }
   
   String getStatus(){
     if( complete ){ return "STATUS: COMPLETE"; }
     else{ return "STATUS: IN PROGRESS"; }
   }
   
 
}