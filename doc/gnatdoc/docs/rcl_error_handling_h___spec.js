GNATdoc.Documentation = {
  "label": "rcl_error_handling_h",
  "qualifier": "",
  "summary": [
  ],
  "description": [
  ],
  "entities": [
    {
      "entities": [
        {
          "label": "rcl_error_state_t",
          "qualifier": "",
          "line": 33,
          "column": 12,
          "src": "srcs/rcl_error_handling_h.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 33,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "subtype"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "rcl_error_state_t",
                      "href": "docs/rcl_error_handling_h___spec.html#L33C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "rcutils_error_handling_h.rcutils_error_state_t",
                      "href": "docs/rcutils_error_handling_h___spec.html#L62C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "unsupported macro: rcl_initialize_error_handling_thread_local_storage rcutils_initialize_error_handling_thread_local_storage\n"
                },
                {
                  "kind": "span",
                  "text": "unsupported macro: rcl_set_error_state rcutils_set_error_state\n"
                },
                {
                  "kind": "span",
                  "text": "arg-macro: procedure RCL_CHECK_ARGUMENT_FOR_NULL (argument, error_return_type)\n"
                },
                {
                  "kind": "span",
                  "text": "RCUTILS_CHECK_ARGUMENT_FOR_NULL(argument, error_return_type)\n"
                },
                {
                  "kind": "span",
                  "text": "arg-macro: procedure RCL_CHECK_FOR_NULL_WITH_MSG (value, msg, error_statement)\n"
                },
                {
                  "kind": "span",
                  "text": "RCUTILS_CHECK_FOR_NULL_WITH_MSG(value, msg, error_statement)\n"
                },
                {
                  "kind": "span",
                  "text": "arg-macro: procedure RCL_SET_ERROR_MSG (msg)\n"
                },
                {
                  "kind": "span",
                  "text": "RCUTILS_SET_ERROR_MSG(msg)\n"
                },
                {
                  "kind": "span",
                  "text": "unsupported macro: RCL_SET_ERROR_MSG_WITH_FORMAT_STRING(fmt_str,...) RCUTILS_SET_ERROR_MSG_WITH_FORMAT_STRING(fmt_str, __VA_ARGS__)\n"
                },
                {
                  "kind": "span",
                  "text": "unsupported macro: rcl_error_is_set rcutils_error_is_set\n"
                },
                {
                  "kind": "span",
                  "text": "unsupported macro: rcl_get_error_state rcutils_get_error_state\n"
                },
                {
                  "kind": "span",
                  "text": "unsupported macro: rcl_get_error_string rcutils_get_error_string\n"
                },
                {
                  "kind": "span",
                  "text": "unsupported macro: rcl_reset_error rcutils_reset_error\n"
                },
                {
                  "kind": "span",
                  "text": "Copyright 2015 Open Source Robotics Foundation, Inc.\n"
                },
                {
                  "kind": "span",
                  "text": "Licensed under the Apache License, Version 2.0 (the \"License\");\n"
                },
                {
                  "kind": "span",
                  "text": "you may not use this file except in compliance with the License.\n"
                },
                {
                  "kind": "span",
                  "text": "You may obtain a copy of the License at\n"
                }
              ]
            },
            {
              "kind": "code",
              "children": [
                {
                  "number": 1,
                  "children": [
                    {
                      "kind": "span",
                      "text": "http://www.apache.org/licenses/LICENSE-2.0"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Unless required by applicable law or agreed to in writing, software\n"
                },
                {
                  "kind": "span",
                  "text": "distributed under the License is distributed on an \"AS IS\" BASIS,\n"
                },
                {
                  "kind": "span",
                  "text": "WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.\n"
                },
                {
                  "kind": "span",
                  "text": "See the License for the specific language governing permissions and\n"
                },
                {
                  "kind": "span",
                  "text": "limitations under the License.\n"
                },
                {
                  "kind": "span",
                  "text": "/ The error handling in RCL is just an alias to the error handling in rcutils.\n"
                }
              ]
            }
          ]
        },
        {
          "label": "rcl_error_string_t",
          "qualifier": "",
          "line": 35,
          "column": 12,
          "src": "srcs/rcl_error_handling_h.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 35,
                  "children": [
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": "   "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "subtype"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "rcl_error_string_t",
                      "href": "docs/rcl_error_handling_h___spec.html#L35C12"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "keyword",
                      "text": "is"
                    },
                    {
                      "kind": "span",
                      "cssClass": "text",
                      "text": " "
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": "rcutils_error_handling_h.rcutils_error_string_t",
                      "href": "docs/rcutils_error_handling_h___spec.html#L53C9"
                    },
                    {
                      "kind": "span",
                      "cssClass": "identifier",
                      "text": ";"
                    }
                  ]
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "/opt/ros/foxy/include/rcl/error_handling.h:23\n"
                }
              ]
            }
          ]
        }
      ],
      "label": "Record types"
    }
  ]
};