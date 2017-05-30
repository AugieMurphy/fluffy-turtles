class Quest{
 String message;
 int ID;
 boolean complete;
 Location current;
 
 
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
   
   void setLocation(Location place){
     current = place;
   }
   
   boolean requirement(Location place){
     if(ID == 0){
       if(current.ID == 0){
         return true;
       }
     }
     else if(current.ID == place.ID){
       return true;
     }
     return false;
     
   }
   
   Location getLocation(){
     /* need some sort of way of getting the current location. wil need some odd
     crosswork between worldpmap, LOAI, and Quest*/
     return current; 
}
}