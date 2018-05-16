pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with rclx.rmw_types_h;
with rclx.rcl_allocator_h;
limited with rclx.rcl_node_h;
limited with rclx.rosidl_generator_c_message_type_support_struct_h;
with Interfaces.C.Strings;
with rclx.rcl_types_h;
with Interfaces.C.Extensions;

package rclx.rcl_publisher_h is

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
  --/ Internal rcl publisher implementation struct.
   --  skipped empty struct rcl_publisher_impl_t

  --/ Structure which encapsulates a ROS Publisher.
   type rcl_publisher_t is record
      impl : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:35
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_publisher_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:33

  --/ Options available for a rcl publisher.
  --/ Middleware quality of service settings for the publisher.
   type rcl_publisher_options_t is record
      qos : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:42
      allocator : aliased rclx.rcl_allocator_h.rcl_allocator_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:45
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_publisher_options_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:39

  --/ Custom allocator for the publisher, used for incidental allocations.
  --* For default behavior (malloc/free), use: rcl_get_default_allocator()  
  --/ Return a rcl_publisher_t struct with members set to `NULL`.
  --*
  -- * Should be called to get a null rcl_publisher_t before passing to
  -- * rcl_publisher_init().
  --  

   function rcl_get_zero_initialized_publisher return rcl_publisher_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:56
   pragma Import (C, rcl_get_zero_initialized_publisher, "rcl_get_zero_initialized_publisher");

  --/ Initialize a rcl publisher.
  --*
  -- * After calling this function on a rcl_publisher_t, it can be used to publish
  -- * messages of the given type to the given topic using rcl_publish().
  -- *
  -- * The given rcl_node_t must be valid and the resulting rcl_publisher_t is only
  -- * valid as long as the given rcl_node_t remains valid.
  -- *
  -- * The rosidl_message_type_support_t is obtained on a per .msg type basis.
  -- * When the user defines a ROS message, code is generated which provides the
  -- * required rosidl_message_type_support_t object.
  -- * This object can be obtained using a language appropriate mechanism.
  -- * \todo TODO(wjwwood) write these instructions once and link to it instead
  -- * For C a macro can be used (for example `std_msgs/String`):
  -- *
  -- * ```c
  -- * #include <rosidl_generator_c/message_type_support_struct.h>
  -- * #include <std_msgs/msg/string.h>
  -- * const rosidl_message_type_support_t * string_ts =
  -- *   ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
  -- * ```
  -- *
  -- * For C++ a template function is used:
  -- *
  -- * ```cpp
  -- * #include <rosidl_typesupport_cpp/message_type_support.hpp>
  -- * #include <std_msgs/msg/string.hpp>
  -- * const rosidl_message_type_support_t * string_ts =
  -- *   rosidl_typesupport_cpp::get_message_type_support_handle<std_msgs::msg::String>();
  -- * ```
  -- *
  -- * The rosidl_message_type_support_t object contains message type specific
  -- * information used to publish messages.
  -- *
  -- * The topic name must be a c string which follows the topic and service name
  -- * format rules for unexpanded names, also known as non-fully qualified names:
  -- *
  -- * \see rcl_expand_topic_name
  -- *
  -- * The options struct allows the user to set the quality of service settings as
  -- * well as a custom allocator which is used when initializing/finalizing the
  -- * publisher to allocate space for incidentals, e.g. the topic name string.
  -- *
  -- * Expected usage (for C messages):
  -- *
  -- * ```c
  -- * #include <rcl/rcl.h>
  -- * #include <rosidl_generator_c/message_type_support_struct.h>
  -- * #include <std_msgs/msg/string.h>
  -- *
  -- * rcl_node_t node = rcl_get_zero_initialized_node();
  -- * rcl_node_options_t node_ops = rcl_node_get_default_options();
  -- * rcl_ret_t ret = rcl_node_init(&node, "node_name", "/my_namespace", &node_ops);
  -- * // ... error handling
  -- * const rosidl_message_type_support_t * ts = ROSIDL_GET_MSG_TYPE_SUPPORT(std_msgs, msg, String);
  -- * rcl_publisher_t publisher = rcl_get_zero_initialized_publisher();
  -- * rcl_publisher_options_t publisher_ops = rcl_publisher_get_default_options();
  -- * ret = rcl_publisher_init(&publisher, &node, ts, "chatter", &publisher_ops);
  -- * // ... error handling, and on shutdown do finalization:
  -- * ret = rcl_publisher_fini(&publisher, &node);
  -- * // ... error handling for rcl_publisher_fini()
  -- * ret = rcl_node_fini(&node);
  -- * // ... error handling for rcl_deinitialize_node()
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
  -- * \param[inout] publisher preallocated publisher structure
  -- * \param[in] node valid rcl node handle
  -- * \param[in] type_support type support object for the topic's type
  -- * \param[in] topic_name the name of the topic to publish on
  -- * \param[in] options publisher options, including quality of service settings
  -- * \return `RCL_RET_OK` if the publisher was initialized successfully, or
  -- * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
  -- * \return `RCL_RET_ALREADY_INIT` if the publisher is already initialized, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory fails, or
  -- * \return `RCL_RET_TOPIC_NAME_INVALID` if the given topic name is invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_publisher_init
     (publisher : access rcl_publisher_t;
      node : access constant rclx.rcl_node_h.rcl_node_t;
      type_support : access constant rclx.rosidl_generator_c_message_type_support_struct_h.rosidl_message_type_support_t;
      topic_name : Interfaces.C.Strings.chars_ptr;
      options : access constant rcl_publisher_options_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:147
   pragma Import (C, rcl_publisher_init, "rcl_publisher_init");

  --/ Finalize a rcl_publisher_t.
  --*
  -- * After calling, the node will no longer be advertising that it is publishing
  -- * on this topic (assuming this is the only publisher on this topic).
  -- *
  -- * After calling, calls to rcl_publish will fail when using this publisher.
  -- * However, the given node handle is still valid.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[inout] publisher handle to the publisher to be finalized
  -- * \param[in] node handle to the node used to create the publisher
  -- * \return `RCL_RET_OK` if publisher was finalized successfully, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_NODE_INVALID` if the node is invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_publisher_fini (publisher : access rcl_publisher_t; node : access rclx.rcl_node_h.rcl_node_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:180
   pragma Import (C, rcl_publisher_fini, "rcl_publisher_fini");

  --/ Return the default publisher options in a rcl_publisher_options_t.
  --*
  -- * The defaults are:
  -- *
  -- * - qos = rmw_qos_profile_default
  -- * - allocator = rcl_get_default_allocator()
  --  

   function rcl_publisher_get_default_options return rcl_publisher_options_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:192
   pragma Import (C, rcl_publisher_get_default_options, "rcl_publisher_get_default_options");

  --/ Publish a ROS message on a topic using a publisher.
  --*
  -- * It is the job of the caller to ensure that the type of the ros_message
  -- * parameter and the type associate with the publisher (via the type support)
  -- * match.
  -- * Passing a different type to publish produces undefined behavior and cannot
  -- * be checked by this function and therefore no deliberate error will occur.
  -- *
  -- * \todo TODO(wjwwood):
  -- *   The blocking behavior of publish is a still a point of dispute.
  -- *   This section should be updated once the behavior is clearly defined.
  -- *   See: https://github.com/ros2/ros2/issues/255
  -- *
  -- * Calling rcl_publish() is a potentially blocking call.
  -- * When called rcl_publish() will immediately do any publishing related work,
  -- * including, but not limited to, converting the message into a different type,
  -- * serializing the message, collecting publish statistics, etc.
  -- * The last thing it will do is call the underlying middleware's publish
  -- * function which may or may not block based on the quality of service settings
  -- * given via the publisher options in rcl_publisher_init().
  -- * For example, if the reliability is set to reliable, then a publish may block
  -- * until space in the publish queue is available, but if the reliability is set
  -- * to best effort then it should not block.
  -- *
  -- * The ROS message given by the `ros_message` void pointer is always owned by
  -- * the calling code, but should remain constant during publish.
  -- *
  -- * This function is thread safe so long as access to both the publisher and the
  -- * `ros_message` is synchronized.
  -- * That means that calling rcl_publish() from multiple threads is allowed, but
  -- * calling rcl_publish() at the same time as non-thread safe publisher
  -- * functions is not, e.g. calling rcl_publish() and rcl_publisher_fini()
  -- * concurrently is not allowed.
  -- * Before calling rcl_publish() the message can change and after calling
  -- * rcl_publish() the message can change, but it cannot be changed during the
  -- * publish call.
  -- * The same `ros_message`, however, can be passed to multiple calls of
  -- * rcl_publish() simultaneously, even if the publishers differ.
  -- * The `ros_message` is unmodified by rcl_publish().
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes [1]
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] for unique pairs of publishers and messages, see above for more</i>
  -- *
  -- * \param[in] publisher handle to the publisher which will do the publishing
  -- * \param[in] ros_message type-erased pointer to the ROS message
  -- * \return `RCL_RET_OK` if the message was published successfully, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_PUBLISHER_INVALID` if the publisher is invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_publish (publisher : access constant rcl_publisher_t; ros_message : System.Address) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:253
   pragma Import (C, rcl_publish, "rcl_publish");

  --/ Get the topic name for the publisher.
  --*
  -- * This function returns the publisher's internal topic name string.
  -- * This function can fail, and therefore return `NULL`, if the:
  -- *   - publisher is `NULL`
  -- *   - publisher is invalid (never called init, called fini, or invalid node)
  -- *
  -- * The returned string is only valid as long as the rcl_publisher_t is valid.
  -- * The value of the string may change if the topic name changes, and therefore
  -- * copying the string is recommended if this is a concern.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] publisher pointer to the publisher
  -- * \return name string if successful, otherwise `NULL`
  --  

   function rcl_publisher_get_topic_name (publisher : access constant rcl_publisher_t) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:280
   pragma Import (C, rcl_publisher_get_topic_name, "rcl_publisher_get_topic_name");

  --/ Return the rcl publisher options.
  --*
  -- * This function returns the publisher's internal options struct.
  -- * This function can fail, and therefore return `NULL`, if the:
  -- *   - publisher is `NULL`
  -- *   - publisher is invalid (never called init, called fini, or invalid node)
  -- *
  -- * The returned struct is only valid as long as the rcl_publisher_t is valid.
  -- * The values in the struct may change if the options of the publisher change,
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
  -- * \param[in] publisher pointer to the publisher
  -- * \return options struct if successful, otherwise `NULL`
  --  

   function rcl_publisher_get_options (publisher : access constant rcl_publisher_t) return access constant rcl_publisher_options_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:307
   pragma Import (C, rcl_publisher_get_options, "rcl_publisher_get_options");

  --/ Return the rmw publisher handle.
  --*
  -- * The handle returned is a pointer to the internally held rmw handle.
  -- * This function can fail, and therefore return `NULL`, if the:
  -- *   - publisher is `NULL`
  -- *   - publisher is invalid (never called init, called fini, or invalid node)
  -- *
  -- * The returned handle is made invalid if the publisher is finalized or if
  -- * rcl_shutdown() is called.
  -- * The returned handle is not guaranteed to be valid for the life time of the
  -- * publisher as it may be finalized and recreated itself.
  -- * Therefore it is recommended to get the handle from the publisher using
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
  -- * \param[in] publisher pointer to the rcl publisher
  -- * \return rmw publisher handle if successful, otherwise `NULL`
  --  

   function rcl_publisher_get_rmw_handle (publisher : access constant rcl_publisher_t) return access rclx.rmw_types_h.rmw_publisher_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:338
   pragma Import (C, rcl_publisher_get_rmw_handle, "rcl_publisher_get_rmw_handle");

  --/ Check that the publisher is valid
  --*
  -- * The bool returned is `false` if `publisher` is invalid.
  -- * The bool returned is `true` otherwise.
  -- * In the case where `false` is to be returned, an
  -- * error message is set.
  -- * This function cannot fail.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] publisher pointer to the rcl publisher
  -- * \param[in] error_msg_allocator a valid allocator or `NULL`
  -- * \return `true` if `publisher` is valid, otherwise `false`
  --  

   function rcl_publisher_is_valid (publisher : access constant rcl_publisher_t; error_msg_allocator : access rclx.rcl_allocator_h.rcl_allocator_t) return Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/publisher.h:362
   pragma Import (C, rcl_publisher_is_valid, "rcl_publisher_is_valid");

end rclx.rcl_publisher_h;
