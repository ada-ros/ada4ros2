pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.builtin_interfaces_msg_time_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  --/ Struct of message builtin_interfaces/Time
   type builtin_interfaces_u_msg_u_Time is record
      sec : aliased rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:19
      nanosec : aliased rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:20
   end record;
   pragma Convention (C_Pass_By_Copy, builtin_interfaces_u_msg_u_Time);  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:17

  --/ Struct for an array of messages
   type builtin_interfaces_u_msg_u_Time_u_Array is record
      data : access builtin_interfaces_u_msg_u_Time;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:26
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:28
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:30
   end record;
   pragma Convention (C_Pass_By_Copy, builtin_interfaces_u_msg_u_Time_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/builtin_interfaces/msg/time__struct.h:24

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.builtin_interfaces_msg_time_ustruct_h;
