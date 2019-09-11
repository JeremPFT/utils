generic
  type With_Type is (<>);
procedure Assertions.Check_Expected
  (Got      : in With_Type;
   Expected : in With_Type;
   Source   : in String  := GNAT.Source_Info.File;
   Line     : in Natural := GNAT.Source_Info.Line);
