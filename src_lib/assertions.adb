with Assertions.Check_Expected;

package body Assertions
is
   procedure Check_String
     (Got      : in String;
      Expected : in String;
      Source   : in String  := GNAT.Source_Info.File;
      Line     : in Natural := GNAT.Source_Info.Line)
   is
      Message : constant String := "unexpected value: " &
        "expected '" & Expected & "', got '" & Got & "'";
      
      pragma Warnings (Off, "Assert_Result");
      
      Assert_Result : Boolean;
   begin
      Assert_Result := AUnit.Assertions.Assert
        (Got = Expected, Message, Source, Line);
      
      pragma Warnings (On, "Assert_Result");
      
   end Check_String;
   
   procedure Check_Integer
     (Got      : in Integer;
      Expected : in Integer;
      Source   : in String  := GNAT.Source_Info.File;
      Line     : in Natural := GNAT.Source_Info.Line)
   is
      procedure Job is new Assertions.Check_Expected ( With_Type => Integer );
   begin
      Job (Got => Got, Expected => Expected, Source => Source, Line => Line);
   end Check_Integer;
   
   procedure Check_Boolean
     (Got      : in Boolean;
      Expected : in Boolean;
      Source   : in String  := GNAT.Source_Info.File;
      Line     : in Natural := GNAT.Source_Info.Line)
   is
      procedure Job is new Assertions.Check_Expected ( With_Type => Boolean );
   begin
      Job (Got => Got, Expected => Expected, Source => Source, Line => Line);
   end Check_Boolean;
   
   procedure Check_Null
     (Got    : access Accessed_Type;
      Source : in     String  := GNAT.Source_Info.File;
      Line   : in     Natural := GNAT.Source_Info.Line)
   is
   begin
      AUnit.Assertions.Assert (Got = null, "pointer should be null", Source => Source, Line => Line);
   end Check_Null;
   
   procedure Not_Implemented
     (Source : in String  := GNAT.Source_Info.File;
      Line   : in Natural := GNAT.Source_Info.Line)
   is
      pragma Warnings (Off, "Assert_Result");
      
      Assert_Result : Boolean;
   begin
      Assert_Result := AUnit.Assertions.Assert
        (False, "NOT IMPLEMENTED", Source, Line);
      
      pragma Warnings (On, "Assert_Result");
      
   end Not_Implemented;
   
end Assertions;
