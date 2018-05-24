pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;

package rosidl_generator_c.rosidl_generator_c_visibility_control_h is

   --  unsupported macro: ROSIDL_GENERATOR_C_EXPORT __attribute__ ((visibility("default")))
   --  unsupported macro: ROSIDL_GENERATOR_C_PUBLIC __attribute__ ((visibility("default")))
   --  unsupported macro: ROSIDL_GENERATOR_C_LOCAL __attribute__ ((visibility("hidden")))
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
  -- This logic was borrowed (then namespaced) from the examples on the gcc wiki:
  --     https://gcc.gnu.org/wiki/Visibility
end rosidl_generator_c.rosidl_generator_c_visibility_control_h;
