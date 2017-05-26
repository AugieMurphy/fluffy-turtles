
import java.util.ArrayList;

class TreeNode<T> 
{
    
    T _cargo;//this node's data
    ArrayList<TreeNode> children; //arraylist to point to all next possible pathways/locations
    int ID;
    
    
    


    /*****************************************************
     * default constructor
     * Construct a tree node with specified value, 
     * with null left and right subtrees.
     *****************************************************/
    TreeNode( T initValue, int id )
    {
	_cargo = initValue;
  children = new ArrayList<TreeNode>();
  ID = id;
    }
          

    /*****************************************************
     * overloaded constructor
     * Construct a tree node with specified
     * value and subtrees.
     *****************************************************/
    TreeNode( T initValue, ArrayList<TreeNode> nodes, int id) 
    {
	this(initValue,id);
	children = nodes;
    }
 

    /*****************************************************
     * Returns the left subtree of this node.
     *****************************************************/
    TreeNode getChild(int index) 
    {
	return children.get(i);
    }


   


    /*****************************************************
     * Returns the value stored in this tree node.
     *****************************************************/
    T getValue() 
    {
	return _cargo;
    }
    
    
    /*****************************************************
     * Returns the right sibling of the node;     
     *****************************************************/
 

    /*****************************************************
     * Sets the value of the left subtree of this node.
     *****************************************************/
    void addChild( TreeNode newChild ) 
    {
	children.add(newChild);
    }


    /*****************************************************
     * Sets the value of this tree node.
     *****************************************************/
    void setValue( T theNewValue ) 
    {
	_cargo = theNewValue;
    }
 
}//end class