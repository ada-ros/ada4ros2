message("Ada CMake extensions loaded (${PROJECT_NAME}) v${PROJECT_VERSION}")

function(ada_add_executable TARGET GPRFILE OUTFILE)
    # TARGET is a plain name of an executable target
    # GPRFILE is the GPR project file that builds OUTFILE
    # OUTFILE is where the real TARGET is built, relative to the BUILD root of the package
    #    Also, OUTFILE must be out of said root to avoid conflicts

    # This operates as follows:
    # 1. A real executable target is created with a fake source
    # 2. A custom target launchs the Ada build via GPRBUILD
    # 3. The fake executable is deleted
    # 4. The real executable is copied into place
    # 5. A regular install command does the rest

    # A side effect seems to be that the custom target is executed twice,
    #   one inconditionally and another as dependency of the fake build.
    # This is a negligible penalty since the Ada build detects nothing has changed.

    # Arguably ExternalProject_Add would be more appropriate, but in this case
    #   we need to stay within CMake "actual" targets so ros2 adds them as executables.

    add_executable(${TARGET} ${ADA_RESOURCE_DIR}/rclada_fake_target.c)

    add_custom_target(
            ${TARGET}_phony
            ALL
            WORKING_DIRECTORY ${PROJECT_BINARY_DIR}

            COMMAND gprbuild
                -P ${PROJECT_SOURCE_DIR}/${GPRFILE}
                -aP ${ADA_BUILD_DIR}/gpr
                -p -j0 -XPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}

            COMMAND ${CMAKE_COMMAND} -E remove -f ${TARGET}
            COMMAND ${CMAKE_COMMAND} -E copy ${OUTFILE} ${TARGET}

            COMMENT "${TARGET} Ada target built"
    )

    # ensure the Ada target is built after the "fake" (but real) cmake one
    add_dependencies(${TARGET}_phony ${TARGET})

    install(TARGETS ${TARGET} DESTINATION bin/${PROJECT_NAME}/)

endfunction(ada_add_executable)


function(add_ada_library TARGET SRCFOLDER)

    get_filename_component(_basename ${SRCFOLDER} NAME)
    set(_workspace ${PROJECT_BINARY_DIR}/${_basename})

    # working space:
    file(COPY ${SRCFOLDER}
            DESTINATION ${PROJECT_BINARY_DIR})

    file(GLOB _gprfile "${_workspace}/*.gpr")

    message(STATUS "Building ${_gprfile} in ${SRCFOLDER}")

    add_custom_target(${TARGET}
            ALL

            # build
            COMMAND gprbuild
                -p -j0 -P ${_gprfile}
                -XROS_BUILD=Yes
                -aP ${ADA_GPR_DIR}
                -aP ${ADA_GPRIMPORT_DIR}

            # install
            COMMAND gprinstall
                -f -m -p -P ${_gprfile}
                -XROS_BUILD=Yes
                -aP ${ADA_GPR_DIR}
                -aP ${ADA_GPRIMPORT_DIR}
                --prefix=${CMAKE_INSTALL_PREFIX})
endfunction(add_ada_library)


function(ada_export_package)
    set(_cmake_version_file ${PROJECT_NAME}ConfigVersion.cmake)
    configure_file(
            cmake/${_cmake_version_file}.in
            ${PROJECT_BINARY_DIR}/${_cmake_version_file})

    set(_cmake_conf_file ${PROJECT_NAME}Config.cmake)
    configure_file(
            cmake/${_cmake_conf_file}.in
            ${PROJECT_BINARY_DIR}/${_cmake_conf_file}
            @ONLY)

    install(FILES
            ${PROJECT_BINARY_DIR}/${_cmake_conf_file}
            ${PROJECT_BINARY_DIR}/${_cmake_version_file}
            DESTINATION share/${PROJECT_NAME}/cmake)

    export(PACKAGE ${PROJECT_NAME})
    install(FILES package.xml DESTINATION share/${PROJECT_NAME})
endfunction()


function (ada_find_include_dir RETURN PACKAGE_DIR)
    # Just three up
    get_filename_component(_dir ${PACKAGE_DIR} DIRECTORY)
    get_filename_component(_dir ${_dir} DIRECTORY)
    get_filename_component(_dir ${_dir} DIRECTORY)
    set(${RETURN} ${_dir}/include PARENT_SCOPE)
endfunction()


function(ada_generate_binding TARGET SRCFOLDER INCLUDE #[[ ARGN ]])
    # Generate corresponding Ada specs, compile it and deploy it
    # TARGET is the desired target name to depend on this
    # SRCFOLDER is a preexisting ada project prepared to compile in "gen" the generated specs
    # INCLUDE, list (;-separated) of folders to add with -I

    message(STATUS "Generating binding for ${SRCFOLDER} with files ${ARGN}")

    get_filename_component(_basename ${SRCFOLDER} NAME)
    set(_workspace ${PROJECT_BINARY_DIR}/${_basename})

    # working space:
    file(COPY ${SRCFOLDER}
         DESTINATION ${PROJECT_BINARY_DIR})

    file(MAKE_DIRECTORY ${_workspace}/gen)
    file(GLOB _gprfile "${_workspace}/*.gpr")

    # Prepare extra includes
    if(NOT INCLUDE STREQUAL "")
        string(REPLACE ";" ";-I" INCLUDE "${INCLUDE}")
        set(INCLUDE "-I${INCLUDE}")
        message("AFTER ${INCLUDE}")
    endif()

    # Generate headers
    add_custom_target(${TARGET}
            ALL

            WORKING_DIRECTORY ${_workspace}/gen

            COMMAND g++
                -fdump-ada-spec-slim
                -C
                ${INCLUDE}
                ${ARGN}

            COMMAND gprbuild
                -p -j0 -P ${_gprfile}
                -XROS_BUILD=Yes
                -aP ${ADA_GPR_DIR}
                -aP ${ADA_GPRIMPORT_DIR}

            COMMAND gprinstall
                -f -m -p -P ${_gprfile}
                -XROS_BUILD=Yes
                -aP ${ADA_GPR_DIR}
                -aP ${ADA_GPRIMPORT_DIR}
                --prefix=${CMAKE_INSTALL_PREFIX})
endfunction()


function(ada_import_c_library LIB)
    # Creates the GPR file to be able to use this project
    set(EXT_LIB_NAME ${LIB})
    configure_file(
            ${ADA_RESOURCE_DIR}/external_c_lib.gpr.in
            ${ADA_GPRIMPORT_DIR}/clib_${LIB}.gpr)
endfunction(ada_import_c_library)