with Ada.Text_IO; use Ada.Text_IO;

with RCL.Logging;
with RCL.Nodes;

procedure Listener is
   use RCL;
begin
   Logging.Info ("Node starting...");

   declare
      Node : Rcl.Nodes.Node := Rcl.Nodes.Init ("listener") with unreferenced;
   begin
      Put_Line ("Node started");
      delay 1.0;
   end;

   Put_Line ("Node shut down");
end Listener;
