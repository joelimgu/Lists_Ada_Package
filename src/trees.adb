with Lists;


package body trees is 


function Create_N_Bynary_Tree (Dim: Positive; Elements: Tab_Of_List_Type) return Tree is
res: Tree;
begin
    null;
end Create_N_Bynary_Tree;

procedure Append (Self: in out Tree; El: T_Data) is
begin
    null;  
end Append;

function Is_Empty (Self: in out Tree) return Boolean is
begin
    return Self.P = null;
end Is_Empty;

    
    
    

---------------NODE DEFINITION FUNCTIONS----------------

function P_Node_To_String (N: P_Node) return String is
begin
    return "access'Image(N)";
end P_Node_To_String;

procedure Delete_P_Node (N: P_Node) is 
begin
    null; --complete
end Delete_P_Node;



end trees;