pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.rosidl_generator_c_string_h;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.std_msgs_msg_multi_array_dimension_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  -- include message dependencies
  -- label
  --/ Struct of message std_msgs/MultiArrayDimension
   type std_msgs_u_msg_u_MultiArrayDimension is record
      label : aliased rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:23
      size : aliased rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:24
      stride : aliased rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:25
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_MultiArrayDimension);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:21

  --/ Struct for an array of messages
   type std_msgs_u_msg_u_MultiArrayDimension_u_Array is record
      data : access std_msgs_u_msg_u_MultiArrayDimension;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:31
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:33
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_MultiArrayDimension_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_dimension__struct.h:29

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.std_msgs_msg_multi_array_dimension_ustruct_h;
