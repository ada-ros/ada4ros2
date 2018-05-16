pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with System;
with rclx.stddef_h;
with rclx.x86_64_linux_gnu_bits_stdint_intn_h;
with rclx.x86_64_linux_gnu_bits_stdint_uintn_h;
with Interfaces.C.Extensions;

package rclx.rmw_types_h is

   RMW_RET_OK : constant := 0;  --  /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:32
   RMW_RET_ERROR : constant := 1;  --  /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:33
   RMW_RET_TIMEOUT : constant := 2;  --  /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:34

   RMW_RET_BAD_ALLOC : constant := 10;  --  /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:37

   RMW_RET_INVALID_ARGUMENT : constant := 11;  --  /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:39

   RMW_GID_STORAGE_SIZE : constant := 24;  --  /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:43

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
  -- map rcutils specific log levels to rmw speicfic type
   subtype rmw_ret_t is int;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:31

  --/ Failed to allocate memory return code.
  --/ Invalid argument return code.
  -- 24 bytes is the most memory needed to represent the GID by any current
  -- implementation. It may need to be increased in the future.
   type rmw_node_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:47
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:48
      name : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:49
      namespace_u : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:50
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_node_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:45

   type rmw_publisher_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:55
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:56
      topic_name : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:57
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_publisher_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:53

   type rmw_subscription_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:62
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:63
      topic_name : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:64
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_subscription_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:60

   type rmw_service_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:69
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:70
      service_name : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:71
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_service_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:67

   type rmw_client_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:76
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:77
      service_name : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:78
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_client_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:74

   type rmw_guard_condition_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:83
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:84
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_guard_condition_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:81

  --/ Array of subsciber handles.
  --*
  -- * An array of void * pointers representing type-erased middleware-specific subscriptions.
  -- * The number of non-null entries may be smaller than the allocated size of the array.
  -- * The number of subscriptions represented may be smaller than the allocated size of the array.
  -- * The creator of this struct is responsible for allocating and deallocating the array.
  --  

  --/ The number of subscribers represented by the array.
   type rmw_subscriptions_t is record
      subscriber_count : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:97
      subscribers : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:99
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_subscriptions_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:94

  --/ Pointer to an array of void * pointers of subscriptions.
  --/ Array of service handles.
  --*
  -- * An array of void * pointers representing type-erased middleware-specific services.
  -- * The number of non-null entries may be smaller than the allocated size of the array.
  -- * The number of services represented may be smaller than the allocated size of the array.
  -- * The creator of this struct is responsible for allocating and deallocating the array.
  --  

  --/ The number of services represented by the array.
   type rmw_services_t is record
      service_count : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:112
      services : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:114
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_services_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:109

  --/ Pointer to an array of void * pointers of services.
  --/ Array of client handles.
  --*
  -- * An array of void * pointers representing type-erased middleware-specific clients.
  -- * The number of non-null entries may be smaller than the allocated size of the array.
  -- * The number of clients represented may be smaller than the allocated size of the array.
  -- * The creator of this struct is responsible for allocating and deallocating the array.
  --  

  --/ The number of clients represented by the array.
   type rmw_clients_t is record
      client_count : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:127
      clients : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:129
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_clients_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:124

  --/ Pointer to an array of void * pointers of clients.
  --/ Array of guard condition handles.
  --*
  -- * An array of void * pointers representing type-erased middleware-specific guard conditions.
  -- * The number of non-null entries may be smaller than the allocated size of the array.
  -- * The number of guard conditions represented may be smaller than the allocated size of the array.
  -- * The creator of this struct is responsible for allocating and deallocating the array.
  --  

  --/ The number of guard conditions represented by the array.
   type rmw_guard_conditions_t is record
      guard_condition_count : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:142
      guard_conditions : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:144
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_guard_conditions_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:139

  --/ Pointer to an array of void * pointers of guard conditions.
   type rmw_wait_set_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:149
      guard_conditions : access rmw_guard_conditions_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:150
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:151
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_wait_set_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:147

   type rmw_request_id_t_writer_guid_array is array (0 .. 15) of aliased rclx.x86_64_linux_gnu_bits_stdint_intn_h.int8_t;
   type rmw_request_id_t is record
      writer_guid : aliased rmw_request_id_t_writer_guid_array;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:156
      sequence_number : aliased rclx.x86_64_linux_gnu_bits_stdint_intn_h.int64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:157
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_request_id_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:154

   type rmw_time_t is record
      sec : aliased rclx.x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:162
      nsec : aliased rclx.x86_64_linux_gnu_bits_stdint_uintn_h.uint64_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:163
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_time_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:160

   type rmw_security_enforcement_policy_t is 
     (RMW_SECURITY_ENFORCEMENT_PERMISSIVE,
      RMW_SECURITY_ENFORCEMENT_ENFORCE);
   pragma Convention (C, rmw_security_enforcement_policy_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:166

   type rmw_node_security_options_t is record
      enforce_security : aliased rmw_security_enforcement_policy_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:174
      security_root_path : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:175
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_node_security_options_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:172

   type rmw_qos_reliability_policy_t is 
     (RMW_QOS_POLICY_RELIABILITY_SYSTEM_DEFAULT,
      RMW_QOS_POLICY_RELIABILITY_RELIABLE,
      RMW_QOS_POLICY_RELIABILITY_BEST_EFFORT);
   pragma Convention (C, rmw_qos_reliability_policy_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:178

   type rmw_qos_history_policy_t is 
     (RMW_QOS_POLICY_HISTORY_SYSTEM_DEFAULT,
      RMW_QOS_POLICY_HISTORY_KEEP_LAST,
      RMW_QOS_POLICY_HISTORY_KEEP_ALL);
   pragma Convention (C, rmw_qos_history_policy_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:185

   type rmw_qos_durability_policy_t is 
     (RMW_QOS_POLICY_DURABILITY_SYSTEM_DEFAULT,
      RMW_QOS_POLICY_DURABILITY_TRANSIENT_LOCAL,
      RMW_QOS_POLICY_DURABILITY_VOLATILE);
   pragma Convention (C, rmw_qos_durability_policy_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:192

   type rmw_qos_profile_t is record
      history : aliased rmw_qos_history_policy_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:201
      depth : aliased rclx.stddef_h.size_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:202
      reliability : aliased rmw_qos_reliability_policy_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:203
      durability : aliased rmw_qos_durability_policy_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:204
      avoid_ros_namespace_conventions : aliased Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:215
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_qos_profile_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:199

  --/ If true, any ROS specific namespacing conventions will be circumvented.
  --*
  --   * In the case of DDS and topics, for example, this means the typical
  --   * ROS specific prefix of `rt` would not be applied as described here:
  --   *
  --   *   http://design.ros2.org/articles/topic_and_service_names.html#ros-specific-namespace-prefix
  --   *
  --   * This might be useful when trying to directly connect a native DDS topic
  --   * with a ROS 2 topic.
  --    

   type rmw_gid_t_data_array is array (0 .. 23) of aliased rclx.x86_64_linux_gnu_bits_stdint_uintn_h.uint8_t;
   type rmw_gid_t is record
      implementation_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:220
      data : aliased rmw_gid_t_data_array;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:221
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_gid_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:218

  -- const rmw_time_t received_timestamp;
   type rmw_message_info_t is record
      publisher_gid : aliased rmw_gid_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:227
      from_intra_process : aliased Extensions.bool;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:228
   end record;
   pragma Convention (C_Pass_By_Copy, rmw_message_info_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:224

  -- Type mapping of rcutil log severity types to
  -- rmw specific types.
   subtype RWM_PUBLIC_TYPE is unsigned;
   RMW_LOG_SEVERITY_DEBUG : constant RWM_PUBLIC_TYPE := 10;
   RMW_LOG_SEVERITY_INFO : constant RWM_PUBLIC_TYPE := 20;
   RMW_LOG_SEVERITY_WARN : constant RWM_PUBLIC_TYPE := 30;
   RMW_LOG_SEVERITY_ERROR : constant RWM_PUBLIC_TYPE := 40;
   RMW_LOG_SEVERITY_FATAL : constant RWM_PUBLIC_TYPE := 50;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:235

   subtype rmw_log_severity_t is RWM_PUBLIC_TYPE;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/types.h:242

end rclx.rmw_types_h;
