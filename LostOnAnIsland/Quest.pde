class Quest{
 String message;
 int ID;
 boolean complete;
 
 
 
   //Constructor - contructor must be called with a certain ID in mind.
   
   Quest(int id){
     ID = id;// Quests wil have identifiers so that it will internally know how to be solved
     
     if(ID == 0){//each individual quest will have its own text and completion requirement
       message ="this is a dummy quest. please reboot if you somehow get this error";
       complete = false;
     }
   }
   
   Quest(int id, String m){//Questc can be made wit ha certain ID and message in mind
     ID = id;
     message = m;
     complete = false;
     //current = null;
   }
   
   String getMessage(){
     return message;
   }
   
  //Needs to be fleshed out. All quests will have a competion requirement settled by their ID's.
   /*
   boolean requirement(Location place, Feature<T> thing){
     if(ID == 0){
       if(place.ID == 0){
         return true;
       }
     }     
     return false;
     
   }
   */
   
 
}