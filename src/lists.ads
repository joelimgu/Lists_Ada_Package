
generic
   type T_Data is private;
   with function Data_Image(Data:T_Data) return String;
   with function "="(L,R: T_Data) return Boolean;
   with procedure Delete_Object(Object: T_Data);
package lists is
   
   Element_not_in_the_list : exception;
   Get_Index_Value_Outside_the_list : exception;
   Get_Index_value_negative_not_implemented_yet: exception;
   type List is tagged private;
   type Tab_Data is array (Integer range <>) of T_Data;
   
   function Create_List(Elements: Tab_Data) return List;
   
   procedure Append(Self:in out List; Data: T_Data);
   
   function Length(Self:in List) return Natural;
   
   function get(Self:in List; Index: Integer) return T_Data;
   
   function Index(Self: in List; Element : T_Data) return Integer;
   
   function Image(Self: in out List) return String;
   
   procedure Set(Self:in out List; Index : Integer; New_Value: T_Data);  
   
   procedure Remove_Element(Self: in out List; Element: T_Data);
   
   --removes only one instance, it should remove all the instances?????
   procedure Remove_Index(Self: in out List; Index: Integer);
   
   procedure Empty(Self: in out List );
   
   --concatenates the lists
   function "+" (L,R: List) return List;

   --tests if all the items are the same
   function "=" (L,R: List) return Boolean;
   
private

   type Element;
   type P_List is access Element;
   type Element is record
      info: T_Data;
      suiv: P_List;
   end record;
        
   type List is tagged record
      First_Element: P_List;
   end record;
   
   function get_pointer(Self: in List; Index: Integer) return P_List;
end lists;
