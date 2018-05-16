pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.x86_64_linux_gnu_bits_stdint_intn_h;
with rclx.rcutils_types_rcutils_ret_h;

package rclx.rcutils_time_h is

   --  arg-macro: function RCUTILS_S_TO_NS (seconds)
   --    return seconds * (1000 * 1000 * 1000);
   --  arg-macro: function RCUTILS_MS_TO_NS (milliseconds)
   --    return milliseconds * (1000 * 1000);
   --  arg-macro: function RCUTILS_US_TO_NS (microseconds)
   --    return microseconds * 1000;
   --  arg-macro: function RCUTILS_NS_TO_S (nanoseconds)
   --    return nanoseconds / (1000 * 1000 * 1000);
   --  arg-macro: function RCUTILS_NS_TO_MS (nanoseconds)
   --    return nanoseconds / (1000 * 1000);
   --  arg-macro: function RCUTILS_NS_TO_US (nanoseconds)
   --    return nanoseconds / 1000;
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
  --/ Convenience macro to convert seconds to nanoseconds.
  --/ Convenience macro to convert milliseconds to nanoseconds.
  --/ Convenience macro to convert microseconds to nanoseconds.
  --/ Convenience macro to convert nanoseconds to seconds.
  --/ Convenience macro to convert nanoseconds to milliseconds.
  --/ Convenience macro to convert nanoseconds to microseconds.
  --/ A single point in time, measured in nanoseconds since the Unix epoch.
   subtype rcutils_time_point_value_t is rclx.x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/time.h:44

  --/ A duration of time, measured in nanoseconds.
   subtype rcutils_duration_value_t is rclx.x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/time.h:46

  --*
  -- * This function returns the time from a system clock.
  -- * The closest equivalent would be to std::chrono::system_clock::now();
  -- *
  -- * The resolution (e.g. nanoseconds vs microseconds) is not guaranteed.
  -- *
  -- * The now argument must point to an allocated rcutils_time_point_value_t object,
  -- * as the result is copied into this variable.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[out] now a datafield in which the current time is stored
  -- * \return `RCUTILS_RET_OK` if the current time was successfully obtained, or
  -- * \return `RCUTILS_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCUTILS_RET_ERROR` an unspecified error occur.
  --  

   function rcutils_system_time_now (now : access rcutils_time_point_value_t) return rclx.rcutils_types_rcutils_ret_h.rcutils_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/time.h:73
   pragma Import (C, rcutils_system_time_now, "rcutils_system_time_now");

  --/ Retrieve the current time as a rcutils_time_point_value_t object.
  --*
  -- * This function returns the time from a monotonically increasing clock.
  -- * The closest equivalent would be to std::chrono::steady_clock::now();
  -- *
  -- * The resolution (e.g. nanoseconds vs microseconds) is not guaranteed.
  -- *
  -- * The now argument must point to an allocated rcutils_time_point_value_t object,
  -- * as the result is copied into this variable.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[out] now a struct in which the current time is stored
  -- * \return `RCUTILS_RET_OK` if the current time was successfully obtained, or
  -- * \return `RCUTILS_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCUTILS_RET_ERROR` an unspecified error occur.
  --  

   function rcutils_steady_time_now (now : access rcutils_time_point_value_t) return rclx.rcutils_types_rcutils_ret_h.rcutils_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/time.h:101
   pragma Import (C, rcutils_steady_time_now, "rcutils_steady_time_now");

end rclx.rcutils_time_h;
