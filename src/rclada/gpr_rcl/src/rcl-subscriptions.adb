with Ada.Unchecked_Conversion;

--  with RCL.Logging;

with Rcl_Types_H; use Rcl_Types_H;
with Rmw_Types_H; use Rmw_Types_H;
with Rosidl_Generator_C_Message_Type_Support_Struct_H; use Rosidl_Generator_C_Message_Type_Support_Struct_H;

package body RCL.Subscriptions is

   ----------
   -- Init --
   ----------

   function Init (Node     : in out Nodes.Node;
                  Msg_Type :        ROSIDL.Typesupport.Msg_Support_Ptr;
                  Topic    :        String) return Subscription
   is
      Opts : aliased constant Rcl_Subscription_Options_T :=
               Rcl_Subscription_Get_default_Options;

      type Ptr is access constant Rosidl_Message_Type_Support_T;
      function To_Ptr is new
        Ada.Unchecked_Conversion (ROSIDL.Typesupport.Msg_Support_Ptr,
                                  Ptr);
   begin
      return Sub : Subscription do
         Check (Rcl_Subscription_Init
                  (Sub.Impl'Access,
                   Node.To_C.Ptr,
                   To_Ptr (Msg_Type),
                   To_C (Topic).To_Ptr,
                   Opts'Access));
      end return;
   end Init;

   --------------
   -- Take_Raw --
   --------------

   function Take_Raw (This   : in out Subscription;
                      Buffer :        System.Address;
                      Info   :    out Message_Info)
                      return          Boolean
   is
      Impl_Info : aliased Rmw_Message_Info_T;
      Ret       : constant Rcl_Ret_T := Rcl_Take (This.Impl'Access,
                                                  Buffer,
                                                  Impl_Info'Access);
   begin
      if Ret = RMW_RET_OK then
         Info.Intra_Process := Impl_Info.From_Intra_Process /= 0;
         return True;
      elsif Ret = RCL_RET_SUBSCRIPTION_TAKE_FAILED then
         return False;
      else
         raise Program_Error with "Take_Raw:" & Ret'Img;
      end if;
   end Take_Raw;

   overriding procedure Finalize (This : in out Subscription) is null;

end RCL.Subscriptions;
