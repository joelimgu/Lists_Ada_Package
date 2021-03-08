with Ada.Text_IO;
use Ada.Text_IO;

package body Generic_Lists is

   procedure Afficher_Liste (L : in P_List) is
      Aux : P_List := L;
   begin
      Aux := L;-- on parcourt la liste
      while Aux /= null loop
         Put_Line(Element_To_String(Aux.all.Info));   -- on affiche l'element courant
         Aux := Aux.all.Suiv;
      end loop;
   end Afficher_Liste;
   
   procedure Inserer(L: in out P_List;E:Element) is
   begin
      if L = null then
         L:= new Cellule'(E,null);
      elsif L.all.suiv = null then
         L.all.suiv := new Cellule'(E,null);
      else
         Inserer(L.all.suiv,E);
      end if;  
   end Inserer;
   
   
   function Create_List_By_User return P_List is
      el: Element;
      L1: P_List;
   begin
      while not End_Of_Line loop
         Get_Element(el);
         Inserer(L1,el);
         Skip_Line;
      end loop;
      Skip_Line;
      return L1;
   end Create_List_By_User;
   
   
   
   function Sous_Liste (L: P_List) return P_List is 
      S:P_List := null;
      Aux: P_List := L;
   begin
      while Aux /= null loop
         if Critere_Sous_Liste(Aux.all.info) then
            Inserer(S,Aux.all.info);
         end if;
         
         aux := aux.all.suiv;
      end loop;
      
      return S;
         
   end Sous_Liste;
   
      
end Generic_Lists;
