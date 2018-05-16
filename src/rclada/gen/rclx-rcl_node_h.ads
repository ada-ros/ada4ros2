pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with rclx.stddef_h;
with rclx.rcl_allocator_h;
with Interfaces.C.Extensions;
with rclx.rcl_arguments_h;
with Interfaces.C.Strings;
with rclx.rcl_types_h;
limited with rclx.rmw_types_h;
with rclx.x86_64_linux_gnu_bits_stdint_uintn_h;
limited with rclx.rcl_guard_condition_h;

package rclx.rcl_node_h is

   --  unsupported macro: RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID SIZE_MAX
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
  --/ Constant which indicates that the default domain id should be used.
   --  skipped empty struct rcl_node_impl_t

  --/ Structure which encapsulates a ROS Node.
  --/ Private implementation pointer.
   type rcl_node_t is record
      impl : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:41
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_node_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:38

  --/ Structure which encapsulates the options for creating a rcl_node_t.
  -- bool anonymous_name;
  -- rmw_qos_profile_t parameter_qos;
  --/ If true, no parameter infrastructure will be setup.
  -- bool no_parameters;
  --/ If set, then this value overrides the ROS_DOMAIN_ID environment variable.
  --*
  --   * It defaults to RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID, which will cause the
  --   * node to use the ROS domain ID set in the ROS_DOMAIN_ID environment
  --   * variable, or on some systems 0 if the environment variable is not set.
  --   *
  --   * \todo TODO(wjwwood):
  --   *   Should we put a limit on the ROS_DOMAIN_ID value, that way we can have
  --   *   a safe value for the default RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID?
  --   *   (currently max size_t)
  --    

   type rcl_node_options_t is record
      domain_id : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:65
      allocator : aliased rclx.rcl_allocator_h.rcl_allocator_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:68
      use_global_arguments : aliased Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:71
      arguments : aliased rclx.rcl_arguments_h.rcl_arguments_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:74
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_node_options_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:45

  --/ Custom allocator used for internal allocations.
  --/ If false then only use arguments in this struct, otherwise use global arguments also.
  --/ Command line arguments that apply only to this node.
  --/ Return a rcl_node_t struct with members initialized to `NULL`.
   function rcl_get_zero_initialized_node return rcl_node_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:81
   pragma Import (C, rcl_get_zero_initialized_node, "rcl_get_zero_initialized_node");

  --/ Initialize a ROS node.
  --*
  -- * Calling this on a rcl_node_t makes it a valid node handle until rcl_shutdown
  -- * is called or until rcl_node_fini is called on it.
  -- *
  -- * After calling, the ROS node object can be used to create other middleware
  -- * primitives like publishers, services, parameters, etc.
  -- *
  -- * The name of the node must not be NULL and adhere to naming restrictions,
  -- * see the rmw_validate_node_name() function for rules.
  -- *
  -- * \todo TODO(wjwwood): node name uniqueness is no yet enforced
  -- *
  -- * The name of the node cannot coincide with another node of the same name.
  -- * If a node of the same name is already in the domain, it will be shutdown.
  -- *
  -- * The namespace of the node should not be NULL and should also pass the
  -- * rmw_validate_namespace() function's rules.
  -- *
  -- * Additionally this function allows namespaces which lack a leading forward
  -- * slash.
  -- * Because there is no notion of a relative namespace, there is no difference
  -- * between a namespace which lacks a forward and the same namespace with a
  -- * leasing forward slash.
  -- * Therefore, a namespace like ``"foo/bar"`` is automatically changed to
  -- * ``"/foo/bar"`` by this function.
  -- * Similarly, the namespace ``""`` will implicitly become ``"/"`` which is a
  -- * valid namespace.
  -- *
  -- * \todo TODO(wjwwood):
  -- *   Parameter infrastructure is currently initialized in the language specific
  -- *   client library, e.g. rclcpp for C++, but will be initialized here in the
  -- *   future. When that happens there will be an option to avoid parameter
  -- *   infrastructure with an option in the rcl_node_options_t struct.
  -- *
  -- * A node contains infrastructure for ROS parameters, which include advertising
  -- * publishers and service servers.
  -- * This function will create those external parameter interfaces even if
  -- * parameters are not used later.
  -- *
  -- * The rcl_node_t given must be allocated and zero initialized.
  -- * Passing an rcl_node_t which has already had this function called on it, more
  -- * recently than rcl_node_fini, will fail.
  -- * An allocated rcl_node_t with uninitialized memory is undefined behavior.
  -- *
  -- * Expected usage:
  -- *
  -- * ```c
  -- * rcl_node_t node = rcl_get_zero_initialized_node();
  -- * rcl_node_options_t node_ops = rcl_node_get_default_options();
  -- * // ... node options customization
  -- * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/node_ns", &node_ops);
  -- * // ... error handling and then use the node, but eventually deinitialize it:
  -- * ret = rcl_node_fini(&node);
  -- * // ... error handling for rcl_node_fini()
  -- * ```
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | Yes
  -- * Lock-Free          | Yes [1]
  -- * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
  -- *
  -- * \pre the node handle must be allocated, zero initialized, and invalid
  -- * \post the node handle is valid and can be used in other `rcl_*` functions
  -- *
  -- * \param[inout] node a preallocated rcl_node_t
  -- * \param[in] name the name of the node, must be a valid c-string
  -- * \param[in] namespace_ the namespace of the node, must be a valid c-string
  -- * \param[in] options the node options.
  -- *  The options are deep copied into the node.
  -- *  The caller is always responsible for freeing memory used options they pass in.
  -- * \return `RCL_RET_OK` if the node was initialized successfully, or
  -- * \return `RCL_RET_ALREADY_INIT` if the node has already be initialized, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
  -- * \return `RCL_RET_NODE_INVALID_NAME` if the name is invalid, or
  -- * \return `RCL_RET_NODE_INVALID_NAMESPACE` if the namespace_ is invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_node_init
     (node : access rcl_node_t;
      name : Interfaces.C.Strings.chars_ptr;
      namespace_u : Interfaces.C.Strings.chars_ptr;
      options : access constant rcl_node_options_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:169
   pragma Import (C, rcl_node_init, "rcl_node_init");

  --/ Finalized a rcl_node_t.
  --*
  -- * Destroys any automatically created infrastructure and deallocates memory.
  -- * After calling, the rcl_node_t can be safely deallocated.
  -- *
  -- * Any middleware primitives created by the user, e.g. publishers, services, etc.,
  -- * are invalid after deinitialization.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | Yes
  -- * Lock-Free          | Yes [1]
  -- * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
  -- *
  -- * \param[in] node rcl_node_t to be finalized
  -- * \return `RCL_RET_OK` if node was finalized successfully, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_node_fini (node : access rcl_node_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:200
   pragma Import (C, rcl_node_fini, "rcl_node_fini");

  --/ Return the default node options in a rcl_node_options_t.
  --*
  -- * The default values are:
  -- *
  -- * - domain_id = RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID
  -- * - allocator = rcl_get_default_allocator()
  --  

   function rcl_node_get_default_options return rcl_node_options_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:211
   pragma Import (C, rcl_node_get_default_options, "rcl_node_get_default_options");

  --/ Copy one options structure into another.
  --*
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] error_alloc an alocator to use if an error occurs.
  -- *  This allocator is not used to allocate the output.
  -- * \param[in] options The structure to be copied.
  -- *  Its allocator is used to copy memory into the new structure.
  -- * \param[out] options_out An options structure containing default values.
  -- * \return `RCL_RET_OK` if the structure was copied successfully, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_node_options_copy
     (error_alloc : rclx.rcl_allocator_h.rcl_allocator_t;
      options : access constant rcl_node_options_t;
      options_out : access rcl_node_options_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:236
   pragma Import (C, rcl_node_options_copy, "rcl_node_options_copy");

  --/ Return `true` if the node is valid, else `false`.
  --*
  -- * Also return `false` if the node pointer is `NULL` or the allocator is invalid.
  -- *
  -- * The allocator needs to either be a valid allocator or `NULL`, in which case
  -- * the default allocator will be used.
  -- * The allocator is used when allocation is needed for an error message.
  -- *
  -- * A node is invalid if:
  -- *   - the implementation is `NULL` (rcl_node_init not called or failed)
  -- *   - rcl_shutdown has been called since the node has been initialized
  -- *   - the node has been finalized with rcl_node_fini
  -- *
  -- * There is a possible validity race condition.
  -- *
  -- * Consider:
  -- *
  -- * ```c
  -- * assert(rcl_node_is_valid(node, NULL));  // <-- thread 1
  -- * rcl_shutdown();                   // <-- thread 2
  -- * // use node as if valid           // <-- thread 1
  -- * ```
  -- *
  -- * In the third line the node is now invalid, even though on the previous line
  -- * of thread 1 it was checked to be valid.
  -- * This is why this function is considered not thread-safe.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | Yes
  -- * Lock-Free          | Yes [1]
  -- * <i>[1] if `atomic_is_lock_free()` returns true for `atomic_uint_least64_t`</i>
  -- *
  -- * \param[in] node rcl_node_t to be validated
  -- * \param[in] error_msg_allocator a valid allocator or `NULL`
  -- * \return `true` if the node and allocator are valid, otherwise `false`.
  --  

   function rcl_node_is_valid (node : access constant rcl_node_t; error_msg_allocator : access rclx.rcl_allocator_h.rcl_allocator_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:283
   pragma Import (C, rcl_node_is_valid, "rcl_node_is_valid");

  --/ Return the name of the node.
  --*
  -- * This function returns the node's internal name string.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node has not been initialized (the implementation is invalid)
  -- *
  -- * The returned string is only valid as long as the given rcl_node_t is valid.
  -- * The value of the string may change if the value in the rcl_node_t changes,
  -- * and therefore copying the string is recommended if this is a concern.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the node
  -- * \return name string if successful, otherwise `NULL`
  --  

   function rcl_node_get_name (node : access constant rcl_node_t) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:310
   pragma Import (C, rcl_node_get_name, "rcl_node_get_name");

  --/ Return the namespace of the node.
  --*
  -- * This function returns the node's internal namespace string.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node has not been initialized (the implementation is invalid)
  -- *
  -- * The returned string is only valid as long as the given rcl_node_t is valid.
  -- * The value of the string may change if the value in the rcl_node_t changes,
  -- * and therefore copying the string is recommended if this is a concern.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the node
  -- * \return name string if successful, otherwise `NULL`
  --  

   function rcl_node_get_namespace (node : access constant rcl_node_t) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:337
   pragma Import (C, rcl_node_get_namespace, "rcl_node_get_namespace");

  --/ Return the rcl node options.
  --*
  -- * This function returns the node's internal options struct.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node has not been initialized (the implementation is invalid)
  -- *
  -- * The returned struct is only valid as long as the given rcl_node_t is valid.
  -- * The values in the struct may change if the options of the rcl_node_t changes,
  -- * and therefore copying the struct is recommended if this is a concern.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the node
  -- * \return options struct if successful, otherwise `NULL`
  --  

   function rcl_node_get_options (node : access constant rcl_node_t) return access constant rcl_node_options_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:364
   pragma Import (C, rcl_node_get_options, "rcl_node_get_options");

  --/ Return the ROS domain ID that the node is using.
  --*
  -- * This function returns the ROS domain ID that the node is in.
  -- *
  -- * This function should be used to determine what `domain_id` was used rather
  -- * than checking the domin_id field in the node options, because if
  -- * `RCL_NODE_OPTIONS_DEFAULT_DOMAIN_ID` is used when creating the node then
  -- * it is not changed after creation, but this function will return the actual
  -- * `domain_id` used.
  -- *
  -- * The `domain_id` field must point to an allocated `size_t` object to which
  -- * the ROS domain ID will be written.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node the handle to the node being queried
  -- * \param[out] domain_id storage for the domain id
  -- * \return `RCL_RET_OK` if node the domain ID was retrieved successfully, or
  -- * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_node_get_domain_id (node : access constant rcl_node_t; domain_id : access rclx.stddef_h.size_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:397
   pragma Import (C, rcl_node_get_domain_id, "rcl_node_get_domain_id");

  --/ Return the rmw node handle.
  --*
  -- * The handle returned is a pointer to the internally held rmw handle.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node has not been initialized (the implementation is invalid)
  -- *
  -- * The returned handle is made invalid if the node is finalized or if
  -- * rcl_shutdown() is called.
  -- * The returned handle is not guaranteed to be valid for the life time of the
  -- * node as it may be finalized and recreated itself.
  -- * Therefore it is recommended to get the handle from the node using
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
  -- * \param[in] node pointer to the rcl node
  -- * \return rmw node handle if successful, otherwise `NULL`
  --  

   function rcl_node_get_rmw_handle (node : access constant rcl_node_t) return access rclx.rmw_types_h.rmw_node_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:428
   pragma Import (C, rcl_node_get_rmw_handle, "rcl_node_get_rmw_handle");

  --/ Return the associated rcl instance id.
  --*
  -- * This id is stored when rcl_node_init is called and can be compared with the
  -- * value returned by rcl_get_instance_id() to check if this node was created in
  -- * the current rcl context (since the latest call to rcl_init().
  -- *
  -- * This function can fail, and therefore return `0`, if:
  -- *   - node is `NULL`
  -- *   - node has not been initialized (the implementation is invalid)
  -- *
  -- * This function will succeed even if rcl_shutdown() has been called
  -- * since the node was created.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the rcl node
  -- * \return rcl instance id captured during node init or `0` on error
  --  

   function rcl_node_get_rcl_instance_id (node : access constant rcl_node_t) return rclx.x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:457
   pragma Import (C, rcl_node_get_rcl_instance_id, "rcl_node_get_rcl_instance_id");

  --/ Return a guard condition which is triggered when the ROS graph changes.
  --*
  -- * The handle returned is a pointer to an internally held rcl guard condition.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node is invalid
  -- *
  -- * The returned handle is made invalid if the node is finialized or if
  -- * rcl_shutdown() is called.
  -- *
  -- * The guard condition will be triggered anytime a change to the ROS graph occurs.
  -- * A ROS graph change includes things like (but not limited to) a new publisher
  -- * advertises, a new subscription is created, a new service becomes available,
  -- * a subscription is canceled, etc.
  -- *
  -- * \todo TODO(wjwwood): link to exhaustive list of graph events
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the rcl node
  -- * \return rcl guard condition handle if successful, otherwise `NULL`
  --  

   function rcl_node_get_graph_guard_condition (node : access constant rcl_node_t) return access constant rclx.rcl_guard_condition_h.rcl_guard_condition_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:490
   pragma Import (C, rcl_node_get_graph_guard_condition, "rcl_node_get_graph_guard_condition");

  --/ Return the logger name of the node.
  --*
  -- * This function returns the node's internal logger name string.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node has not been initialized (the implementation is invalid)
  -- *
  -- * The returned string is only valid as long as the given rcl_node_t is valid.
  -- * The value of the string may change if the value in the rcl_node_t changes,
  -- * and therefore copying the string is recommended if this is a concern.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the node
  -- * \return logger_name string if successful, otherwise `NULL`
  --  

   function rcl_node_get_logger_name (node : access constant rcl_node_t) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/node.h:517
   pragma Import (C, rcl_node_get_logger_name, "rcl_node_get_logger_name");

end rclx.rcl_node_h;
