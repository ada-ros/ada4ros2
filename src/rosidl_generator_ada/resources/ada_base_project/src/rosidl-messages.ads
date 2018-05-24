package Rosidl.Messages is
   
   --  Root for ROS messages.
   --  In this same project we find the standard msgs
   
   type Message is limited interface;
   
   --  Each child package must contain:
   type Example is new Messages.Message with record
      Field1 : Integer; -- A primitive (see Types.*) or other existing message
   end record;
   
--   function To_Ada (C : Integer) return Example;
   --  C should be some actual imported C struct/type
   --  The returning should be in place to avoid copies

end Rosidl.Messages;
