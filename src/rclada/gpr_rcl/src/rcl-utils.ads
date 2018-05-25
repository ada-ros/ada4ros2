with Ada.Finalization;

package RCL.Utils is

   --  Assorted helpers
   
   type Parameterless is access procedure;
   
   type Initshut (On_Initialize : Parameterless;
                  On_Finalize   : Parameterless) is
     new Ada.Finalization.Limited_Controlled with null record;
   
   overriding procedure Initialize (This : in out Initshut);
   overriding procedure Finalize   (This : in out Initshut);

end RCL.Utils;
