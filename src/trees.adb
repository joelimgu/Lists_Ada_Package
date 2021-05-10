with Lists;


package body trees is 



function Create_Binary_Tree (Elements: Tab_Of_List_Type) return B_Tree is 
T: B_Tree := (null, 0);
begin
    --Append all the elements in the table
    for i in 1..Elements'Length loop
       T.Append (Elements(i));
    end loop;
    return T;
end Create_Binary_Tree;


procedure Append (Self: in out B_Tree; El: T_Data) is
begin
    Self.Root.all.Append(el);
end Append;


procedure Append (Self: in out B_Node; El: T_Data) is
begin
    if Self = null then
        Self.Info := new B_Node'(null, null, el);
    elsif Self.Info = El then
        null;
    elsif El < Self.Info then
        Self.Left.Append (El);
    elsif El > Self.Info then
        Self.Right.Append (El);
    end if;

    
end Append;


procedure Update (Self: in out B_Tree) is 
begin
    Self.Root.Update;
end Update;



procedure Update (Self: in out B_Node) is
begin
    null;
end Update;


function Is_Empty (Self: in out B_Tree) return Boolean is
begin 
    return Self.Root = Null;
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