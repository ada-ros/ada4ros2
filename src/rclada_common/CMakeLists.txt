cmake_minimum_required(VERSION 3.5)
project(rclada_common)

set(${PROJECT_NAME}_MAJOR_VERSION 0)
set(${PROJECT_NAME}_MINOR_VERSION 1)
set(${PROJECT_NAME}_PATCH_VERSION 0)
set(${PROJECT_NAME}_VERSION
  ${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_VERSION})
set(PROJECT_VERSION ${${PROJECT_NAME}_VERSION})

message(" ")
message("${PROJECT_NAME} version ${PROJECT_VERSION}")

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

if(BUILD_TESTING)
  # Silence a warning (?)
endif()

# Detect builder and compiler

find_program(GPRBUILD gprbuild)
if (NOT GPRBUILD)
  message(SEND_ERROR "gprbuild must be available in PATH")
endif()

find_program(GNAT gnat)
if (NOT GNAT)
  message(SEND_ERROR "gnat must be available in PATH")
endif()

set(ADA_BUILD_DIR ${PROJECT_BINARY_DIR})
set(ADA_RESOURCE_DIR ${PROJECT_SOURCE_DIR}/resources)

include(cmake/ada_project.cmake)

export(PACKAGE ${PROJECT_NAME})
install(FILES package.xml DESTINATION share/${PROJECT_NAME})
install(FILES cmake/ada_project.cmake DESTINATION ${PROJECT_BINARY_DIR})

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#  message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()