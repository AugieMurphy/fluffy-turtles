import java.util.LinkedList;

 class LLStack<T> implements Stack<T> 
{
     LinkedList<T> _stack = new LinkedList<T>();
     int _stackSize = 0;

     void push(T  x){
	    _stack.addFirst(x);
	    _stackSize+=1;
    }
    
    void pushLast(T  x){
      _stack.addLast(x);
      _stackSize+=1;
    }
     T pop(){
        if(_stack.size() ==0){
	          return null;
	        }
	      else{
	        T retT =  _stack.remove();
	        _stackSize -=1;
	        return retT;
	       } 
      }

     T peek(){
       	if(_stackSize == 0){
	        return null;
	        }
	    return _stack.getFirst();
    }

     boolean isEmpty(){
	      if(_stackSize == 0){
	          return true;
	        }
	      return false;
      }
}


   