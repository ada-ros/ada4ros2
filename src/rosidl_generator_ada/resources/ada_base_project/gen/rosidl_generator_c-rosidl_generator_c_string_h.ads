pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.rosidl_generator_c_string_h is

  -- Copyright 2015 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ String struct
   type rosidl_generator_c_u_String is record
      data : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:25
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:27
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:29
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_String);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:23

  --/ The length of the string (excluding the null byte).
  --/ The capacity represents the number of allocated bytes (including the null byte).
   type rosidl_generator_c_u_String_u_Array is record
      data : access rosidl_generator_c_u_String;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:32
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:32
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_String_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string.h:32

end rosidl_generator_c.rosidl_generator_c_string_h;
