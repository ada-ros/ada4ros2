cmake_minimum_required(VERSION 3.5)
project(rclada)

# Default to C99
if(NOT CMAKE_C_STANDARD)
  set(CMAKE_C_STANDARD 99)
endif()

# Default to C++14
if(NOT CMAKE_CXX_STANDARD)
  set(CMAKE_CXX_STANDARD 14)
endif()

if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
  add_compile_options(-Wall -Wextra -Wpedantic)
endif()

if(BUILD_TESTING)
  # Silence a warning (?)
endif()

find_package(ament_cmake REQUIRED)
find_package(rcl REQUIRED)
find_package(rcutils REQUIRED)
find_package(rmw REQUIRED)
#find_package(rcutils REQUIRED)

###########################################################################

message(STATUS "Starting Ada-specific configuration")

# Detect builder and compiler

find_program(GPRBUILD gprbuild)
if (NOT GPRBUILD)
  message(SEND_ERROR "gprbuild must be available in PATH")
endif()

find_program(GNAT gnat)
if (NOT GNAT)
  message(SEND_ERROR "gnat must be available in PATH")
endif()

# Find all headers in rcl and generate automatic ada headers
file(GLOB rcl_headers "${rcl_INCLUDE_DIRS}/rcl/*.h")
message(STATUS "Using RCL headers ${rcl_headers}")

# For some reason rmw folders are duplicated:
list(GET rmw_INCLUDE_DIRS 0 rmw_header_dir)

#file(GLOB rcutils_headers "${rcutils_INCLUDE_DIRS}/rcutils/*.h")
#message(STATUS "Using RCUTILS headers ${rcutils_headers}")

# Extra headers that we need
set(extra_headers
        ${rcutils_INCLUDE_DIRS}/rcutils/allocator.h
        ${rcutils_INCLUDE_DIRS}/rcutils/error_handling.h
        ${rcutils_INCLUDE_DIRS}/rcutils/time.h
        ${rcutils_INCLUDE_DIRS}/rcutils/types/string_array.h
        ${rcutils_INCLUDE_DIRS}/rcutils/types/string_map.h
        ${rmw_header_dir}/rmw/names_and_types.h
        ${rmw_header_dir}/rmw/types.h)
message(STATUS "Using EXTRA headers ${extra_headers}")

add_custom_target(rclada_create_folder_for_generated_headers
        ALL
        ${CMAKE_COMMAND} -E make_directory gen)

add_custom_target(rclada_generate_headers
        ALL
        # Note that later standards generate broken bindings at present (g++ v7.3)
        COMMAND g++ -std=c++03
          -I${rcl_INCLUDE_DIRS}
          -fdump-ada-spec-slim
          -C
          -fada-spec-parent=rclx
          ${extra_headers}
          ${rcl_headers}
#          ${rcutils_headers}
        WORKING_DIRECTORY gen)

add_dependencies(rclada_generate_headers rclada_create_folder_for_generated_headers)

#install(DIRECTORY DESTINATION ${PROJECT_NAME}/gen)

#ament_target_dependencies(${PROJECT_NAME} "rcl")

#ament_export_include_directories(include)
#ament_export_libraries(${PROJECT_NAME})

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#  message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
