pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.rcutils_allocator_h;
with rclx.stddef_h;
with Interfaces.C.Strings;

package rclx.rcutils_format_string_h is

   --  unsupported macro: rcutils_format_string(allocator,format_string,...) rcutils_format_string_limit(allocator, 2048, format_string, __VA_ARGS__)
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
  --/ Return a newly allocated string, created with a format string.
  --*
  -- * This function is identical to rcutils_format_string_limit() except it has an
  -- * implicit limit of 2048.
  -- * For longer format strings, see rcutils_format_string_limit().
  --  

  --/ Return a newly allocated string, created with a format string up to a limit.
  --*
  -- * This function uses snprintf_s to determine the length of the resulting
  -- * string and allocates storage for the resulting string, formats it, and
  -- * then returns the result.
  -- *
  -- * This function can fail and therefore return null if the format_string is
  -- * null or if memory allocation fails or if snprintf_s fails.
  -- * An error message is not set in any case.
  -- *
  -- * Output strings that would be longer than the given limit are truncated.
  -- *
  -- * All returned strings are null terminated.
  -- *
  -- * The format string is passed to snprintf_s(), see its documentation for
  -- * how to use the format string.
  -- *
  -- * The returned string must be deallocated using the same allocator given once
  -- * it is no longer needed.
  -- *
  -- * \see rcutils_snprintf()
  -- *
  -- * \param[in] allocator the allocator to use for allocation
  -- * \param[in] limit maximum length of the output string
  -- * \param[in] format_string format of the output, must be null terminated
  -- * \returns output string or null if there was an error
  --  

   function rcutils_format_string_limit
     (allocator : rclx.rcutils_allocator_h.rcutils_allocator_t;
      limit : rclx.stddef_h.size_t;
      format_string : Interfaces.C.Strings.chars_ptr  -- , ...
      ) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/format_string.h:68
   pragma Import (C, rcutils_format_string_limit, "rcutils_format_string_limit");

end rclx.rcutils_format_string_h;
