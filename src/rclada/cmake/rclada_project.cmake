message("Ada CMake extensions loaded (rclada) v${PROJECT_VERSION}")

function(add_ada_executable TARGET GPRFILE OUTFILE)
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

    add_executable(${TARGET} ${rclada_SUPPORT_DIR}/rclada_fake_target.c)

    add_custom_target(
            ${TARGET}_phony
            ALL
            WORKING_DIRECTORY ${PROJECT_BINARY_DIR}

            COMMAND gprbuild
                -P ${PROJECT_SOURCE_DIR}/${GPRFILE}
                -aP ${rclada_INCLUDE_DIR}
                -p -j0 -XPROJECT_BINARY_DIR=${PROJECT_BINARY_DIR}

            COMMAND ${CMAKE_COMMAND} -E remove -f ${TARGET}
            COMMAND ${CMAKE_COMMAND} -E copy ${OUTFILE} ${TARGET}

            COMMENT "${TARGET} Ada target built"
    )

    add_dependencies(${TARGET}_phony ${TARGET})

    install(TARGETS ${TARGET} DESTINATION lib/${PROJECT_NAME}/)

endfunction(add_ada_executable)