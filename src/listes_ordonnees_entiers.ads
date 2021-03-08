-- Auteurs : P. Esquirol - D. Vial - M.-J. Huguet
-- version du 24/01/2016

package Listes_Ordonnees_Entiers is

   type Une_Liste_Ordonnee_Entiers is private;

   Element_Non_Present, Element_Deja_Present : exception;

   function Est_Vide(L : in Une_Liste_Ordonnee_Entiers) return Boolean;

   function Cardinal(L : in Une_Liste_Ordonnee_Entiers) return Integer;

   function Appartient(E : in integer; L : in Une_Liste_Ordonnee_Entiers) return Boolean;

   procedure Inserer(E: in integer; L: in out Une_Liste_Ordonnee_Entiers);

   procedure Supprimer(E: in integer; L: in out Une_Liste_Ordonnee_Entiers);

   function To_String(L: in Une_Liste_Ordonnee_Entiers) return String;

   function Creer_Liste_Ordone return Une_Liste_Ordonnee_Entiers;

private
   -- types classiques permettant de realiser des listes simplement chainees
   type Cellule;
   type Lien    is access Cellule;
   type Cellule is record
        Info : integer;
        Suiv : Lien;
   end record;

   -- type liste ameliore : record contenant la liste et sa taille
   -- (evite de parcourir la liste pour calculer la taille)

   type Une_Liste_Ordonnee_Entiers is record
      Debut  : Lien    := null;
      Taille : Natural := 0;
   end record;




end Listes_Ordonnees_Entiers;
