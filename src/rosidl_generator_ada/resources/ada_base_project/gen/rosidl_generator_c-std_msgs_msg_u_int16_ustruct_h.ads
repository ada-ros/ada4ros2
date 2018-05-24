pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.std_msgs_msg_u_int16_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  --/ Struct of message std_msgs/UInt16
   type std_msgs_u_msg_u_UInt16 is record
      data : aliased rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int16__struct.h:19
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_UInt16);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int16__struct.h:17

  --/ Struct for an array of messages
   type std_msgs_u_msg_u_UInt16_u_Array is record
      data : access std_msgs_u_msg_u_UInt16;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int16__struct.h:25
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int16__struct.h:27
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int16__struct.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_UInt16_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/u_int16__struct.h:23

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.std_msgs_msg_u_int16_ustruct_h;
