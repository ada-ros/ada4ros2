with Ada.Exceptions; use Ada.Exceptions;

package body RCL.Utils is

   ----------------
   -- Initialize --
   ----------------

   overriding procedure Initialize (This : in out Initshut) is
   begin
      if This.On_Initialize /= null then
         This.On_Initialize.all;
      end if;
   exception
      when E : others =>
         Put_Line ("Exception when initializing:");
         Put_Line (Exception_Information (E));
   end Initialize;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize   (This : in out Initshut) is
   begin
      if This.On_Finalize /= null then
         This.On_Finalize.all;
      end if;
   exception
      when E : others =>
         Put_Line ("Exception when finalizing:");
         Put_Line (Exception_Information (E));
   end Finalize;

end RCL.Utils;
