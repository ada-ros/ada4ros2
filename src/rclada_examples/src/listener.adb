with Ada.Streams; use Ada.Streams;

with RCL.Logging;
with RCL.Nodes;
with RCL.Subscriptions;

with std_msgs_msg_bool_utype_support_h; use Std_Msgs_Msg_Bool_Utype_Support_H;

procedure Listener is
   use RCL;

   Buffer : aliased Stream_Element_Array (1 .. 10240);
begin
   Logging.Info ("Node starting...");

   declare
      Node : Nodes.Node := Nodes.Init ("listener");
   begin
      Logging.Info ("Node started");

--      Logging.Info ("SUPPORT: " & System.Address_Image (Rosidl.Std_Msgs.Msg.Typesupport_String.all'Address));
      declare
         Sub  : Subscriptions.Subscription :=
                  Subscriptions.Init (Node,
                                      rosidl_typesupport_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_Bool,
                                      "chatter");

         Info : Subscriptions.Message_Info;
      begin
         Logging.Info ("Subscription started");

         while True loop
            delay 1.0;
            if Sub.Take_Raw (Buffer, Info) then
               Logging.Info ("Got chatter!");
            else
               Logging.Info (":'(");
            end if;
         end loop;
      end;
   end;

   Logging.Info ("Node shut down");
end Listener;
