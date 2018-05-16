pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with rclx.rmw_types_h;
with rclx.stddef_h;
limited with rclx.rosidl_generator_c_message_type_support_struct_h;
with System;
with Interfaces.C.Extensions;
limited with rclx.rosidl_generator_c_service_type_support_struct_h;
with rclx.x86_64_linux_gnu_bits_stdint_intn_h;
limited with rclx.rcutils_types_string_array_h;

package rclx.rmw_rmw_h is

  -- Copyright 2014-2017 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --* \mainpage rmw: ROS Middleware Abstraction Interface
  -- *
  -- * `rmw` defines an interface of middleware primitives that are used by the higher level ROS API's.
  -- * It consists of these main components:
  -- *
  -- * - Nodes
  -- *   - rmw/rmw.h
  -- * - Publisher
  -- *   - rmw/rmw.h
  -- * - Subscription
  -- *   - rmw/rmw.h
  -- * - Service Client
  -- *   - rmw/rmw.h
  -- * - Service Server
  -- *   - rmw/rmw.h
  -- *
  -- * There are some common utility functions in combination with "Topics" or "Services":
  -- * - A function to validate a fully qualified topic or service name
  -- *   - rmw_validate_full_topic_name()
  -- *   - rmw/validate_full_topic_name.h
  -- * - A function to validate a node's namespace
  -- *   - rmw_validate_namespace()
  -- *   - rmw/validate_namespace.h
  -- * - A function to validate a node's name
  -- *   - rmw_validate_node_name()
  -- *   - rmw/validate_node_name.h
  -- *
  -- * It also has some machinery that is necessary to wait on and act on these concepts:
  -- *
  -- * - Initialization and shutdown management (global for now)
  -- *   - rmw/rmw.h
  -- * - Wait sets for waiting on messages and service requests / responses to be ready
  -- *   - rmw/rmw.h
  -- * - Guard conditions for waking up wait sets asynchronously
  -- *   - rmw/rmw.h
  -- * - Introspection of the ROS graph
  -- *   - rmw_names_and_types_t
  -- *   - rmw_get_topic_names_and_types()
  -- *   - rmw_get_service_names_and_types()
  -- *   - rmw/names_and_types.h
  -- *   - rmw/get_topic_names_and_types.h
  -- *   - rmw/get_service_names_and_types.h
  -- *
  -- * Further still there are some useful abstractions and utilities:
  -- *
  -- * - Allocator functions for various types
  -- *   - rmw/allocators.h
  -- * - Error handling functionality (C style)
  -- *   - rmw/error_handling.h
  -- * - Macros
  -- *   - rmw/macros.h
  -- * - Return code types and other utility types
  -- *   - rmw/types.h
  -- * - Sanity checks for some of the types
  -- *   - rmw/sanity_checks.h
  -- * - Macros for controlling symbol visibility on the library
  -- *   - rmw/visibility_control.h
  -- * - Utility function to demangle a type to a human readable string (C++ specific):
  -- *   - rmw/impl/cpp/demangle.hpp
  --  

   function rmw_get_implementation_identifier return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:101
   pragma Import (C, rmw_get_implementation_identifier, "rmw_get_implementation_identifier");

   function rmw_init return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:106
   pragma Import (C, rmw_init, "rmw_init");

   function rmw_create_node
     (name : Interfaces.C.Strings.chars_ptr;
      namespace_u : Interfaces.C.Strings.chars_ptr;
      domain_id : rclx.stddef_h.size_t;
      security_options : access constant rclx.rmw_types_h.rmw_node_security_options_t) return access rclx.rmw_types_h.rmw_node_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:111
   pragma Import (C, rmw_create_node, "rmw_create_node");

   function rmw_destroy_node (node : access rclx.rmw_types_h.rmw_node_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:120
   pragma Import (C, rmw_destroy_node, "rmw_destroy_node");

  --/ Return a guard condition which is triggered when the ROS graph changes.
  --*
  -- * The handle returned is a pointer to an internally held rmw guard condition.
  -- * This function can fail, and therefore return `NULL`, if:
  -- *   - node is `NULL`
  -- *   - node is invalid
  -- *
  -- * The returned handle is made invalid if the node is destroyed or if
  -- * rmw_shutdown() is called.
  -- *
  -- * The guard condition will be triggered anytime a change to the ROS graph
  -- * occurs.
  -- * A ROS graph change includes things like (but not limited to) a new publisher
  -- * advertises, a new subscription is created, a new service becomes available,
  -- * a subscription is canceled, etc.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] node pointer to the rmw node
  -- * \return rmw guard condition handle if successful, otherwise `NULL`
  -- *
  --  

   function rmw_node_get_graph_guard_condition (node : access constant rclx.rmw_types_h.rmw_node_t) return access constant rclx.rmw_types_h.rmw_guard_condition_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:153
   pragma Import (C, rmw_node_get_graph_guard_condition, "rmw_node_get_graph_guard_condition");

   function rmw_create_publisher
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      type_support : access constant rclx.rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;
      topic_name : Interfaces.C.Strings.chars_ptr;
      qos_policies : access constant rclx.rmw_types_h.rmw_qos_profile_t) return access rclx.rmw_types_h.rmw_publisher_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:158
   pragma Import (C, rmw_create_publisher, "rmw_create_publisher");

   function rmw_destroy_publisher (node : access rclx.rmw_types_h.rmw_node_t; publisher : access rclx.rmw_types_h.rmw_publisher_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:167
   pragma Import (C, rmw_destroy_publisher, "rmw_destroy_publisher");

   function rmw_publish (publisher : access constant rclx.rmw_types_h.rmw_publisher_t; ros_message : System.Address) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:172
   pragma Import (C, rmw_publish, "rmw_publish");

   function rmw_create_subscription
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      type_support : access constant rclx.rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;
      topic_name : Interfaces.C.Strings.chars_ptr;
      qos_policies : access constant rclx.rmw_types_h.rmw_qos_profile_t;
      ignore_local_publications : Extensions.bool) return access rclx.rmw_types_h.rmw_subscription_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:177
   pragma Import (C, rmw_create_subscription, "rmw_create_subscription");

   function rmw_destroy_subscription (node : access rclx.rmw_types_h.rmw_node_t; subscription : access rclx.rmw_types_h.rmw_subscription_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:187
   pragma Import (C, rmw_destroy_subscription, "rmw_destroy_subscription");

   function rmw_take
     (subscription : access constant rclx.rmw_types_h.rmw_subscription_t;
      ros_message : System.Address;
      taken : access Extensions.bool) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:192
   pragma Import (C, rmw_take, "rmw_take");

   function rmw_take_with_info
     (subscription : access constant rclx.rmw_types_h.rmw_subscription_t;
      ros_message : System.Address;
      taken : access Extensions.bool;
      message_info : access rclx.rmw_types_h.rmw_message_info_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:197
   pragma Import (C, rmw_take_with_info, "rmw_take_with_info");

   function rmw_create_client
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      type_support : access constant rclx.rosidl_generator_c_service_type_support_struct_h.rosidl_service_type_support_t;
      service_name : Interfaces.C.Strings.chars_ptr;
      qos_policies : access constant rclx.rmw_types_h.rmw_qos_profile_t) return access rclx.rmw_types_h.rmw_client_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:206
   pragma Import (C, rmw_create_client, "rmw_create_client");

   function rmw_destroy_client (node : access rclx.rmw_types_h.rmw_node_t; client : access rclx.rmw_types_h.rmw_client_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:215
   pragma Import (C, rmw_destroy_client, "rmw_destroy_client");

   function rmw_send_request
     (client : access constant rclx.rmw_types_h.rmw_client_t;
      ros_request : System.Address;
      sequence_id : access rclx.x86_64_linux_gnu_bits_stdint_intn_h.int64_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:220
   pragma Import (C, rmw_send_request, "rmw_send_request");

   function rmw_take_response
     (client : access constant rclx.rmw_types_h.rmw_client_t;
      request_header : access rclx.rmw_types_h.rmw_request_id_t;
      ros_response : System.Address;
      taken : access Extensions.bool) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:228
   pragma Import (C, rmw_take_response, "rmw_take_response");

   function rmw_create_service
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      type_support : access constant rclx.rosidl_generator_c_service_type_support_struct_h.rosidl_service_type_support_t;
      service_name : Interfaces.C.Strings.chars_ptr;
      qos_policies : access constant rclx.rmw_types_h.rmw_qos_profile_t) return access rclx.rmw_types_h.rmw_service_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:237
   pragma Import (C, rmw_create_service, "rmw_create_service");

   function rmw_destroy_service (node : access rclx.rmw_types_h.rmw_node_t; service : access rclx.rmw_types_h.rmw_service_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:246
   pragma Import (C, rmw_destroy_service, "rmw_destroy_service");

   function rmw_take_request
     (service : access constant rclx.rmw_types_h.rmw_service_t;
      request_header : access rclx.rmw_types_h.rmw_request_id_t;
      ros_request : System.Address;
      taken : access Extensions.bool) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:251
   pragma Import (C, rmw_take_request, "rmw_take_request");

   function rmw_send_response
     (service : access constant rclx.rmw_types_h.rmw_service_t;
      request_header : access rclx.rmw_types_h.rmw_request_id_t;
      ros_response : System.Address) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:260
   pragma Import (C, rmw_send_response, "rmw_send_response");

   function rmw_create_guard_condition return access rclx.rmw_types_h.rmw_guard_condition_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:268
   pragma Import (C, rmw_create_guard_condition, "rmw_create_guard_condition");

   function rmw_destroy_guard_condition (guard_condition : access rclx.rmw_types_h.rmw_guard_condition_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:273
   pragma Import (C, rmw_destroy_guard_condition, "rmw_destroy_guard_condition");

   function rmw_trigger_guard_condition (guard_condition : access constant rclx.rmw_types_h.rmw_guard_condition_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:278
   pragma Import (C, rmw_trigger_guard_condition, "rmw_trigger_guard_condition");

  --/ Create a wait set to store conditions that the middleware will block on.
  --*
  -- * If `max_conditions` is `0`, the wait set can store an unbounded number of
  -- * conditions to wait on.
  -- * If `max_conditions` is greater than `0`, the number of conditions that can
  -- * be attached to the wait set is bounded at `max_conditions`.
  -- * \param[in] max_conditions
  -- *   The maximum number of conditions that can be attached to the wait set.
  -- * \return A pointer to the created wait set, `NULL` if an error occurred.
  --  

   function rmw_create_wait_set (max_conditions : rclx.stddef_h.size_t) return access rclx.rmw_types_h.rmw_wait_set_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:293
   pragma Import (C, rmw_create_wait_set, "rmw_create_wait_set");

   function rmw_destroy_wait_set (wait_set : access rclx.rmw_types_h.rmw_wait_set_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:298
   pragma Import (C, rmw_destroy_wait_set, "rmw_destroy_wait_set");

  --/ Waits on sets of different waitable entities and returns when one is ready.
  --*
  -- * Add conditions to the wait set and wait until a response comes in, or until
  -- * the timeout is reached.
  -- * The arrays contain type-erased representations of waitable entities.
  -- * This function casts the pointers to middleware-specific conditions and adds
  -- * them to the wait set.
  -- *
  -- * The count variables in the arrays represents the number of valid pointers
  -- * in the array.
  -- * `NULL` pointers are in the array considered invalid.
  -- * If they are encountered, an error is returned.
  -- *
  -- * The array structs are allocated and deallocated outside of this function.
  -- * They do not have any information about how much memory is allocated for the
  -- * arrays.
  -- *
  -- * After the wait wakes up, the entries in each array that correspond to
  -- * conditions that were not triggered are set to `NULL`.
  -- *
  -- * \param subscriptions Array of subscriptions to wait on
  -- * \param guard_conditions Array of guard conditions to wait on
  -- * \param services Array of services to wait on
  -- * \param clients Array of clients to wait on
  -- * \param wait_set Storage for the wait set
  -- * \param wait_timeout
  -- *   If NULL, block until a condition is ready.
  -- *   If zero, check only for immediately available conditions and don't block.
  -- *   Else, this represents the maximum time to wait for a response from the
  -- *   wait set.
  -- * \return `RMW_RET_OK` if success, or
  -- * \return `RMW_RET_ERROR` if error, or
  -- * \return `RMW_RET_TIMEOUT` if wait timed out.
  --  

   function rmw_wait
     (subscriptions : access rclx.rmw_types_h.rmw_subscriptions_t;
      guard_conditions : access rclx.rmw_types_h.rmw_guard_conditions_t;
      services : access rclx.rmw_types_h.rmw_services_t;
      clients : access rclx.rmw_types_h.rmw_clients_t;
      wait_set : access rclx.rmw_types_h.rmw_wait_set_t;
      wait_timeout : access constant rclx.rmw_types_h.rmw_time_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:337
   pragma Import (C, rmw_wait, "rmw_wait");

   function rmw_get_node_names (node : access constant rclx.rmw_types_h.rmw_node_t; node_names : access rclx.rcutils_types_string_array_h.rcutils_string_array_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:348
   pragma Import (C, rmw_get_node_names, "rmw_get_node_names");

   function rmw_count_publishers
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      topic_name : Interfaces.C.Strings.chars_ptr;
      count : access rclx.stddef_h.size_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:355
   pragma Import (C, rmw_count_publishers, "rmw_count_publishers");

   function rmw_count_subscribers
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      topic_name : Interfaces.C.Strings.chars_ptr;
      count : access rclx.stddef_h.size_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:363
   pragma Import (C, rmw_count_subscribers, "rmw_count_subscribers");

   function rmw_get_gid_for_publisher (publisher : access constant rclx.rmw_types_h.rmw_publisher_t; gid : access rclx.rmw_types_h.rmw_gid_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:371
   pragma Import (C, rmw_get_gid_for_publisher, "rmw_get_gid_for_publisher");

   function rmw_compare_gids_equal
     (gid1 : access constant rclx.rmw_types_h.rmw_gid_t;
      gid2 : access constant rclx.rmw_types_h.rmw_gid_t;
      result : access Extensions.bool) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:376
   pragma Import (C, rmw_compare_gids_equal, "rmw_compare_gids_equal");

  --/ Check if a service server is available for the given service client.
  --*
  -- * This function will return true for `is_available` if there is a service
  -- * server available for the given client.
  -- *
  -- * The node parameter must not be `NULL`, and must point to a valid node.
  -- *
  -- * The client parameter must not be `NULL`, and must point to a valid client.
  -- *
  -- * The given client and node must match, i.e. the client must have been created
  -- * using the given node.
  -- *
  -- * The is_available parameter must not be `NULL`, and must point to a bool
  -- * variable.
  -- * The result of the check will be stored in the is_available parameter.
  -- *
  -- * This function does manipulate heap memory.
  -- * This function is not thread-safe.
  -- * This function is lock-free.
  -- *
  -- * \param[in] node the handle to the node being used to query the ROS graph
  -- * \param[in] client the handle to the service client being queried
  -- * \param[out] is_available
  -- *   set to true if there is a service server available, else false
  -- * \return `RMW_RET_OK` if node the check was made successfully, or
  -- * \return `RMW_RET_ERROR` if an unspecified error occurs.
  --  

   function rmw_service_server_is_available
     (node : access constant rclx.rmw_types_h.rmw_node_t;
      client : access constant rclx.rmw_types_h.rmw_client_t;
      is_available : access Extensions.bool) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:408
   pragma Import (C, rmw_service_server_is_available, "rmw_service_server_is_available");

   function rmw_set_log_severity (severity : rclx.rmw_types_h.rmw_log_severity_t) return rclx.rmw_types_h.rmw_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/rmw.h:416
   pragma Import (C, rmw_set_log_severity, "rmw_set_log_severity");

end rclx.rmw_rmw_h;
