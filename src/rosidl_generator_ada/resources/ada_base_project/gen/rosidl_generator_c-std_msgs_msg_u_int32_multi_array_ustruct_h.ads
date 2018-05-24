pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.std_msgs_msg_multi_array_layout_ustruct_h;
with rosidl_generator_c.rosidl_generator_c_primitives_array_h;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.std_msgs_msg_u_int32_multi_array_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  -- include message dependencies
  -- layout
  -- data
  --/ Struct of message std_msgs/UInt32MultiArray
   type std_msgs_u_msg_u_UInt32MultiArray is record
      layout : aliased rosidl_generator_c.std_msgs_msg_multi_array_layout_ustruct_h.std_msgs_u_msg_u_MultiArrayLayout;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:25
      data : aliased rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint32_u_Array;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:26
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_UInt32MultiArray);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:23

  --/ Struct for an array of messages
   type std_msgs_u_msg_u_UInt32MultiArray_u_Array is record
      data : access std_msgs_u_msg_u_UInt32MultiArray;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:32
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:34
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_UInt32MultiArray_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int32_multi_array__struct.h:30

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.std_msgs_msg_u_int32_multi_array_ustruct_h;
