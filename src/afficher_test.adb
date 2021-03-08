with Ada.Text_Io;

procedure Afficher_Test(Txt_Appel, Txt_Attendu, Txt_Obtenu : in  String) is
begin
   Ada.Text_Io.New_Line;
   Ada.Text_Io.Put_Line("-----------------------------------------------------------");
   Ada.Text_Io.Put_Line(Txt_Appel);
   Ada.Text_Io.Put_Line("Attendu : " & Txt_Attendu);
   Ada.Text_Io.Put_Line("Obtenu  : " & Txt_Obtenu);
   Ada.Text_Io.New_Line;
end Afficher_Test;