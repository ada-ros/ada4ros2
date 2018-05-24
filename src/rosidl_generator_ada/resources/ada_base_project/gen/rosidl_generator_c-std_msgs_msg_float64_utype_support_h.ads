pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c.rosidl_generator_c_message_type_support_struct_h;

package rosidl_generator_c.std_msgs_msg_float64_utype_support_h is

  -- generated from rosidl_generator_c/resource/msg__type_support.h.em
  -- generated code does not contain a copyright notice
  -- Forward declare the get type support functions for this type.
   function rosidl_typesupport_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_Float64 return access constant rosidl_generator_c.rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/float64__type_support.h:20
   pragma Import (C, rosidl_typesupport_c_u_get_message_type_support_handle_u_std_msgs_u_msg_u_Float64, "rosidl_typesupport_c__get_message_type_support_handle__std_msgs__msg__Float64");

end rosidl_generator_c.std_msgs_msg_float64_utype_support_h;
