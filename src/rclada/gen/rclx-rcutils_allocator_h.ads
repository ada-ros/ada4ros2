pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.stddef_h;
with System;
with Interfaces.C.Extensions;

package rclx.rcutils_allocator_h is

   --  arg-macro: procedure RCUTILS_CHECK_ALLOCATOR (allocator, fail_statement)
   --    if (notrcutils_allocator_is_valid(allocator)) { fail_statement; }
   --  arg-macro: procedure RCUTILS_CHECK_ALLOCATOR_WITH_MSG (allocator, msg, fail_statement)
   --    if (notrcutils_allocator_is_valid(allocator)) { RCUTILS_SET_ERROR_MSG(msg, rcutils_get_default_allocator()) fail_statement; }
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
  --/ Encapsulation of an allocator.
  --*
  -- * The default allocator uses std::malloc(), std::free(), std::calloc(), and std::realloc().
  -- * It can be obtained using rcutils_get_default_allocator().
  -- *
  -- * The allocator should be trivially copyable.
  -- * Meaning that the struct should continue to work after being assignment
  -- * copied into a new struct.
  -- * Specifically the object pointed to by the state pointer should remain valid
  -- * until all uses of the allocator have been made.
  -- * Particular care should be taken when giving an allocator to functions like
  -- * rcutils_*_init() where it is stored within another object and used later.
  -- * Developers should note that, while the fields of a const-qualified allocator
  -- * struct cannot be modified, the state of the allocator can be modified.
  --  

  --/ Allocate memory, given a size and the `state` pointer.
  --* An error should be indicated by returning `NULL`.  
   type rcutils_allocator_t is record
      allocate : access function (arg1 : rclx.stddef_h.size_t; arg2 : System.Address) return System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:49
      deallocate : access procedure (arg1 : System.Address; arg2 : System.Address);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:52
      reallocate : access function
           (arg1 : System.Address;
            arg2 : rclx.stddef_h.size_t;
            arg3 : System.Address) return System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:64
      zero_allocate : access function
           (arg1 : rclx.stddef_h.size_t;
            arg2 : rclx.stddef_h.size_t;
            arg3 : System.Address) return System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:67
      state : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, rcutils_allocator_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:45

  --/ Deallocate previously allocated memory, mimicking std::free().
  --* Also takes the `state` pointer.  
  --/ Reallocate if possible, otherwise it deallocates and allocates.
  --*
  --   * Also takes the `state` pointer.
  --   *
  --   * If unsupported then do deallocate and then allocate.
  --   * This should behave as std::realloc() does, as opposed to posix's
  --   * [reallocf](https://linux.die.net/man/3/reallocf), i.e. the memory given
  --   * by pointer will not be free'd automatically if std::realloc() fails.
  --   * For reallocf-like behavior use rcutils_reallocf().
  --   * This function must be able to take an input pointer of `NULL` and succeed.
  --    

  --/ Allocate memory with all elements set to zero, given a number of elemets and their size.
  --* An error should be indicated by returning `NULL`.  
  --/ Implementation defined state storage.
  --*
  --   * This is passed as the final parameter to other allocator functions.
  --   * Note that the contents of the state can be modified even in const-qualified
  --   * allocator objects.
  --    

  --/ Return a zero initialized allocator.
  --*
  -- * Note that this is an invalid allocator and should only be used as a placeholder.
  --  

   function rcutils_get_zero_initialized_allocator return rcutils_allocator_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:84
   pragma Import (C, rcutils_get_zero_initialized_allocator, "rcutils_get_zero_initialized_allocator");

  --/ Return a properly initialized rcutils_allocator_t with default values.
  --*
  -- * This defaults to:
  -- *
  -- * - allocate = wraps std::malloc()
  -- * - deallocate = wraps std::free()
  -- * - reallocate = wrapps std::realloc()
  -- * - state = `NULL`
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  --  

   function rcutils_get_default_allocator return rcutils_allocator_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:106
   pragma Import (C, rcutils_get_default_allocator, "rcutils_get_default_allocator");

  --/ Return true if the given allocator has non-null function pointers.
  --*
  -- * Will also return false if the allocator pointer is null.
  --  

   function rcutils_allocator_is_valid (allocator : access constant rcutils_allocator_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:115
   pragma Import (C, rcutils_allocator_is_valid, "rcutils_allocator_is_valid");

  --/ Emulate the behavior of [reallocf](https://linux.die.net/man/3/reallocf).
  --*
  -- * This function will return `NULL` if the allocator is `NULL` or has `NULL` for
  -- * function pointer fields.
  --  

   function rcutils_reallocf
     (pointer : System.Address;
      size : rclx.stddef_h.size_t;
      allocator : access rcutils_allocator_t) return System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcutils/allocator.h:136
   pragma Import (C, rcutils_reallocf, "rcutils_reallocf");

end rclx.rcutils_allocator_h;
