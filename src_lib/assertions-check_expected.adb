with AUnit.Assertions;

procedure Assertions.Check_Expected
  (Got      : in With_Type;
   Expected : in With_Type;
   Source   : in String  := GNAT.Source_Info.File;
   Line     : in Natural := GNAT.Source_Info.Line)
is
   Message : constant String := "unexpected value: " &
     "expected '" & Expected'Img & "', got '" & Got'Img & "'";
   
   pragma Warnings (Off, "Assert_Result");
   
   Assert_Result : Boolean;
begin
   
   Assert_Result := AUnit.Assertions.Assert
     (Got = Expected, Message, Source, Line);
   
   pragma Warnings (On, "Assert_Result");
   
end Assertions.Check_Expected;
