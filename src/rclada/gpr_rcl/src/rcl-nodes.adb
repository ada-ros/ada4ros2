with Ada.Exceptions;

package body RCL.Nodes is

   use Rcl_Node_H;

   ----------
   -- Init --
   ----------

   function Init (Name      : String;
                  Namespace : String  := "/";
                  Opt       : Options := Default_Options) return Node
   is
      pragma Unreferenced (Opt);
      Cname : C_String := To_C (Name);
      Cns   : C_String := To_C (Namespace);

      Opts  : aliased constant Rcl_Node_Options_T :=
                Rcl_Node_Get_Default_Options;
   begin
      return N : Node do
         N.Impl := Rcl_Get_Zero_Initialized_Node;

         Check (Rcl_Node_Init (N.Impl'Access,
                Cname.To_Ptr,
                Cns.To_Ptr,
                Opts'Access));
      end return;
   end Init;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (This : in out Node) is
   begin
      if Correct (Rcl_Node_Is_Valid (This.Impl'Access, null)) then
         Check (Rcl_Node_Fini (This.Impl'Access));
      else
         null;
         --  Log attempt at finalizing finalized node
      end if;
   exception
      when E : others =>
         Put_Line ("Exception while finalizing node:");
         Put_Line (Ada.Exceptions.Exception_Information (E));
   end Finalize;

end RCL.Nodes;
