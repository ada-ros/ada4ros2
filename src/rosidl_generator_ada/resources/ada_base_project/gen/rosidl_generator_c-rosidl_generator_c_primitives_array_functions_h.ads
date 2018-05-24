pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
limited with rosidl_generator_c.rosidl_generator_c_primitives_array_h;
with rosidl_generator_c.stddef_h;
with Interfaces.C.Extensions;

package rosidl_generator_c.rosidl_generator_c_primitives_array_functions_h is

   --  unsupported macro: ROSIDL_GENERATOR_C__DECLARE_PRIMITIVE_ARRAY_FUNCTIONS(STRUCT_NAME,TYPE_NAME) ROSIDL_GENERATOR_C_PUBLIC bool rosidl_generator_c__ ## STRUCT_NAME ## __Array__init( rosidl_generator_c__ ## STRUCT_NAME ## __Array * array, size_t size); ROSIDL_GENERATOR_C_PUBLIC void rosidl_generator_c__ ## STRUCT_NAME ## __Array__fini( rosidl_generator_c__ ## STRUCT_NAME ## __Array * array);
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
  -- array functions for all primitive types
   procedure rosidl_generator_c_u_bool_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_bool_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:39
   pragma Import (C, rosidl_generator_c_u_bool_u_Array_u_fini, "rosidl_generator_c__bool__Array__fini");

   function rosidl_generator_c_u_bool_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_bool_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:39
   pragma Import (C, rosidl_generator_c_u_bool_u_Array_u_init, "rosidl_generator_c__bool__Array__init");

   procedure rosidl_generator_c_u_byte_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_byte_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:40
   pragma Import (C, rosidl_generator_c_u_byte_u_Array_u_fini, "rosidl_generator_c__byte__Array__fini");

   function rosidl_generator_c_u_byte_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_byte_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:40
   pragma Import (C, rosidl_generator_c_u_byte_u_Array_u_init, "rosidl_generator_c__byte__Array__init");

   procedure rosidl_generator_c_u_char_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_char_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:41
   pragma Import (C, rosidl_generator_c_u_char_u_Array_u_fini, "rosidl_generator_c__char__Array__fini");

   function rosidl_generator_c_u_char_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_char_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:41
   pragma Import (C, rosidl_generator_c_u_char_u_Array_u_init, "rosidl_generator_c__char__Array__init");

   procedure rosidl_generator_c_u_float32_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_float32_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:42
   pragma Import (C, rosidl_generator_c_u_float32_u_Array_u_fini, "rosidl_generator_c__float32__Array__fini");

   function rosidl_generator_c_u_float32_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_float32_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:42
   pragma Import (C, rosidl_generator_c_u_float32_u_Array_u_init, "rosidl_generator_c__float32__Array__init");

   procedure rosidl_generator_c_u_float64_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_float64_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:43
   pragma Import (C, rosidl_generator_c_u_float64_u_Array_u_fini, "rosidl_generator_c__float64__Array__fini");

   function rosidl_generator_c_u_float64_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_float64_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:43
   pragma Import (C, rosidl_generator_c_u_float64_u_Array_u_init, "rosidl_generator_c__float64__Array__init");

   procedure rosidl_generator_c_u_int8_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int8_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:44
   pragma Import (C, rosidl_generator_c_u_int8_u_Array_u_fini, "rosidl_generator_c__int8__Array__fini");

   function rosidl_generator_c_u_int8_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int8_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:44
   pragma Import (C, rosidl_generator_c_u_int8_u_Array_u_init, "rosidl_generator_c__int8__Array__init");

   procedure rosidl_generator_c_u_uint8_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint8_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:45
   pragma Import (C, rosidl_generator_c_u_uint8_u_Array_u_fini, "rosidl_generator_c__uint8__Array__fini");

   function rosidl_generator_c_u_uint8_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint8_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:45
   pragma Import (C, rosidl_generator_c_u_uint8_u_Array_u_init, "rosidl_generator_c__uint8__Array__init");

   procedure rosidl_generator_c_u_int16_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int16_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:46
   pragma Import (C, rosidl_generator_c_u_int16_u_Array_u_fini, "rosidl_generator_c__int16__Array__fini");

   function rosidl_generator_c_u_int16_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int16_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:46
   pragma Import (C, rosidl_generator_c_u_int16_u_Array_u_init, "rosidl_generator_c__int16__Array__init");

   procedure rosidl_generator_c_u_uint16_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint16_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:47
   pragma Import (C, rosidl_generator_c_u_uint16_u_Array_u_fini, "rosidl_generator_c__uint16__Array__fini");

   function rosidl_generator_c_u_uint16_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint16_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:47
   pragma Import (C, rosidl_generator_c_u_uint16_u_Array_u_init, "rosidl_generator_c__uint16__Array__init");

   procedure rosidl_generator_c_u_int32_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int32_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:48
   pragma Import (C, rosidl_generator_c_u_int32_u_Array_u_fini, "rosidl_generator_c__int32__Array__fini");

   function rosidl_generator_c_u_int32_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int32_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:48
   pragma Import (C, rosidl_generator_c_u_int32_u_Array_u_init, "rosidl_generator_c__int32__Array__init");

   procedure rosidl_generator_c_u_uint32_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint32_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:49
   pragma Import (C, rosidl_generator_c_u_uint32_u_Array_u_fini, "rosidl_generator_c__uint32__Array__fini");

   function rosidl_generator_c_u_uint32_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint32_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:49
   pragma Import (C, rosidl_generator_c_u_uint32_u_Array_u_init, "rosidl_generator_c__uint32__Array__init");

   procedure rosidl_generator_c_u_int64_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int64_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:50
   pragma Import (C, rosidl_generator_c_u_int64_u_Array_u_fini, "rosidl_generator_c__int64__Array__fini");

   function rosidl_generator_c_u_int64_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_int64_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:50
   pragma Import (C, rosidl_generator_c_u_int64_u_Array_u_init, "rosidl_generator_c__int64__Array__init");

   procedure rosidl_generator_c_u_uint64_u_Array_u_fini (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint64_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:51
   pragma Import (C, rosidl_generator_c_u_uint64_u_Array_u_fini, "rosidl_generator_c__uint64__Array__fini");

   function rosidl_generator_c_u_uint64_u_Array_u_init (c_array : access rosidl_generator_c.rosidl_generator_c_primitives_array_h.rosidl_generator_c_u_uint64_u_Array; size : rosidl_generator_c.stddef_h.size_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array_functions.h:51
   pragma Import (C, rosidl_generator_c_u_uint64_u_Array_u_init, "rosidl_generator_c__uint64__Array__init");

end rosidl_generator_c.rosidl_generator_c_primitives_array_functions_h;
