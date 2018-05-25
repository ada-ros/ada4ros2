with Ada.Finalization;

with Rcl_Node_H; use Rcl_Node_H;

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
   
   type Reference (Ptr : access Rcl_Node_T) is null record
     with Implicit_Dereference => Ptr;
   
   function To_C (This : aliased in out Node) return Reference;
   
private
   
   type Node is new Ada.Finalization.Limited_Controlled with record 
      Impl : aliased Rcl_Node_T := Rcl_Get_Zero_Initialized_Node;
   end record;
   
   function To_C (This : aliased in out Node) return Reference is
     (Ptr => This.Impl'Access);
   
   Default_Options : constant Options := (null record);

end RCL.Nodes;
