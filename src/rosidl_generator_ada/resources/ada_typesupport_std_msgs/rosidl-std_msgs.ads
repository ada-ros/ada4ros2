with ROSIDL;

package Rosidl.Std_Msgs with Preelaborate is

   package Msg is

      function Typesupport_String return ROSIDL.Typesupport.Msg_Support_Ptr with
        Import,
        Convention => C,
        External_Name => "ada_get_typesupport__std_msgs__msg__string";

   end Msg;

end Rosidl.Std_Msgs;
