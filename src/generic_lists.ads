generic 
   type Element is private;
   with function Element_To_String(E:Element) return String;
   

        
package Generic_Lists is
   type Cellule;
   type P_List is access Cellule;
   type Cellule is record
      info: Element;
      suiv: P_List;
   end record;
   
   procedure Afficher_Liste(L: P_List);
   
   procedure Inserer(L: in out P_List; E:Element);
   
   generic
      with procedure Get_Element(L: out Element);
   function Create_List_By_User return P_List;
   
   generic
      with function Critere_Sous_Liste(E:Element) return Boolean;
   
   function Sous_Liste(L:P_List) return P_List;
        
   
end Generic_Lists;
