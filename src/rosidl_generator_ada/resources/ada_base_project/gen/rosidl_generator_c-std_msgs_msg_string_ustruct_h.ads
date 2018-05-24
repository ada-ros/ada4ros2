pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.rosidl_generator_c_string_h;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.std_msgs_msg_string_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  -- include message dependencies
  -- data
  --/ Struct of message std_msgs/String
   type std_msgs_u_msg_u_String is record
      data : aliased rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/string__struct.h:23
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_String);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/string__struct.h:21

  --/ Struct for an array of messages
   type std_msgs_u_msg_u_String_u_Array is record
      data : access std_msgs_u_msg_u_String;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/string__struct.h:29
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/string__struct.h:31
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/string__struct.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_String_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/string__struct.h:27

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.std_msgs_msg_string_ustruct_h;
