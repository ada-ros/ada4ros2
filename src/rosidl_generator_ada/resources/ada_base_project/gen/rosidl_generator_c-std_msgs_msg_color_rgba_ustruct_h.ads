pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.std_msgs_msg_color_rgba_ustruct_h is

  -- generated from rosidl_generator_c/resource/msg__struct.h.em
  -- generated code does not contain a copyright notice
  --/ Struct of message std_msgs/ColorRGBA
   type std_msgs_u_msg_u_ColorRGBA is record
      r : aliased float;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:19
      g : aliased float;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:20
      b : aliased float;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:21
      a : aliased float;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:22
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_ColorRGBA);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:17

  --/ Struct for an array of messages
   type std_msgs_u_msg_u_ColorRGBA_u_Array is record
      data : access std_msgs_u_msg_u_ColorRGBA;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:28
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:30
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, std_msgs_u_msg_u_ColorRGBA_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/std_msgs/msg/color_rgba__struct.h:26

  --/ The number of valid items in data
  --/ The number of allocated items in data
end rosidl_generator_c.std_msgs_msg_color_rgba_ustruct_h;
