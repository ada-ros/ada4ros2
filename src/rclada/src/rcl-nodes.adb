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
   begin
      return N : Node do
         Check (Rcl_Node_Init (N.Impl'Access,
                Cname.To_Ptr,
                Cns.To_Ptr,
                null));
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
   end Finalize;

end RCL.Nodes;
