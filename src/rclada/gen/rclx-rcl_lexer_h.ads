pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with rclx.rcl_allocator_h;
with rclx.stddef_h;
with rclx.rcl_types_h;

package rclx.rcl_lexer_h is

  -- Copyright 2018 Open Source Robotics Foundation, Inc.
  -- Licensed under the Apache License, Version 2.0 (the "License");
  -- you may not use this file except in compliance with the License.
  -- You may obtain a copy of the License at
  --     http://www.apache.org/licenses/LICENSE-2.0
  -- Unless required by applicable law or agreed to in writing, software
  -- distributed under the License is distributed on an "AS IS" BASIS,
  -- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  -- See the License for the specific language governing permissions and
  -- limitations under the License.
  --/ Type of lexeme found by lexical analysis.
   type rcl_lexeme_t is 
     (RCL_LEXEME_NONE,
      RCL_LEXEME_EOF,
      RCL_LEXEME_TILDE_SLASH,
      RCL_LEXEME_URL_SERVICE,
      RCL_LEXEME_URL_TOPIC,
      RCL_LEXEME_COLON,
      RCL_LEXEME_NODE,
      RCL_LEXEME_NS,
      RCL_LEXEME_SEPARATOR,
      RCL_LEXEME_BR1,
      RCL_LEXEME_BR2,
      RCL_LEXEME_BR3,
      RCL_LEXEME_BR4,
      RCL_LEXEME_BR5,
      RCL_LEXEME_BR6,
      RCL_LEXEME_BR7,
      RCL_LEXEME_BR8,
      RCL_LEXEME_BR9,
      RCL_LEXEME_TOKEN,
      RCL_LEXEME_FORWARD_SLASH,
      RCL_LEXEME_WILD_ONE,
      RCL_LEXEME_WILD_MULTI);
   pragma Convention (C, rcl_lexeme_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer.h:31

  --/ Indicates no valid lexeme was found
  --/ Indicates end of input has been reached
  --/ ~/
  --/ rosservice://
  --/ rostopic://
  --/ :
  --/ __node
  --/ __ns
  --/ :=
  --/ \1
  --/ \2
  --/ \3
  --/ \4
  --/ \5
  --/ \6
  --/ \7
  --/ \8
  --/ \9
  --/ a name between slashes, must match (([a-zA-Z](_)?)|_)([0-9a-zA-Z](_)?)*
  --/ /
  --/ *
  --/ **
  --/ Do lexical analysis on a string.
  --*
  -- * This function analyzes a string to see if it starts with a valid lexeme.
  -- * If the string does not begin with a valid lexeme then lexeme will be RCL_LEXEME_NONE, and the
  -- * length will be set to include the character that made it impossible.
  -- * If the first character is '\0' then lexeme will be RCL_LEXEME_EOF.
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes [1]
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] Only allocates if an argument is invalid or an internal bug is detected.</i>
  -- *
  -- * \param[in] text The string to analyze.
  -- * \param[in] allocator An allocator to use if an error occurs.
  -- * \param[out] lexeme The type of lexeme found in the string.
  -- * \param[out] length The length of text in the string that constitutes the found lexeme.
  -- * \return `RCL_RET_OK` if analysis is successful regardless whether a valid lexeme is found, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
  -- * \return `RCL_RET_ERROR` if an internal bug is detected.
  --  

   function rcl_lexer_analyze
     (text : Interfaces.C.Strings.chars_ptr;
      allocator : rclx.rcl_allocator_h.rcl_allocator_t;
      lexeme : access rcl_lexeme_t;
      length : access rclx.stddef_h.size_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer.h:108
   pragma Import (C, rcl_lexer_analyze, "rcl_lexer_analyze");

end rclx.rcl_lexer_h;
