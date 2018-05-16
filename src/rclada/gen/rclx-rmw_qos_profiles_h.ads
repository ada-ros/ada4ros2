pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with rclx.rmw_types_h;

package rclx.rmw_qos_profiles_h is

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
   rmw_qos_profile_sensor_data : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/qos_profiles.h:25
   pragma Import (CPP, rmw_qos_profile_sensor_data, "_ZL27rmw_qos_profile_sensor_data");

   rmw_qos_profile_parameters : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/qos_profiles.h:34
   pragma Import (CPP, rmw_qos_profile_parameters, "_ZL26rmw_qos_profile_parameters");

   rmw_qos_profile_default : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/qos_profiles.h:43
   pragma Import (CPP, rmw_qos_profile_default, "_ZL23rmw_qos_profile_default");

   rmw_qos_profile_services_default : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/qos_profiles.h:52
   pragma Import (CPP, rmw_qos_profile_services_default, "_ZL32rmw_qos_profile_services_default");

   rmw_qos_profile_parameter_events : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/qos_profiles.h:61
   pragma Import (CPP, rmw_qos_profile_parameter_events, "_ZL32rmw_qos_profile_parameter_events");

   rmw_qos_profile_system_default : aliased rclx.rmw_types_h.rmw_qos_profile_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rmw/qos_profiles.h:70
   pragma Import (CPP, rmw_qos_profile_system_default, "_ZL30rmw_qos_profile_system_default");

end rclx.rmw_qos_profiles_h;
