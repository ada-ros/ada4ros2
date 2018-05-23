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

    add_executable(${TARGET} ${rclada_SUPPORT_DIR}/rclada_fake_target.c)

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

function(ada_import_c_library LIB)
    # Creates the GPR file to be able to use this project
    configure_file(
            ${ADA_RESOURCE_DIR}/external_c_lib.gpr.in
            ${ADA_BUILD_DIR}/gpr/{LIB}.gpr)
endfunction(ada_import_c_library)

function(add_ada_library)
    # Build and install an Ada library
    # Both for dependent Ada and C/C++ projects
    # In the C/C++ the actual built path is propagated
    # For the Ada case, all libraries are installed inside rclada build folder
    # This is ugly but there's no way without much uglifying client projects,
    #   since each one has its own isolated CMake environment
    # Or perhaps this is doable hiding ugliness of cmake files here? Must think
endfunction(add_ada_library)
