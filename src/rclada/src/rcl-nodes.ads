with Ada.Finalization;

with RCLx.Rcl_Node_H;

package RCL.Nodes is

   type Node (<>) is new Ada.Finalization.Limited_Controlled with private;
   
   type Options is null record;
   --  TBD, nothing really critical in there right now
   
   Default_Options : constant Options;
   
   function Init (Name      : String; 
                  Namespace : String  := "/";
                  Opt       : Options := Default_Options) return Node
     with Pre => Name'Length > 0 and then Namespace'Length >= 0;
   
   overriding procedure Finalize (This : in out Node);
   --  Can be called prematurely to shut down a node
   
private
   
   type Node is new Ada.Finalization.Limited_Controlled with record 
      Impl : aliased Rcl_Node_H.Rcl_Node_T;
   end record;
   
   Default_Options : constant Options := (null record);

end RCL.Nodes;
