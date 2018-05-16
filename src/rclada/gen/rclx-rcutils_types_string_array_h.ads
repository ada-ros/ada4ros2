pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.stddef_h;
with System;
with rclx.rcutils_allocator_h;
with rclx.rcutils_types_rcutils_ret_h;

package rclx.rcutils_types_string_array_h is

  -- Copyright 2017 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
   type rcutils_string_array_t is record
      size : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:32
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:33
      allocator : aliased rclx.rcutils_allocator_h.rcutils_allocator_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, rcutils_string_array_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:30

  --/ Return an empty string array struct.
  --*
  -- * This function returns an empty and zero initialized string array struct.
  -- * Calling rcutils_string_array_fini() on any non-initialized instance leads
  -- * to undefined behavior.
  -- * Every instance of string_array_t has to either be zero_initialized with this
  -- * function or manually allocated.
  -- *
  -- * Example:
  -- *
  -- * ```c
  -- * rcutils_string_array_t foo;
  -- * rcutils_string_array_fini(&foo); // undefined behavior!
  -- *
  -- * rcutils_string_array_t bar = rcutils_get_zero_initialized_string_array();
  -- * rcutils_string_array_fini(&bar); // ok
  -- * ```
  --  

   function rcutils_get_zero_initialized_string_array return rcutils_string_array_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:57
   pragma Import (C, rcutils_get_zero_initialized_string_array, "rcutils_get_zero_initialized_string_array");

  --/ Initialize a string array with a given size.
  --*
  -- * This function will initialize a given, zero initialized, string array to
  -- * a given size.
  -- *
  -- * Note that putting a string into the array gives owenship to the array.
  -- *
  -- * Example:
  -- *
  -- * ```c
  -- * rcutils_allocator_t allocator = rcutils_get_default_allocator();
  -- * rcutils_string_array_t string_array = rcutils_get_zero_initialized_string_array();
  -- * rcutils_ret_t ret = rcutils_string_array_init(&string_array, 2, &allocator);
  -- * if (ret != RCUTILS_RET_OK) {
  -- *   // ... error handling
  -- * }
  -- * string_array.data[0] = rcutils_strdup("Hello", &allocator);
  -- * string_array.data[1] = rcutils_strdup("World", &allocator);
  -- * ret = rcutils_string_array_fini(&string_array);
  -- *
  -- * \param[inout] string_array object to be initialized
  -- * \param[in] size the size the array should be
  -- * \param[in] allocator to be used to allocate and deallocate memory
  -- * \return `RCUTILS_RET_OK` if successful, or
  -- * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
  -- * \return `RCUTILS_RET_BAD_ALLOC` if memory allocation fails, or
  -- * \return `RCUTILS_RET_ERROR` if an unknown error occurs
  -- * ```
  --  

   function rcutils_string_array_init
     (string_array : access rcutils_string_array_t;
      size : rclx.stddef_h.size_t;
      allocator : access constant rclx.rcutils_allocator_h.rcutils_allocator_t) return rclx.rcutils_types_rcutils_ret_h.rcutils_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:90
   pragma Import (C, rcutils_string_array_init, "rcutils_string_array_init");

  --/ Finalize a string array, reclaiming all resources.
  --*
  -- * This function reclaims any memory owned by the string array, including the
  -- * strings it references.
  -- *
  -- * The allocator used to initialize the string array is used to deallocate each
  -- * string in the array and the array of strings itself.
  -- *
  -- * \param[inout] string_array object to be finalized
  -- * \return `RCUTILS_RET_OK` if successful, or
  -- * \return `RCUTILS_RET_INVALID_ARGUMENT` for invalid arguments, or
  -- * \return `RCUTILS_RET_ERROR` if an unknown error occurs
  --  

   function rcutils_string_array_fini (string_array : access rcutils_string_array_t) return rclx.rcutils_types_rcutils_ret_h.rcutils_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/types/string_array.h:111
   pragma Import (C, rcutils_string_array_fini, "rcutils_string_array_fini");

end rclx.rcutils_types_string_array_h;
