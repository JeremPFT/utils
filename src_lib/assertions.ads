with AUnit.Assertions;
with GNAT.Source_Info;

package Assertions
  --  utilities for assert
is
   procedure Check_String
     (Got      : in String;
      Expected : in String;
      Source   : in String  := GNAT.Source_Info.File;
      Line     : in Natural := GNAT.Source_Info.Line);

   procedure Check_Integer
     (Got      : in Integer;
      Expected : in Integer;
      Source   : in String  := GNAT.Source_Info.File;
      Line     : in Natural := GNAT.Source_Info.Line);

   procedure Check_Boolean
     (Got      : in Boolean;
      Expected : in Boolean;
      Source   : in String  := GNAT.Source_Info.File;
      Line     : in Natural := GNAT.Source_Info.Line);

   generic
      type Accessed_Type (<>) is limited private;
   procedure Check_Null
     (Got    : access Accessed_Type;
      Source : in     String  := GNAT.Source_Info.File;
      Line   : in     Natural := GNAT.Source_Info.Line);

   procedure Check_Exception
     (Proc    : AUnit.Assertions.Throwing_Exception_Proc;
      Message : String;
      Source  : String  := GNAT.Source_Info.File;
      Line    : Natural := GNAT.Source_Info.Line)
     renames AUnit.Assertions.Assert_Exception;

   procedure Not_Implemented
     (Source : in String  := GNAT.Source_Info.File;
      Line   : in Natural := GNAT.Source_Info.Line);

end Assertions;
