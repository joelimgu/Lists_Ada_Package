with Listes_Ordonnees_Entiers;         use Listes_Ordonnees_Entiers;
with Ada.Text_Io;                      use Ada.Text_Io;
with Afficher_Test;

procedure Mon_Application is
   L1, L2 : Une_Liste_Ordonnee_Entiers;
begin
   Put_Line("-----------------------------------------------------------");
   Put_Line("Etape 1 : Insertion d'elements dans L1");
   Inserer(3, L1);
   Inserer(5, L1);
   Inserer(4, L1);
   Inserer(2, L1);
   Put_Line("Contenu de L1 : " & To_String(L1));

   Put_Line("-----------------------------------------------------------");
   Put_Line("Etape 2 - Affectation de L1 a L2");

   L2 := L1;
   Put_Line("Contenu de L2 : " & To_String(L2));

   Put_Line("-----------------------------------------------------------");
   Put_Line("Etape 3 - Ajout de 1 a L1 et de 1 a L2");
   Inserer(1, L1);
   Inserer(1, L2);
   Put_Line("Contenu de L1 : " & To_String(L1));
   Put_Line("Contenu de L2 : " & To_String(L2));

   -- Les deux listes sont-elle egales ?
   Afficher_Test("L1 = L2 ?", "TRUE", Boolean'Image(L1=L2));

   Put_Line("-----------------------------------------------------------");
   Put_Line("Etape 4 - Ajout de 2 elements 0 et 6 a L1 mais pas a L2");
   Inserer(0, L1);
   Inserer(6, L1);
   Put_Line("Contenu de L1 : " & To_String(L1));
   Put_Line("Contenu de L2 : " & To_String(L2));

end Mon_Application;