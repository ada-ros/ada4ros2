with Interfaces.C.Strings;

with RCL.Logging;
with RCL.Nodes;
with RCL.Subscriptions;

with Std_Msgs_Msg_String_Ufunctions_H; use Std_Msgs_Msg_String_Ufunctions_H;
with Std_Msgs_Msg_String_Ustruct_H; use Std_Msgs_Msg_String_Ustruct_H;
with std_msgs_msg_string_utype_support_h; use std_msgs_msg_string_utype_support_h;

-- This example is using the automatic C low-level bindings
-- It is also not using any of the callback features, so it is not able to
--   adapt to message rates in the source.
-- It was using during development to ensure that the low level features work,
--   but should not be taken as the example to follow.

-- Of course, if you need something unavailable in the high-level binding, you
--   can use the low-level one as necessary.

procedure Listener_Raw is
   use RCL;

   Msg : constant access Std_Msgs_U_Msg_U_String := Std_Msgs_U_Msg_U_String_U_Create;
begin
   Logging.Set_Name ("listener_raw");
   Logging.Info ("Node starting...");

   declare
      Node : Nodes.Node := Nodes.Init ("listener");
   begin
      Logging.Info ("Node started");

--      Logging.Info ("SUPPORT: " & System.Address_Image (Rosidl.Std_Msgs.Msg.Typesupport_String.all'Address));
      declare
         Sub  : Subscriptions.Subscription :=
                  Subscriptions.Init (Node,
                                      rosidl_typesupport_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_String,
                                      "chatter");

         Info : Subscriptions.Message_Info;

         package CS renames Interfaces.C.Strings;
      begin
         Logging.Info ("Subscription started");

         while True loop
            delay 1.0;
            if Sub.Take_Raw (Msg.all'Address, Info) then
               Logging.Info ("Got chatter! [" & CS.Value (Msg.Data.Data) & "]");
            else
               Logging.Info (":'(");
            end if;
         end loop;
      end;
   end;

   Logging.Info ("Node shut down");
end Listener_Raw;
