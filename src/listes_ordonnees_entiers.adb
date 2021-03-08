with Ada.Unchecked_Deallocation;
with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body Listes_Ordonnees_Entiers is

   -------------------------------------------------------------------------
   function Est_Vide(L : in Une_Liste_Ordonnee_Entiers) return Boolean is
   begin
      return L.Debut = null;
   end Est_Vide;
   -------------------------------------------------------------------------

   -------------------------------------------------------------------------
   function Cardinal(L : in Une_Liste_Ordonnee_Entiers) return Integer is
   begin
      return L.Taille;
   end Cardinal;
   -------------------------------------------------------------------------

   -------------------------------------------------------------------------
   -- Appartient classique sur une liste simplement chainee (type Lien)

   function Appartient_Lien(E : Integer; LL : in Lien) return Boolean is
      Resultat :boolean;
   begin
      if LL = null or else E < LL.all.info then
         Resultat := False;         -- element non trouve
      elsif LL.all.Info = E then
         Resultat := True;          -- element trouve en 1ere place
      else
         Resultat := Appartient_Lien(E, LL.all.Suiv);  -- on cherche plus loin
      end if;
      return Resultat;
   end Appartient_Lien;

   -- Appartient sur le type Une_Liste_Ordonnee_Entiers
   -- On reutilise la fonction classique Appartient_Lien sur L.debut
   function Appartient(E : in integer; L : in Une_Liste_Ordonnee_Entiers) return Boolean is
   begin
      return Appartient_Lien(E, L.Debut);
   end Appartient;
   -------------------------------------------------------------------------

   -------------------------------------------------------------------------
   -- Conversion en chaine de caracteres
   --
   -- sur le type Lien

   function Lien_To_String(LL : in Lien) return String is
   begin
      if LL = null then return "";
                   else return integer'image(LL.all.info) & Lien_To_String(LL.all.suiv);
      end if;
   end Lien_To_String;

   -- sur le type Une_Liste_Ordonnee_Entiers
   function To_String(L: in Une_Liste_Ordonnee_Entiers) return String is
   begin
      return Lien_To_String(L.Debut) & " (" & Integer'Image(L.Taille) & " elements )";
   end To_String;
   -------------------------------------------------------------------------

   -------------------------------------------------------------------------
   -- Insertion ORDONNEE et SANS DOUBLON

   procedure Inserer_Lien(E: in Integer; L: in out Lien) is
   aux: Lien := L;
   begin
       if aux=null then
         L := new Cellule'(E,null);
      elsif False then
         null;
      else

         while aux.all.suiv /= null and aux.all.info < E loop
            aux := aux.all.suiv;
            if aux.all.info = E then
               raise Element_Deja_Present;
            end if;

         end loop;

         aux.all.suiv := new Cellule'(E, aux.all.suiv);

      end if;

      --
      -- A COMPLETER PAR UN ALGO D'INSERTION DANS UNE LISTE ORDONNEE
      --
      -- Ne pas oublier de lever l'exception Element_Deja_Present si E est deja dans la liste
      -- Profiter du caractere ordonne de la liste et ne pas essayer d'inserer un element E
      -- a droite d'un element qui est deja superieur a E  !

   end Inserer_Lien;

   -------------------------------------------------------------------------
   procedure Inserer(E: in integer; L: in out Une_Liste_Ordonnee_Entiers) is
   begin
      Inserer_Lien(E, L.Debut);
      L.Taille := L.Taille+1;
      Inserer_Lien(E, L.Debut);
      -- Remarque : l'exception eventuellement levee en cas de doublon
      --            par le ss-prog Inserer_Lien (Element_Deja_Present)
      --            n'etant pas traitee, cela empeche d'augmenter la taille ...
      --            Cette exception n'etant pas traitee, elle se propage au niveau
      --            appelant.
   end Inserer;


   function Creer_Liste_Ordone return Une_Liste_Ordonnee_Entiers is
      el: Integer;
      L1: Une_Liste_Ordonnee_Entiers := (null, 0);
   begin
      while not End_Of_Line loop
         Get(el);
         Inserer(el, L1);
         Skip_Line;
      end loop;
      Skip_Line;
      return L1;
   end Creer_Liste_Ordone;

   -------------------------------------------------------------------------


   -- Instanciation de Ada.Unchecked_Deallocation pour desallouer
   -- la memoire en cas de suppression des elements d'une liste
   -------------------------------------------------------------------------
   procedure Free is new Ada.Unchecked_Deallocation(Cellule, Lien);
   -------------------------------------------------------------------------
   procedure Supprimer_Lien(E : in Integer; L: in out Lien) is
      Recup : Lien;  -- Pointeur a utiliser pour reperer la cellule dont on veut
                     -- desallouer la memoire (avec Free)
   begin
      null;
      --
      -- A COMPLETER PAR UN ALGO DE SUPPRESSION DANS UNE LISTE ORDONNEE
      --
      -- Ne pas oublier de lever l'exception Element_Absent si on est sur que
      -- E n'est pas dans la liste (ex : L vide ou L commence par un element
      -- qui est superieur a E ...)
      --
   end Supprimer_Lien;
   -------------------------------------------------------------------------
   procedure Supprimer(E: in integer; L: in out Une_Liste_Ordonnee_Entiers) is
   begin
      Supprimer_Lien(E, L.debut);
      L.Taille := L.Taille - 1;
      -- Remarque : l'exception eventuellement levee par le ss-prog
      --            Supprimer_Lien (Element_Non_Present)
      --            n'etant pas traitee, cela empeche de diminuer la taille ...
      --            Cette exception n'etant pas traitee, elle se propage au niveau
      --            appelant.
   end Supprimer;

end Listes_Ordonnees_Entiers;
