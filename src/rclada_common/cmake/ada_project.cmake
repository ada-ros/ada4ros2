message("Ada CMake extensions loaded (${PROJECT_NAME}) v${PROJECT_VERSION}")

function(ada_add_executable SRCFOLDER OUTDIR #[[ targets ]])
# SRCFOLDER: the path to the GPR-containing project
# OUTFOLDER: relative path in SRCFOLDER where the real targets are built
# TARGETS: each executable name built by this project, without path

    get_filename_component(_basename ${SRCFOLDER} NAME)
    set(_workspace ${PROJECT_BINARY_DIR}/${_basename})

    # working space:
    file(COPY ${SRCFOLDER}
            DESTINATION ${PROJECT_BINARY_DIR})

    # the target that builds the Ada project
    add_custom_target(
            ${_basename}_phony
            # ALL
            WORKING_DIRECTORY ${_workspace}

            COMMAND gprbuild
                -aP ${ADA_GPR_DIR}
                -aP ${ADA_GPRIMPORT_DIR}
                -p -j0

            COMMENT "${_basename} Ada target built"
    )

    foreach(TARGET ${ARGN})
        # Fake exec to be able to install an executable target
        add_executable(${TARGET} ${ADA_RESOURCE_DIR}/rclada_fake_target.c)

        # Copy each executable in place
        add_custom_command(
                TARGET ${TARGET}
                POST_BUILD
                WORKING_DIRECTORY ${_workspace}
                COMMAND ${CMAKE_COMMAND} -E remove -f ${PROJECT_BINARY_DIR}/${TARGET}
                COMMAND ${CMAKE_COMMAND} -E copy
                    ${_workspace}/${OUTDIR}/${TARGET}
                    ${PROJECT_BINARY_DIR}/${TARGET}
                COMMENT "${TARGET} Ada binary put in place"
        )

        # ensure the Ada project is built before so the post-command works
        # make the copy in place after building
        add_dependencies(${TARGET} ${_basename}_phony)

        # must go into "lib" or ros bash completion misses it (duh)
        install(TARGETS ${TARGET} DESTINATION lib/${PROJECT_NAME}/)
    endforeach()

endfunction()


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

    message(${PROJECT_NAME})

    install(FILES
            ${PROJECT_BINARY_DIR}/${_cmake_conf_file}
            ${PROJECT_BINARY_DIR}/${_cmake_version_file}
            DESTINATION share/${PROJECT_NAME}/cmake)

    export(PACKAGE ${PROJECT_NAME})
    install(FILES package.xml DESTINATION share/${PROJECT_NAME})
endfunction()


function (ada_find_package_include_dir RETURN PACKAGE_DIR)
    # Just three up
    get_filename_component(_dir ${PACKAGE_DIR} DIRECTORY)
    get_filename_component(_dir ${_dir} DIRECTORY)
    get_filename_component(_dir ${_dir} DIRECTORY)
    set(${RETURN} ${_dir}/include PARENT_SCOPE)
endfunction()

function (ada_find_package_library_dir RETURN PACKAGE_DIR)
    # Just three up
    get_filename_component(_dir ${PACKAGE_DIR} DIRECTORY)
    get_filename_component(_dir ${_dir} DIRECTORY)
    get_filename_component(_dir ${_dir} DIRECTORY)
    set(${RETURN} ${_dir}/lib PARENT_SCOPE)
endfunction()


function(ada_generate_binding TARGET SRCFOLDER INCLUDE #[[ ARGN ]])
    # Generate corresponding Ada specs, compile it and deploy it
    # TARGET is the desired target name to depend on this
    # SRCFOLDER is a preexisting ada project prepared to compile in "gen" the generated specs
    # INCLUDE, list (;-separated) of folders to add with -I

    #message(STATUS "Generating binding for ${SRCFOLDER} with files ${ARGN}")

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
    endif()

    # To avoid unneeded regenerations, we use a mock file to depend on which will be created when generating
    add_custom_command(
            OUTPUT ${_workspace}/gen/generated_flag

            WORKING_DIRECTORY ${_workspace}/gen

            COMMAND g++
                -fdump-ada-spec-slim
                -C
                ${INCLUDE}
                ${ARGN}

            COMMAND touch ${_workspace}/gen/generated_flag)

    # Generate headers
    add_custom_target(${TARGET}
            ALL

            DEPENDS ${_workspace}/gen/generated_flag

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


function(ada_import_c_libraries #[[ ARGN ]])
    # Expects a list of absolute paths to libs
    # One GPR file per path will be generated

    foreach(_lib ${ARGN})
        # Obtain name
        get_filename_component(_ext_lib_name ${_lib} NAME_WE)
        string(REPLACE lib "" _ext_lib_name ${_ext_lib_name})
        string(REPLACE "__" "_" _ext_safe_name ${_ext_lib_name})

        # Obtain path
        get_filename_component(_ext_lib_path ${_lib} DIRECTORY)

        # Sibling include
        get_filename_component(_ext_lib_include ${_ext_lib_path} DIRECTORY)
        set(_ext_lib_include ${_ext_lib_include}/include)

        #message("XXXXXXXXXXXXXX ${_ext_lib_name}")
        #message("XXXXXXXXXXXXXX ${_ext_lib_path}")

        configure_file(
                ${ADA_RESOURCE_DIR}/external_c_lib.gpr.in
                ${ADA_GPRIMPORT_DIR}/clib_${_ext_safe_name}.gpr)
    endforeach()
endfunction()