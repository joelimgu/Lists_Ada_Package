with Lists;

generic
    type T_Data is private;
    --with function Data_Image(Data:T_Data) return String;
    with function "="(L,R: T_Data) return Boolean;
    with procedure Delete_Object(Object: T_Data);

package trees is

type Tree is tagged private;
type Tab_Of_List_Type is array (Integer range <>) of T_Data;


function Create_N_Bynary_Tree (Dim: Positive; Elements: Tab_Of_List_Type) return Tree;

procedure Append (Self: in out Tree; El: T_Data);

function Is_Empty (Self: in out Tree) return Boolean;







private

type Node;
type P_Node is access Node;



type Tree is tagged record
    Root: P_Node;
    Heigh: Integer;
end record;


function P_Node_To_String (N: P_Node) return String;


procedure Delete_P_Node (N: P_Node);


package List is new Lists(P_Node,P_Node_To_String,"=",Delete_P_Node);

type Node is tagged record
    childs: List.list;
    info: T_Data;
    parent: P_Node;
end record;

end trees;