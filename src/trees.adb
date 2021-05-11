with Lists;
with Ada.Text_IO; use Ada.Text_IO;

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
    if Self.Root = null then
        Self.Root := new B_Node'(null,null,el);
    else
        Self.Root.all.Append(el);
    end if;
end Append;


procedure Append (Self: in out B_Node; El: T_Data) is
begin
    if Self.Info = El then
        null;
    elsif El < Self.Info then
        if Self.Left = null then
            Self.Left := new B_Node'(null,null, El);
        else
            Self.Left.all.Append (El);
        end if;

    elsif El > Self.Info then
        if Self.Right = null then
            Self.Right := new B_Node'(null,null, El);
        else
            Self.Right.all.Append (El);
        end if;
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


procedure Print(Self:in out B_Tree) is 
begin
    Self.Root.all.Print;
end Print;



procedure Print(Self: B_Node; Margin: in String := "") is
    begin
        if Self.Right /= null then
            Self.Right.all.Print(Margin & "--");
        end if;
        Put_Line(Margin & Data_Image(Self.Info));
        if Self.Left /= null then
            Self.Left.all.Print(Margin & "--");
        end if;
    end Print;

    function Heigh (Self: in out B_Tree) return Integer is
    begin
        return Self.Root.all.Heigh;
    end Heigh;


    function Heigh (Self: in out B_Node) return Integer is
    begin
        if Self.Left = null and Self.Right = null then
            return 0;
        elsif Self.Left = null then
           return Self.Right.all.Heigh +1;
        elsif Self.Right = null then
            return Self.Left.all.Heigh +1;
        else
            return integer'max(Self.Left.all.Heigh, Self.Right.all.Heigh) + 1;
        end if;
    end Heigh;
    
    function bf (Self: in out B_Node) return Integer is
    bf : Integer := 0; --balance factor
    begin
        if Self.Right = null and Self.Left = null then
            bf := 0;
        elsif Self.Right = null then
            bf := - Self.Left.Heigh;
        elsif  Self.Left = null then
            bf := Self.Right.Heigh;
        else
            bf := Self.Right.Heigh - Self.Left.Heigh;
        end if;

        return bf;
    end bf;

    procedure Balance (Self: in out B_Node) is 
    begin
        if Self.bf = -2 then --left heavy
            if Self.Left.bf <= 0 then
                --leftleft case
                null;
            else
                --leftRight case
                null;
            end if;
        
        elsif Self.bf = 2 then --right heavy
            if Self.Right.bf >= 0 then
                --rightright case
                null;
            else
                --rightleft case
                null;
            end if;
        end if;
    end Balance;





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