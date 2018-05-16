pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.rcutils_error_handling_h;

package rclx.rcl_error_handling_h is

   --  unsupported macro: rcl_error_state_copy rcutils_error_state_copy
   --  unsupported macro: rcl_error_state_fini rcutils_error_state_fini
   --  unsupported macro: rcl_set_error_state rcutils_set_error_state
   --  arg-macro: procedure RCL_CHECK_ARGUMENT_FOR_NULL (argument, error_return_type, allocator)
   --    RCUTILS_CHECK_ARGUMENT_FOR_NULL(argument, error_return_type, allocator)
   --  arg-macro: procedure RCL_CHECK_FOR_NULL_WITH_MSG (value, msg, error_statement, allocator)
   --    RCUTILS_CHECK_FOR_NULL_WITH_MSG(value, msg, error_statement, allocator)
   --  arg-macro: procedure RCL_SET_ERROR_MSG (msg, allocator)
   --    RCUTILS_SET_ERROR_MSG(msg, allocator)
   --  unsupported macro: RCL_SET_ERROR_MSG_WITH_FORMAT_STRING(allocator,fmt_str,...) RCUTILS_SET_ERROR_MSG_WITH_FORMAT_STRING(allocator, fmt_str, __VA_ARGS__)
   --  unsupported macro: rcl_error_is_set rcutils_error_is_set
   --  unsupported macro: rcl_get_error_state rcutils_get_error_state
   --  unsupported macro: rcl_get_error_string rcutils_get_error_string
   --  unsupported macro: rcl_get_error_string_safe rcutils_get_error_string_safe
   --  unsupported macro: rcl_reset_error rcutils_reset_error
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
  --/ The error handling in RCL is just an alias to the error handling in rcutils.
  --*
  -- * Allocators given to functions in rcl are passed along to the error handling
  -- * on a "best effort" basis.
  -- * In some situations, like when NULL is passed for the allocator or something
  -- * else that contains it, the allocator is not available to be passed to the
  -- * RCL_SET_ERROR_MSG macro.
  -- * In these cases, the default allocator rcl_get_default_allocator() is used.
  -- * Since these are considered fatal errors, as opposed to errors that might
  -- * occur during normal runtime, is should be okay to use the default allocator.
  --  

   subtype rcl_error_state_t is rclx.rcutils_error_handling_h.rcutils_error_state_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/error_handling.h:32

end rclx.rcl_error_handling_h;
