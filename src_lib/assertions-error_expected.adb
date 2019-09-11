with Ada.Text_IO;

procedure Assertions.Error_Expected
  (Error      : in Exception_Occurrence;
   File       : in String;
   Subprogram : in String)
is
   package T_IO renames Ada.Text_IO;
begin
   T_IO.Put_Line ("[EXPECTED ERROR]");
   T_IO.Put (Exception_Information (Error));
   T_IO.Put_Line ("[FROM "
                    & File
                    & "::"
                    & Subprogram
                    & "]");
end Assertions.Error_Expected;
