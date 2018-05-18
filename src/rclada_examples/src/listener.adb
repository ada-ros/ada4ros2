with Ada.Text_IO; use Ada.Text_IO;

with RCL.Nodes;

procedure Listener is
begin
   Put_Line ("Node starting...");
   declare
      Node : Rcl.Nodes.Node := Rcl.Nodes.Init ("listener");
   begin
      Put_Line ("Node started");
   end;

   Put_Line ("Node shut down");
end Listener;
