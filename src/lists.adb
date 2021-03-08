with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings.Unbounded.Text_IO; use Ada.Strings.Unbounded.Text_IO;
with Unchecked_Deallocation;


package body lists is
   
procedure Free is new Unchecked_Deallocation(Element,P_List);

   function Create_List(Elements: Tab_Data) return List is
      L :List := (First_Element => null);
   begin
      for i in Elements'Range loop --add every number of the array into the list
         L.Append(Elements(i));
      end loop;
      return L;
   end Create_List;

   
   procedure Append(Self: in out List; Data: T_Data) is 
      aux: P_List := Self.First_Element;
   begin
      if aux = null then --return a new list if its empty
         Self.First_Element := new Element'(info => Data,
                                        suiv => null); 
      else --go to the last element (next element = null) and add a new wlement with the new data
         while aux.all.suiv /= null loop
            aux := aux.all.suiv;
         end loop;
         
        aux.all.suiv := new Element'(info => Data,
                                     suiv => null);
      end if;
            
   end Append;
   
   
   function Length(Self:in List) return Natural is
      len: Natural := 0;
      aux: P_List := Self.First_Element;
   begin
      if aux /= null then
         len := len + 1;
         while aux.all.suiv /= null loop
            aux:= aux.all.suiv;
            len := len + 1;
         end loop; 
      end if;
      return len;
   end Length;
   

   function get(Self:in List; Index: Integer) return T_Data is
   begin
      return Self.get_pointer(Index => Index).all.info;
   end get;


   function Image(Self: in out List) return String is
      aux: P_List := Self.First_Element;
      img: Unbounded_String;
      index : Integer := 1;
   begin
      img := To_Unbounded_String("[");
      if aux /= null then
         while aux.all.suiv /= null loop
            img := img & To_Unbounded_String(Data_Image(aux.all.info) & ", ");
            aux := aux.all.suiv;
         end loop;
         img := img & To_Unbounded_String(Data_Image(aux.all.info));
      end if;
      
      img := img & "]";
      return To_String(img);
   end Image;
   

   procedure Set(Self:in out List; Index :Integer; New_Value: T_Data) is
   begin
      Self.get_pointer(Index => Index).all.info := New_Value;
   end Set;
   

   procedure Remove_Element(Self: in out List; Element: T_Data) is
   pre, aux, rec: P_List;
   begin
      if Self.First_Element = null then
         raise Element_not_in_the_list;
      elsif Self.First_Element.all.info = Element then
         rec:= Self.First_Element;
         Self.First_Element := Self.First_Element.all.suiv;
         Free(rec);
      else
         pre:= Self.First_Element;
         aux:=Self.First_Element.all.suiv;
         while aux /= null and then aux.all.info /= Element loop
            pre:= aux;
            aux:= aux.all.suiv;
         end loop;
         if aux /= null then
            rec := aux;
            pre.all.suiv:= aux.all.suiv;
            Free(rec);
         end if;
      end if;      
   end Remove_Element;
   

   procedure Remove_Index(Self: in out List; Index: Integer) is
      aux : P_List := Self.First_Element;
      rec : P_List := null;
   begin
      if aux = null or Index > Self.Length then --the list is null
         raise Get_Index_Value_Outside_the_list;
      elsif Index = 1 then --its the firs element on the list
         Delete_Object(aux.all.info);
         Self.First_Element := aux.all.suiv;
         Free(aux);
      elsif Index = Self.Length then --its the last element on the list
         aux := Self.get_pointer(Index => Index - 1);
         Delete_Object(aux.all.suiv.all.info);
         Free(aux.all.suiv);
         aux.all.suiv := null;
      else -- its one element of the list, not ht efirst not the last
         aux := Self.get_pointer(Index - 1);
         rec := aux.all.suiv;
         aux.all.suiv := rec.all.suiv;
         Delete_Object(rec.all.info);
         Free(rec);
      end if;
         
   end Remove_Index;

   
   function get_pointer(Self: in List; Index: Integer) return P_List is
   aux : P_List := Self.First_Element;
   begin
      if Index > Self.Length then
         raise Get_Index_Value_Outside_the_list;
      elsif Index < 0 then
         raise Get_Index_value_negative_not_implemented_yet;
      end if;

      for i in 2..Index loop
         aux:= aux.all.suiv;
      end loop;
      return aux;
   end get_pointer;


   function "+"(L,R : List) return List is
      --appends the second list to the first and returns the hole list
      res: List := (First_Element => null);
      aux: P_List := L.First_Element;
      
   begin
      for i in 1..L.Length loop
         res.Append(L.get(i));
      end loop;
      
      for i in 1..R.Length loop
         res.Append(R.get(i));
      end loop;
      return res;
   end "+";
   
   
   function "="(L,R: List) return Boolean is
      res: Boolean := False;
      auxL:P_List := L.First_Element;
      auxR: P_List := R.First_Element;
   begin

      if L.Length = R.Length then
         res := True;
         while res and auxL /= null loop
            res := auxL.all.info = auxR.all.info;
            auxL := auxL.all.suiv;
            auxR := auxR.all.suiv;
         end loop;
      end if;

      return res;
   end "=";


   function Index(Self: in List; Element : T_Data) return Integer is
      aux: P_List := Self.First_Element; 
      Index : Integer := 1;
   begin
      while aux /= null and then aux.all.info /= Element loop
         aux := aux.all.suiv;
         index := Index + 1;
      end loop;
      if aux = null then
         raise Element_not_in_the_list;
      end if;
      
      return Index;
   end Index;

end lists;
