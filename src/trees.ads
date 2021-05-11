with Lists;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO; 
with Unchecked_Deallocation;


generic
    type T_Data is private;
    with function Data_Image(Data:T_Data) return String;
    with function "="(L,R: T_Data) return Boolean;
    with procedure Delete_Object(Object: T_Data);
    with function "<" (L,R: T_Data) return Boolean;
    with function ">" (L,R: T_Data) return Boolean;

package trees is

type N_Tree is tagged private;
type B_Tree is tagged private;
type Tab_Of_List_Type is array (Integer range <>) of T_Data;


--function Create_N_Tree (Dim: Positive; Elements: Tab_Of_List_Type) return N_Tree;

--procedure Append (Self: in out N_Tree; El: T_Data);

--function Is_Empty (Self: in out N_Tree) return Boolean;

function Create_Binary_Tree (Elements: Tab_Of_List_Type) return B_Tree;

procedure Append (Self: in out B_Tree; El: T_Data);

function Is_Empty (Self: in out B_Tree) return Boolean;

procedure Update (Self: in out B_Tree);

procedure Print(Self:in out B_Tree);

function Heigh (Self: in out B_Tree) return Integer;







private

type Node;
type P_Node is access Node;

type B_Node;
type P_B_Node is access B_Node;
type B_Node is tagged record
    Left: P_B_Node;
    Right: P_B_Node;
    Info: T_Data;
end record;


type N_Tree is tagged record
    Root: P_Node;
    Heigh: Integer;
end record;

type B_Tree is tagged record
    Root: P_B_Node;
    Heigh: Integer;
end record;



procedure Append (Self: in out B_Node; El: T_Data);

function P_Node_To_String (N: P_Node) return String;

procedure Delete_P_Node (N: P_Node);

--function To_String (Self: B_Tree) return String;

procedure Update (Self: in out B_Node);

procedure Print(Self: B_Node; Margin: in String := "");

function Heigh (Self: in out B_Node) return Integer;

function bf (Self: in out B_Node) return Integer;





--Useless for my couse, I'll just do binary trees for now, maybie one day
package List is new Lists(P_Node,P_Node_To_String,"=",Delete_P_Node);

type Node is tagged record
    childs: List.list;
    info: T_Data;
    parent: P_Node;
end record;

end trees;