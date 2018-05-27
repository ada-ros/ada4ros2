cmake_minimum_required(VERSION 3.5)
project(rclada_examples)

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

find_package(rclada_common REQUIRED)
find_package(rclada REQUIRED)

###########################################################################

#ada_add_executable(listener examples.gpr bin/listener)

#add_executable(${TARGET} ${ADA_RESOURCE_DIR}/rclada_fake_target.c)

add_custom_target(
        listener
        ALL
        WORKING_DIRECTORY ${PROJECT_BINARY_DIR}

        COMMAND gprbuild
          -P ${PROJECT_SOURCE_DIR}/examples.gpr
          -aP ${ADA_GPR_DIR}
          -aP ${ADA_GPRIMPORT_DIR}
          -p -j0 -XPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}

        COMMAND ${CMAKE_COMMAND} -E copy bin/listener listener

        COMMENT "listener Ada target created"
)

install(FILES listener DESTINATION bin/${PROJECT_NAME}/)

#get_cmake_property(_variableNames VARIABLES)
#list (SORT _variableNames)
#foreach (_variableName ${_variableNames})
#  message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()