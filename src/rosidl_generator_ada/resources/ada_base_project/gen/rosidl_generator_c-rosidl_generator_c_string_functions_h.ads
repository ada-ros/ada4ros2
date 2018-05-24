pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c.rosidl_generator_c_string_h;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with rosidl_generator_c.stddef_h;

package rosidl_generator_c.rosidl_generator_c_string_functions_h is

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
  --/ Initialize a rosidl_generator_c__String structure.
  -- The contents of rosidl_generator_c__String are initialized to a single null character ('\0').
  -- * The string initially has size 0 and capacity 1.
  -- * Size represents the size of the contents of the string, while capacity represents the overall
  -- * storage of the string (counting the null terminator).
  -- * All strings must be null-terminated.
  --  

   function rosidl_generator_c_u_String_u_init (str : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:37
   pragma Import (C, rosidl_generator_c_u_String_u_init, "rosidl_generator_c__String__init");

   procedure rosidl_generator_c_u_String_u_fini (str : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:41
   pragma Import (C, rosidl_generator_c_u_String_u_fini, "rosidl_generator_c__String__fini");

   function rosidl_generator_c_u_String_u_assignn
     (str : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String;
      value : Interfaces.C.Strings.chars_ptr;
      n : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:45
   pragma Import (C, rosidl_generator_c_u_String_u_assignn, "rosidl_generator_c__String__assignn");

   function rosidl_generator_c_u_String_u_assign (str : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String; value : Interfaces.C.Strings.chars_ptr) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:50
   pragma Import (C, rosidl_generator_c_u_String_u_assign, "rosidl_generator_c__String__assign");

   function rosidl_generator_c_u_String_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:55
   pragma Import (C, rosidl_generator_c_u_String_u_Array_u_init, "rosidl_generator_c__String__Array__init");

   procedure rosidl_generator_c_u_String_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:60
   pragma Import (C, rosidl_generator_c_u_String_u_Array_u_fini, "rosidl_generator_c__String__Array__fini");

   function rosidl_generator_c_u_String_u_Array_u_create (size : rosidl_generator_c.stddef_h.size_t) return access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String_u_Array;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:65
   pragma Import (C, rosidl_generator_c_u_String_u_Array_u_create, "rosidl_generator_c__String__Array__create");

   procedure rosidl_generator_c_u_String_u_Array_u_destroy (c_array : access rosidl_generator_c.rosidl_generator_c_string_h.rosidl_generator_c_u_String_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/string_functions.h:69
   pragma Import (C, rosidl_generator_c_u_String_u_Array_u_destroy, "rosidl_generator_c__String__Array__destroy");

end rosidl_generator_c.rosidl_generator_c_string_functions_h;
