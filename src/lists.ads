
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
      type Tab_Of_List_Type is array (Integer range <>) of T_Data;
      
      --takes an array and returns the same elements in a list
      function Create_List(Elements: Tab_Of_List_Type) return List;
      
      --appends an element at the end of the list
      procedure Append(Self:in out List; Data: T_Data);
      
      --returns the lenght of the list
      function Length(Self:in List) return Natural;
      
      --returns the N element of the list
      function get(Self:in List; Index: Integer) return T_Data;
      
      --returns the index where the element is
      function Index(Self: in List; Element : T_Data) return Integer;
      
      --returns the image of the list in JSON format
      function Image(Self: in out List) return String;
      
      --replaces the value of the index
      procedure Set(Self:in out List; Index : Integer; New_Value: T_Data);  
      
   --removes only the first instance of the element in the list
      procedure Remove_Element(Self: in out List; Element: T_Data);
      
      --removes the index on the list
      procedure Remove_Index(Self: in out List; Index: Integer);
      
      --deletes all the elements in teh list and frees the emmory
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
