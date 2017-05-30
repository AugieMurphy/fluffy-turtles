class Quest{
 String message;
 int ID;
 boolean complete;
 
 
 
   //Constructor - contructor must be called with a certain ID in mind.
   
   Quest(int id){
     ID = id;
     current = null;
     if(ID == 0){
       message ="this is a dummy quest. please reboot if you somehow get this error";
       complete = false;
     }
   }
   
   Quest(int id, String m){
     ID = id;
     message = m;
     complete = false;
     current = null;
   }
   
   String getMessage(){
     return message;
   }
   
  
   
   boolean requirement(Location place, Feature<T> thing){
     if(ID == 0){
       if(place.ID == 0){
         return true;
       }
     }     
     return false;
     
   }
   
 
}