pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with rosidl_generator_c.stddef_h;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h;
with rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h;

package rosidl_generator_c.rosidl_generator_c_primitives_array_h is

   --  unsupported macro: ROSIDL_GENERATOR_C__PRIMITIVE_ARRAY(STRUCT_NAME,TYPE_NAME) typedef struct rosidl_generator_c__ ## STRUCT_NAME ## __Array { TYPE_NAME * data; size_t size; size_t capacity; } rosidl_generator_c__ ## STRUCT_NAME ## __Array;
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
  -- array types for all primitive types
   type rosidl_generator_c_u_bool_u_Array is record
      data : access Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:31
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:31
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:31
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_bool_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:31

   type rosidl_generator_c_u_byte_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:32
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:32
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:32
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_byte_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:32

   type rosidl_generator_c_u_char_u_Array is record
      data : access signed_char;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:33
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:33
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:33
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_char_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:33

   type rosidl_generator_c_u_float32_u_Array is record
      data : access float;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:34
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:34
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_float32_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:34

   type rosidl_generator_c_u_float64_u_Array is record
      data : access double;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:35
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:35
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_float64_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:35

   type rosidl_generator_c_u_int8_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h.int8_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:36
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:36
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_int8_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:36

   type rosidl_generator_c_u_uint8_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:37
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:37
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_uint8_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:37

   type rosidl_generator_c_u_int16_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h.int16_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:38
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:38
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:38
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_int16_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:38

   type rosidl_generator_c_u_uint16_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint16_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:39
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:39
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:39
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_uint16_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:39

   type rosidl_generator_c_u_int32_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h.int32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:40
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:40
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:40
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_int32_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:40

   type rosidl_generator_c_u_uint32_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint32_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:41
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:41
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:41
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_uint32_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:41

   type rosidl_generator_c_u_int64_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:42
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:42
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:42
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_int64_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:42

   type rosidl_generator_c_u_uint64_u_Array is record
      data : access rosidl_generator_c.x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:43
      size : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:43
      capacity : aliased rosidl_generator_c.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:43
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_generator_c_u_uint64_u_Array);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/primitives_array.h:43

end rosidl_generator_c.rosidl_generator_c_primitives_array_h;
