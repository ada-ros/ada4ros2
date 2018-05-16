pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with rclx.rcl_allocator_h;
with rclx.rcl_types_h;
limited with rclx.rmw_types_h;

package rclx.rcl_guard_condition_h is

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
  --/ Internal rcl guard condition implementation struct.
   --  skipped empty struct rcl_guard_condition_impl_t

  --/ Handle for a rcl guard condition.
   type rcl_guard_condition_t is record
      impl : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:34
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_guard_condition_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:32

  --/ Options available for a rcl guard condition.
  --/ Custom allocator for the guard condition, used for internal allocations.
   type rcl_guard_condition_options_t is record
      allocator : aliased rclx.rcl_allocator_h.rcl_allocator_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:41
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_guard_condition_options_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:38

  --/ Return a rcl_guard_condition_t struct with members set to `NULL`.
   function rcl_get_zero_initialized_guard_condition return rcl_guard_condition_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:48
   pragma Import (C, rcl_get_zero_initialized_guard_condition, "rcl_get_zero_initialized_guard_condition");

  --/ Initialize a rcl guard_condition.
  --*
  -- * After calling this function on a rcl_guard_condition_t, it can be passed to
  -- * rcl_wait() and then concurrently it can be triggered to wake-up rcl_wait().
  -- *
  -- * Expected usage:
  -- *
  -- * ```c
  -- * #include <rcl/rcl.h>
  -- *
  -- * // ... error handling
  -- * rcl_guard_condition_t guard_condition = rcl_get_zero_initialized_guard_condition();
  -- * // ... customize guard condition options
  -- * rcl_ret_t ret = rcl_guard_condition_init(
  -- *   &guard_condition, rcl_guard_condition_get_default_options());
  -- * // ... error handling, and on shutdown do deinitialization:
  -- * ret = rcl_guard_condition_fini(&guard_condition);
  -- * // ... error handling for rcl_guard_condition_fini()
  -- * ```
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[inout] guard_condition preallocated guard_condition structure
  -- * \param[in] options the guard_condition's options
  -- * \return `RCL_RET_OK` if guard_condition was initialized successfully, or
  -- * \return `RCL_RET_ALREADY_INIT` if the guard condition is already initialized, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_guard_condition_init (guard_condition : access rcl_guard_condition_t; options : rcl_guard_condition_options_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:89
   pragma Import (C, rcl_guard_condition_init, "rcl_guard_condition_init");

  --/ Same as rcl_guard_condition_init(), but reusing an existing rmw handle.
  --*
  -- * In addition to the documentation for rcl_guard_condition_init(), the
  -- * `rmw_guard_condition` parameter must not be `NULL` and must point to a valid
  -- * rmw guard condition.
  -- *
  -- * Also the life time of the rcl guard condition is tied to the life time of
  -- * the rmw guard condition.
  -- * So if the rmw guard condition is destroyed before the rcl guard condition,
  -- * the rcl guard condition becomes invalid.
  -- *
  -- * Similarly if the resulting rcl guard condition is fini'ed before the rmw
  -- * guard condition, then the rmw guard condition is no longer valid.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[inout] guard_condition preallocated guard_condition structure
  -- * \param[in] rmw_guard_condition existing rmw guard condition to reuse
  -- * \param[in] options the guard_condition's options
  -- * \return `RCL_RET_OK` if guard_condition was initialized successfully, or
  -- * \return `RCL_RET_ALREADY_INIT` if the guard condition is already initialized, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_guard_condition_init_from_rmw
     (guard_condition : access rcl_guard_condition_t;
      rmw_guard_condition : access constant rclx.rmw_types_h.rmw_guard_condition_t;
      options : rcl_guard_condition_options_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:125
   pragma Import (C, rcl_guard_condition_init_from_rmw, "rcl_guard_condition_init_from_rmw");

  --/ Finalize a rcl_guard_condition_t.
  --*
  -- * After calling, calls to rcl_trigger_guard_condition() will fail when using
  -- * this guard condition.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No [1]
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] specifically not thread-safe with rcl_trigger_guard_condition()</i>
  -- *
  -- * \param[inout] guard_condition handle to the guard_condition to be finalized
  -- * \return `RCL_RET_OK` if guard_condition was finalized successfully, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_guard_condition_fini (guard_condition : access rcl_guard_condition_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:152
   pragma Import (C, rcl_guard_condition_fini, "rcl_guard_condition_fini");

  --/ Return the default options in a rcl_guard_condition_options_t struct.
  --*
  -- * The defaults are:
  -- *
  -- * - allocator = rcl_get_default_allocator()
  --  

   function rcl_guard_condition_get_default_options return rcl_guard_condition_options_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:163
   pragma Import (C, rcl_guard_condition_get_default_options, "rcl_guard_condition_get_default_options");

  --/ Trigger a rcl guard condition.
  --*
  -- * This function can fail, and return RCL_RET_INVALID_ARGUMENT, if the:
  -- *   - guard condition is `NULL`
  -- *   - guard condition is invalid (never called init or called fini)
  -- *
  -- * A guard condition can be triggered from any thread.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No [1]
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] it can be called concurrently with itself, even on the same guard condition</i>
  -- *
  -- * \param[in] guard_condition handle to the guard_condition to be triggered
  -- * \return `RCL_RET_OK` if the guard condition was triggered, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_trigger_guard_condition (guard_condition : access rcl_guard_condition_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:190
   pragma Import (C, rcl_trigger_guard_condition, "rcl_trigger_guard_condition");

  --/ Return the guard condition options.
  --*
  -- * Returned is a pointer to the internally held rcl_guard_condition_options_t.
  -- * This function can fail, and therefore return `NULL`, if the:
  -- *   - guard_condition is `NULL`
  -- *   - guard_condition is invalid (never called init, called fini, or invalid node)
  -- *
  -- * The returned pointer is made invalid if the guard condition is finalized.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] guard_condition pointer to the rcl guard_condition
  -- * \return rcl guard condition options if successful, otherwise `NULL`
  --  

   function rcl_guard_condition_get_options (guard_condition : access constant rcl_guard_condition_t) return access constant rcl_guard_condition_options_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:215
   pragma Import (C, rcl_guard_condition_get_options, "rcl_guard_condition_get_options");

  --/ Return the rmw guard condition handle.
  --*
  -- * The handle returned is a pointer to the internally held rmw handle.
  -- * This function can fail, and therefore return `NULL`, if the:
  -- *   - guard_condition is `NULL`
  -- *   - guard_condition is invalid (never called init, called fini, or invalid node)
  -- *
  -- * The returned handle is made invalid if the guard condition is finalized or
  -- * if rcl_shutdown() is called.
  -- * The returned handle is not guaranteed to be valid for the life time of the
  -- * guard condition as it may be finalized and recreated itself.
  -- * Therefore it is recommended to get the handle from the guard condition using
  -- * this function each time it is needed and avoid use of the handle
  -- * concurrently with functions that might change it.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] guard_condition pointer to the rcl guard_condition
  -- * \return rmw guard condition handle if successful, otherwise `NULL`
  --  

   function rcl_guard_condition_get_rmw_handle (guard_condition : access constant rcl_guard_condition_t) return access rclx.rmw_types_h.rmw_guard_condition_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/guard_condition.h:246
   pragma Import (C, rcl_guard_condition_get_rmw_handle, "rcl_guard_condition_get_rmw_handle");

end rclx.rcl_guard_condition_h;
