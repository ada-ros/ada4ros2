pragma Ada_2005;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with System;
with Interfaces.C.Strings;
with rclx.rcl_allocator_h;
with rclx.rcl_types_h;
with rclx.rcl_lexer_h;
with rclx.stddef_h;

package rclx.rcl_lexer_lookahead_h is

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
  -- Forward declaration
   --  skipped empty struct rcl_lexer_lookahead2_impl_t

  --/ Track lexical analysis and allow looking ahead 2 lexemes.
   type rcl_lexer_lookahead2_t is record
      impl : System.Address;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:37
   end record;
   pragma Convention (C_Pass_By_Copy, rcl_lexer_lookahead2_t);  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:35

  --/ Get a zero initialized rcl_lexer_lookahead2_t instance.
  --*
  -- * \sa rcl_lexer_lookahead2_init()
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \return zero initialized lookahead2 buffer.
  --  

   function rcl_get_zero_initialized_lexer_lookahead2 return rcl_lexer_lookahead2_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:56
   pragma Import (C, rcl_get_zero_initialized_lexer_lookahead2, "rcl_get_zero_initialized_lexer_lookahead2");

  --/ Initialize an rcl_lexer_lookahead2_t instance.
  --*
  -- * The lookahead2 buffer borrows a reference to the provided text.
  -- * The text must not be freed before the buffer is finalized.
  -- * The lookahead2 buffer only needs to be finalized if this function does not return RCL_RET_OK.
  -- * \sa rcl_lexer_lookahead2_fini()
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] buffer A buffer that is zero initialized.
  -- * \sa rcl_get_zero_initialized_lexer_lookahead2()
  -- * \param[in] text The string to analyze.
  -- * \param[in] allocator An allocator to use if an error occurs.
  -- * \return `RCL_RET_OK` if the buffer is successfully initialized, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_BAD_ALLOC` if allocating memory failed, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurrs.
  --  

   function rcl_lexer_lookahead2_init
     (buffer : access rcl_lexer_lookahead2_t;
      text : Interfaces.C.Strings.chars_ptr;
      allocator : rclx.rcl_allocator_h.rcl_allocator_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:85
   pragma Import (C, rcl_lexer_lookahead2_init, "rcl_lexer_lookahead2_init");

  --/ Finalize an instance of an rcl_lexer_lookahead2_t structure.
  --*
  -- * \sa rcl_lexer_lookahead2_init()
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes [1]
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] Only allocates if an argument is invalid.</i>
  -- *
  -- * \param[in] buffer The structure to be deallocated.
  -- * \return `RCL_RET_OK` if the structure was successfully finalized, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_lexer_lookahead2_fini (buffer : access rcl_lexer_lookahead2_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:111
   pragma Import (C, rcl_lexer_lookahead2_fini, "rcl_lexer_lookahead2_fini");

  --/ Look ahead at the next lexeme in the string.
  --*
  -- * Repeated calls to peek will return the same lexeme.
  -- * A parser that deems the next lexeme as valid must accept it to advance lexing.
  -- * \sa rcl_lexer_lookahead2_accept()
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes [1]
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] Only allocates if an argument is invalid or an internal bug is detected.</i>
  -- *
  -- * \param[in] buffer the lookahead2 buffer being used to analyze a string.
  -- * \param[out] next_type an output variable for the next lexeme in the string.
  -- * \return `RCL_RET_OK` if peeking was successfull, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_lexer_lookahead2_peek (buffer : access rcl_lexer_lookahead2_t; next_type : access rclx.rcl_lexer_h.rcl_lexeme_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:138
   pragma Import (C, rcl_lexer_lookahead2_peek, "rcl_lexer_lookahead2_peek");

  --/ Look ahead at the next two lexemes in the string.
  --*
  -- * Repeated calls to peek2 will return the same two lexemes.
  -- * A parser that deems the next two lexemes as valid must accept twice to advance lexing.
  -- * \sa rcl_lexer_lookahead2_accept()
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes [1]
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] Only allocates if an argument is invalid or an internal bug is detected.</i>
  -- *
  -- * \param[in] buffer the lookahead2 buffer being used to analyze a string.
  -- * \param[out] next_type1 an output variable for the next lexeme in the string.
  -- * \param[out] next_type2 an output variable for the lexeme after the next lexeme in the string.
  -- * \return `RCL_RET_OK` if peeking was successfull, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_lexer_lookahead2_peek2
     (buffer : access rcl_lexer_lookahead2_t;
      next_type1 : access rclx.rcl_lexer_h.rcl_lexeme_t;
      next_type2 : access rclx.rcl_lexer_h.rcl_lexeme_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:167
   pragma Import (C, rcl_lexer_lookahead2_peek2, "rcl_lexer_lookahead2_peek2");

  --/ Accept a lexeme and advance analysis.
  --*
  -- * A token must have been peeked before it can be accepted.
  -- * \sa rcl_lexer_lookahead2_peek()
  -- * \sa rcl_lexer_lookahead2_peek2()
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes [1]
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] Only allocates if an argument is invalid or an error occurs.</i>
  -- *
  -- * \param[in] buffer the lookahead2 buffer being used to analyze a string.
  -- * \param[out] lexeme_text pointer to where lexeme begins in string.
  -- * \param[out] lexeme_text_length length of lexeme_text.
  -- * \return `RCL_RET_OK` if peeking was successfull, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_lexer_lookahead2_accept
     (buffer : access rcl_lexer_lookahead2_t;
      lexeme_text : System.Address;
      lexeme_text_length : access rclx.stddef_h.size_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:197
   pragma Import (C, rcl_lexer_lookahead2_accept, "rcl_lexer_lookahead2_accept");

  --/ Require the next lexeme to be a certain type and advance analysis.
  --*
  -- * This method is a shortcut to peeking and accepting a lexeme.
  -- * It should be used by a parser when there is only one valid lexeme that could come next.
  -- * \sa rcl_lexer_lookahead2_peek()
  -- * \sa rcl_lexer_lookahead2_accept()
  -- *
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | Yes [1]
  -- * Thread-Safe        | No
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- * <i>[1] Only allocates if an argument is invalid or an error occurs.</i>
  -- *
  -- * \param[in] buffer the lookahead2 buffer being used to analyze a string.
  -- * \param[in] type the type the next lexeme must be.
  -- * \param[out] lexeme_text pointer to where lexeme begins in string.
  -- * \param[out] lexeme_text_length length of lexeme_text.
  -- * \return `RCL_RET_OK` if the next lexeme was the expected one, or
  -- * \return `RCL_RET_WRONG_LEXEME` if the next lexeme was not the expected one, or
  -- * \return `RCL_RET_INVALID_ARGUMENT` if any function arguments are invalid, or
  -- * \return `RCL_RET_ERROR` if an unspecified error occurs.
  --  

   function rcl_lexer_lookahead2_expect
     (buffer : access rcl_lexer_lookahead2_t;
      c_type : rclx.rcl_lexer_h.rcl_lexeme_t;
      lexeme_text : System.Address;
      lexeme_text_length : access rclx.stddef_h.size_t) return rclx.rcl_types_h.rcl_ret_t;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:230
   pragma Import (C, rcl_lexer_lookahead2_expect, "rcl_lexer_lookahead2_expect");

  --/ Get the text at the point where it is currently being analyzed.
  --*
  -- * <hr>
  -- * Attribute          | Adherence
  -- * ------------------ | -------------
  -- * Allocates Memory   | No
  -- * Thread-Safe        | Yes
  -- * Uses Atomics       | No
  -- * Lock-Free          | Yes
  -- *
  -- * \param[in] buffer the lookahead2 buffer being used to analyze a string.
  -- * \return a pointer inside the original text at the position being analyzed, or
  -- * \return `NULL` if buffer is itself `NULL` or zero initialized, or
  -- * \return an undefined value if buffer is not initialized or has been finalized.
  --  

   function rcl_lexer_lookahead2_get_text (buffer : access constant rcl_lexer_lookahead2_t) return Interfaces.C.Strings.chars_ptr;  -- /home/jano/local/ros2/ros2_rolling/install/include/rcl/lexer_lookahead.h:254
   pragma Import (C, rcl_lexer_lookahead2_get_text, "rcl_lexer_lookahead2_get_text");

end rclx.rcl_lexer_lookahead_h;
