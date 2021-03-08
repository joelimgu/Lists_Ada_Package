with Lists;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is
   procedure del_int(obj: Integer) is
   begin
      null;
   end del_int;

   package Integer_List is new lists(Integer,Integer'Image,"=",del_int);
   use Integer_List;


   procedure Test_List_Package(L1:in out List) is
   begin
      Put_Line("Image: " & L1.Image);
      Put_Line(Integer'Image(L1.Index(2)));
      Put_Line("Length: " & Integer'Image(L1.Length));
      Put_Line(Boolean'Image(L1 = L1));
      begin
         Put_Line("Get 3rd item: " & Integer'Image(L1.get(3)));

      exception
         when Get_Index_Value_Outside_the_list =>
            Put_Line("Index_Get_Value_Outside_the_list");
      end;
      begin
         Put_Line("Get -1rd item: " & Integer'Image(L1.get(-1)));
      exception
            when Get_Index_value_negative_not_implemented_yet =>
            Put_Line("Get_Index_value_negative_not_implemented_yet");
      end;
      L1.Append(6);
      Put_Line(L1.Image);
      begin
         L1.set(Index =>2, New_Value => 8);
      exception
            when Get_Index_Value_Outside_the_list =>
            Put_Line("Index_Get_Value_Outside_the_list");
      end;

      Put_Line("After seting the 2nd element to 8: " & L1.Image);
      L1.Remove_Element(4);
      Put_Line("After remooving element 4: " & L1.Image);
      L1 := L1 + L1;
      Put_Line("After L1=L1+L1: " & L1.Image);
      L1.Remove_Index(3);
      Put_Line("After deleting 3rd: " & L1.Image);
   end Test_List_Package;


   arr : Tab_Of_List_Type (1..5) := (1,2,3,4,5);
   arr2 : Tab_Of_List_Type (1..0);
   L1: List := Create_List(arr);
   L2: List := L1 + L1;
   Ln: List := Create_List(arr2); --null list

begin
   Test_List_Package(L1 => L1);
   Test_List_Package(L1 => Ln);
end Main;
