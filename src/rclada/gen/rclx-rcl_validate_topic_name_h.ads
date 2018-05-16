pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with rclx.stddef_h;
with rclx.rcl_types_h;

package rclx.rcl_validate_topic_name_h is

   RCL_TOPIC_NAME_VALID : constant := 0;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:27
   RCL_TOPIC_NAME_INVALID_IS_EMPTY_STRING : constant := 1;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:28
   RCL_TOPIC_NAME_INVALID_ENDS_WITH_FORWARD_SLASH : constant := 2;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:29
   RCL_TOPIC_NAME_INVALID_CONTAINS_UNALLOWED_CHARACTERS : constant := 3;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:30
   RCL_TOPIC_NAME_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER : constant := 4;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:31
   RCL_TOPIC_NAME_INVALID_UNMATCHED_CURLY_BRACE : constant := 5;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:32
   RCL_TOPIC_NAME_INVALID_MISPLACED_TILDE : constant := 6;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:33
   RCL_TOPIC_NAME_INVALID_TILDE_NOT_FOLLOWED_BY_FORWARD_SLASH : constant := 7;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:34
   RCL_TOPIC_NAME_INVALID_SUBSTITUTION_CONTAINS_UNALLOWED_CHARACTERS : constant := 8;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:35
   RCL_TOPIC_NAME_INVALID_SUBSTITUTION_STARTS_WITH_NUMBER : constant := 9;  --  /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:36

  -- Copyright 2017 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ Validate a given topic name.
  --*
  -- * The topic name does not need to be a full qualified name, but it should
  -- * follow some of the rules in this document:
  -- *
  -- *   http://design.ros2.org/articles/topic_and_service_names.html
  -- *
  -- * Note that this function expects any URL suffixes as described in the above
  -- * document to have already been removed.
  -- *
  -- * If the input topic is valid, RCL_TOPIC_NAME_VALID will be stored
  -- * into validation_result.
  -- * If the input topic violates any of the rules then one of these values will
  -- * be stored into validation_result:
  -- *
  -- * - RCL_TOPIC_NAME_INVALID_IS_EMPTY_STRING
  -- * - RCL_TOPIC_NAME_INVALID_ENDS_WITH_FORWARD_SLASH
  -- * - RCL_TOPIC_NAME_INVALID_CONTAINS_UNALLOWED_CHARACTERS
  -- * - RCL_TOPIC_NAME_INVALID_NAME_TOKEN_STARTS_WITH_NUMBER
  -- * - RCL_TOPIC_NAME_INVALID_UNMATCHED_CURLY_BRACE
  -- * - RCL_TOPIC_NAME_INVALID_MISPLACED_TILDE
  -- * - RCL_TOPIC_NAME_INVALID_TILDE_NOT_FOLLOWED_BY_FORWARD_SLASH
  -- * - RCL_TOPIC_NAME_INVALID_SUBSTITUTION_CONTAINS_UNALLOWED_CHARACTERS
  -- * - RCL_TOPIC_NAME_INVALID_SUBSTITUTION_STARTS_WITH_NUMBER
  -- *
  -- * Some checks, like the check for illegal repeated forward slashes, are not
  -- * checked in this function because they would need to be checked again after
  -- * expansion anyways.
  -- * The purpose of this subset of checks is to try to catch issues with content
  -- * that will be expanded in some way by rcl_expand_topic_name(), like `~` or
  -- * substitutions inside of `{}`, or with other issues that would obviously
  -- * prevent expansion, like RCL_TOPIC_NAME_INVALID_IS_EMPTY_STRING.
  -- *
  -- * This function does not check that the substitutions are known substitutions,
  -- * only that the contents of the `{}` follow the rules outline in the document
  -- * which was linked to above.
  -- *
  -- * Stricter validation can be done with rmw_validate_full_topic_name() after using
  -- * rcl_expand_topic_name().
  -- *
  -- * Additionally, if the invalid_index argument is not NULL, then it will be
  -- * assigned the index in the topic_name string where the violation occurs.
  -- * The invalid_index is not set if the validation passes.
  -- *
  -- * \param[in] topic_name the topic name to be validated, must be null terminated
  -- * \param[out] validation_result the reason for validation failure, if any
  -- * \param[out] invalid_index index of violation if the input topic is invalid
  -- * \return `RCL_RET_OK` if the topic name was expanded successfully, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_validate_topic_name
     (topic_name : Interfaces.C.Strings.chars_ptr;
      validation_result : access int;
      invalid_index : access rclx.stddef_h.size_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:92
   pragma Import (C, rcl_validate_topic_name, "rcl_validate_topic_name");

  --/ Validate a given topic name.
  --*
  -- * This is an overload with an extra parameter for the length of topic_name.
  -- * \param[in] topic_name_length The number of characters in topic_name.
  -- *
  -- * \sa rcl_validate_topic_name(const char *, int *, size_t *)
  --  

   function rcl_validate_topic_name_with_size
     (topic_name : Interfaces.C.Strings.chars_ptr;
      topic_name_length : rclx.stddef_h.size_t;
      validation_result : access int;
      invalid_index : access rclx.stddef_h.size_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:107
   pragma Import (C, rcl_validate_topic_name_with_size, "rcl_validate_topic_name_with_size");

  --/ Return a validation result description, or NULL if unknown or RCL_TOPIC_NAME_VALID.
   function rcl_topic_name_validation_result_string (validation_result : int) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/validate_topic_name.h:117
   pragma Import (C, rcl_topic_name_validation_result_string, "rcl_topic_name_validation_result_string");

end rclx.rcl_validate_topic_name_h;
