cmake_minimum_required(VERSION 3.5)
project(rclada)

set(${PROJECT_NAME}_MAJOR_VERSION 0)
set(${PROJECT_NAME}_MINOR_VERSION 1)
set(${PROJECT_NAME}_PATCH_VERSION 0)
set(${PROJECT_NAME}_VERSION
        ${${PROJECT_NAME}_MAJOR_VERSION}.${${PROJECT_NAME}_MINOR_VERSION}.${${PROJECT_NAME}_PATCH_VERSION})
set(PROJECT_VERSION ${${PROJECT_NAME}_VERSION})

message(" ")
message("${PROJECT_NAME} version ${PROJECT_VERSION}")

if(BUILD_TESTING)
  # Silence a warning (?)
endif()

find_package(rcl REQUIRED)
find_package(rcutils REQUIRED)
find_package(rmw REQUIRED)
find_package(std_msgs REQUIRED)

find_package(rclada_common REQUIRED)
find_package(rosidl_generator_ada REQUIRED)

# IMPORT THE C LIBRARIES

ada_import_c_libraries(${rcutils_LIBRARIES})
ada_import_c_libraries(${rcl_LIBRARIES})

# Find all headers in rcl and generate automatic ada headers

ada_find_package_include_dir(_rcl_include ${rcl_DIR})
ada_find_package_include_dir(_rcutils_include ${rcutils_DIR})
ada_find_package_include_dir(_rmw_include ${rmw_DIR})

file(GLOB
        _headers
        "${_rcl_include}/rcl/*.h"
        "${_rcutils_include}/rcutils/*.h"
        "${_rcutils_include}/rcutils/types/*.h"
        "${_rmw_include}/rmw/*.h")

set(_includes "${_rcutils_include};${_rmw_include};${_rcl_include}")

# Extra headers that we need
set(_extra_headers
        ${_rcutils_include}/rcutils/allocator.h
        ${_rcutils_include}/rcutils/error_handling.h
        ${_rcutils_include}/rcutils/logging.h
        ${_rcutils_include}/rcutils/time.h
        ${_rcutils_include}/rcutils/types/string_array.h
        ${_rcutils_include}/rcutils/types/string_map.h
        ${_rmw_include}/rmw/names_and_types.h
        ${_rmw_include}/rmw/types.h)

ada_generate_binding(
        ada_binding_rcl
        gpr_rcl
        "${_includes}"
        ${_headers}
        ${_extra_headers}
)

ada_export_package()

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#  message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()