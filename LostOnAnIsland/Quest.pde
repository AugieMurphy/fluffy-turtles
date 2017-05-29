class Quest{
 String message;
 int ID;
 boolean complete;
 Location current;
 
 
   //Constructor - contructor must be called with a certain ID in mind.
   
   Quest(int id){
     ID = id;
     current = getLocation();
     if(ID == 0){
       message ="this is a dummy quest. please reboot if you somehow get this error";
       complete = false;
     }
   }
   
   boolean requirement(){
     if(ID == 0){
       if(current.ID == 0){
         return true;
       }
     }
     return false;
   }
   
   Location getLocation(){
     /* need some sort of way of getting the current location. wil need some odd
     crosswork between worldpmap, LOAI, and Quest*/
     
       
}
}