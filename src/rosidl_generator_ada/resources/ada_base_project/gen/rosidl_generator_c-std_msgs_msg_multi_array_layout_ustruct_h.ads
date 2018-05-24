pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.std_msgs_msg_multi_array_dimension_ustruct_h;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.std_msgs_msg_multi_array_layout_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  -- include message dependencies
  -- dim
  --/ Struct of message std_msgs/MultiArrayLayout
   type std_msgs_u_msg_u_MultiArrayLayout is record
      dim : aliased rosidl_generator_c.std_msgs_msg_multi_array_dimension_ustruct_h.std_msgs_u_msg_u_MultiArrayDimension_u_Array;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:23
      data_offset : aliased rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:24
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_MultiArrayLayout);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:21

  --/ Struct for an array of messages
   type std_msgs_u_msg_u_MultiArrayLayout_u_Array is record
      data : access std_msgs_u_msg_u_MultiArrayLayout;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:30
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:32
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_MultiArrayLayout_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/multi_array_layout__struct.h:28

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.std_msgs_msg_multi_array_layout_ustruct_h;
