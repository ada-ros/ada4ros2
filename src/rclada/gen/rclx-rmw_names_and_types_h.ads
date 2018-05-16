pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.rcutils_types_string_array_h;
with rclx.rmw_types_h;
with rclx.stddef_h;
limited with rclx.rcutils_allocator_h;

package rclx.rmw_names_and_types_h is

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
  --/ Associative array of topic or service names and types.
   type rmw_names_and_types_t is record
      names : aliased rclx.rcutils_types_string_array_h.rcutils_string_array_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:34
      types : access rclx.rcutils_types_string_array_h.rcutils_string_array_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_names_and_types_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:32

  -- The length of this array is the same as names.size
  --/ Return a rmw_names_and_types_t struct with members initialized to `NULL`.
   function rmw_get_zero_initialized_names_and_types return rmw_names_and_types_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:43
   pragma Import (C, rmw_get_zero_initialized_names_and_types, "rmw_get_zero_initialized_names_and_types");

  --/ Check that a rmw_topic_names_and_types_t struct is zero initialized.
   function rmw_names_and_types_check_zero (names_and_types : access rmw_names_and_types_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:49
   pragma Import (C, rmw_names_and_types_check_zero, "rmw_names_and_types_check_zero");

  --/ Initialize a rmw_names_and_types_t object.
  --*
  -- * This function initializes the string array for the names and allocates space
  -- * for all the string arrays for the types according to the given size, but
  -- * it does not initialize the string array for each setup of types.
  -- * However, the string arrays for each set of types is zero initialized.
  -- *
  -- * \param[inout] names_and_types object to be initialized
  -- * \param[in] size the number of names and sets of types to be stored
  -- * \param[in] allocator to be used to allocate and deallocate memory
  -- * \returns `RMW_RET_OK` on successfully running the check, or
  -- * \returns `RMW_RET_INVALID_ARGUMENT` if names_and_types is NULL, or
  -- * \returns `RMW_BAD_ALLOC` if memory allocation fails, or
  -- * \returns `RMW_RET_ERROR` when an unspecified error occurs.
  --  

   function rmw_names_and_types_init
     (names_and_types : access rmw_names_and_types_t;
      size : rclx.stddef_h.size_t;
      allocator : access rclx.rcutils_allocator_h.rcutils_allocator_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:69
   pragma Import (C, rmw_names_and_types_init, "rmw_names_and_types_init");

  --/ Finalize a rmw_names_and_types_t object.
  --*
  -- * The names_and_types_t objects are populated by one of the
  -- * rmw_get_*_names_and_types() functions.
  -- * During which memory is allocated to store the names and types.
  -- * This function will reclaim any resources within the object so it is safe
  -- * to destroy without leaking memory.
  -- *
  -- * The allocator within the rmw_names_and_types_t object is used to deallocate
  -- * memory.
  -- *
  -- * \param[inout] names_and_types object to be finalized
  -- * \returns `RMW_RET_OK` on successfully running the check, or
  -- * \returns `RMW_RET_INVALID_ARGUMENT` if names_and_types is NULL, or
  -- * \returns `RMW_RET_ERROR` when an unspecified error occurs.
  --  

   function rmw_names_and_types_fini (names_and_types : access rmw_names_and_types_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/names_and_types.h:93
   pragma Import (C, rmw_names_and_types_fini, "rmw_names_and_types_fini");

end rclx.rmw_names_and_types_h;
