pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c.rosidl_generator_c_message_type_support_struct_h;

package rosidl_generator_c.builtin_interfaces_msg_time_utype_support_h is

  -- generated from rosidl_generator_c/resource/msg__type_support.h.em
  -- generated code does not contain a copyright notice
  -- Forward declare the get type support functions for this type.
   function rosidl_typesupport_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Time return access constant rosidl_generator_c.rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__type_support.h:20
   pragma Import (C, rosidl_typesupport_c_u_get_message_type_support_handle_u_builtin_interfaces_u_msg_u_Time, "rosidl_typesupport_c__get_message_type_support_handle__builtin_interfaces__msg__Time");

end rosidl_generator_c.builtin_interfaces_msg_time_utype_support_h;
