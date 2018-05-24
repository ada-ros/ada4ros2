pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;

package rosidl_generator_c.rosidl_generator_c_service_type_support_struct_h is

   --  arg-macro: procedure ROSIDL_GET_SRV_TYPE_SUPPORT (PkgName, SrvName)
   --    ROSIDL_TYPESUPPORT_INTERFACE__SERVICE_SYMBOL_NAME(rosidl_typesupport_c, PkgName, SrvName)()
  -- Copyright 2015-2016 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License

   type Rosidl_Service_Type_Support_T;

   type rosidl_service_typesupport_handle_function is access function (arg1 : System.Address; arg2 : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t;
   pragma Convention (C, rosidl_service_typesupport_handle_function);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:29

   type rosidl_service_type_support_t is record
      typesupport_identifier : Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:34
      data : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:35
      func : rosidl_service_typesupport_handle_function;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:36
   end record;
   pragma Convention (C_Pass_By_Copy, rosidl_service_type_support_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:32

   function get_service_typesupport_handle (handle : access constant rosidl_service_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:40
   pragma Import (C, get_service_typesupport_handle, "get_service_typesupport_handle");

   function get_service_typesupport_handle_function (handle : access constant rosidl_service_type_support_t; identifier : Interfaces.C.Strings.chars_ptr) return access constant rosidl_service_type_support_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rosidl_generator_c/service_type_support_struct.h:44
   pragma Import (C, get_service_typesupport_handle_function, "get_service_typesupport_handle_function");

end rosidl_generator_c.rosidl_generator_c_service_type_support_struct_h;
