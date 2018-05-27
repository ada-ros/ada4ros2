with Ada.Finalization;

with RCL.Nodes;

with Rcl_Subscription_H; use Rcl_Subscription_H; 

with ROSIDL;

with System;

package RCL.Subscriptions is
   
   type Message_Info is record
      Intra_Process : Boolean;
   end record;  

   type Subscription (<>) is new Ada.Finalization.Limited_Controlled with private;
   
   function Init (Node     : in out Nodes.Node;
                  Msg_Type :        ROSIDL.Typesupport.Msg_Support_Ptr;
                  Topic    :        String) return Subscription;
   --  TODO: options
                     
   function Take_Raw (This   : in out Subscription;
                      Buffer :        System.Address;
                      Info   :    out Message_Info)
                      return          Boolean;
   --  Raw take, not really intended to be used by clients
   --  There's no way of knowing the necessary buffer size, nor  
   --    how many bytes were taken
   --  TRUE if a message was available.
   
   overriding procedure Finalize (This : in out Subscription);
   
private 
   
   type Subscription is new Ada.Finalization.Limited_Controlled with record
      Impl : aliased Rcl_Subscription_T := Rcl_Get_Zero_Initialized_Subscription;
   end record;

end RCL.Subscriptions;
