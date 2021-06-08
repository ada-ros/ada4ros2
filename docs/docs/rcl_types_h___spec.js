GNATdoc.Documentation = {
  "label": "rcl_types_h",
  "qualifier": "",
  "summary": [
  ],
  "description": [
  ],
  "entities": [
    {
      "entities": [
        {
          "label": "rcl_ret_t",
          "qualifier": "",
          "line": 84,
          "column": 12,
          "src": "srcs/rcl_types_h.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 84,
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
                      "text": "rcl_ret_t",
                      "href": "docs/rcl_types_h___spec.html#L84C12"
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
                      "text": "rmw_ret_types_h.rmw_ret_t",
                      "href": "docs/rmw_ret_types_h___spec.html#L36C12"
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
                  "text": "Copyright 2014 Open Source Robotics Foundation, Inc.\n"
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
                }
              ]
            }
          ]
        }
      ],
      "label": "Simple types"
    },
    {
      "entities": [
        {
          "label": "rcl_serialized_message_t",
          "qualifier": "",
          "line": 132,
          "column": 12,
          "src": "srcs/rcl_types_h.ads.html",
          "summary": [
          ],
          "description": [
            {
              "kind": "code",
              "children": [
                {
                  "kind": "line",
                  "number": 132,
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
                      "text": "rcl_serialized_message_t",
                      "href": "docs/rcl_types_h___spec.html#L132C12"
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
                      "text": "rmw_serialized_message_h.rmw_serialized_message_t",
                      "href": "docs/rmw_serialized_message_h___spec.html#L42C12"
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
                  "text": "/ Success return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Unspecified error return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Timeout occurred return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Failed to allocate memory return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid argument return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Unsupported return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl specific ret codes start at 100\n"
                },
                {
                  "kind": "span",
                  "text": "/ rcl_init() already called return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ rcl_init() not yet called return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Mismatched rmw identifier return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Topic name does not pass validation.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Service name (same as topic name) does not pass validation.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Topic name substitution is unknown.\n"
                },
                {
                  "kind": "span",
                  "text": "/ rcl_shutdown() already called return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl node specific ret codes in 2XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_node_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Failed to find node name\n"
                },
                {
                  "kind": "span",
                  "text": "rcl publisher specific ret codes in 3XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_publisher_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl subscription specific ret codes in 4XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_subscription_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Failed to take a message from the subscription return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl service client specific ret codes in 5XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_client_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Failed to take a response from the client return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl service server specific ret codes in 6XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_service_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Failed to take a request from the service return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl guard condition specific ret codes in 7XX\n"
                },
                {
                  "kind": "span",
                  "text": "rcl timer specific ret codes in 8XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_timer_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Given timer was canceled return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl wait and wait set specific ret codes in 9XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_wait_set_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Given rcl_wait_set_t is empty return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Given rcl_wait_set_t is full return code.\n"
                },
                {
                  "kind": "span",
                  "text": "rcl argument parsing specific ret codes in 1XXX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Argument is not a valid remap rule\n"
                },
                {
                  "kind": "span",
                  "text": "/ Expected one type of lexeme but got another\n"
                },
                {
                  "kind": "span",
                  "text": "/ Found invalid ros argument while parsing\n"
                },
                {
                  "kind": "span",
                  "text": "/ Argument is not a valid parameter rule\n"
                },
                {
                  "kind": "span",
                  "text": "/ Argument is not a valid log level rule\n"
                },
                {
                  "kind": "span",
                  "text": "rcl event specific ret codes in 20XX\n"
                },
                {
                  "kind": "span",
                  "text": "/ Invalid rcl_event_t given return code.\n"
                },
                {
                  "kind": "span",
                  "text": "/ Failed to take an event from the event handle\n"
                },
                {
                  "kind": "span",
                  "text": "/ typedef for rmw_serialized_message_t;\n"
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