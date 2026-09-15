# Generic GBA rom target support for the agbcc toolchain. Game-specific
# settings (compiler flags, per-file options, version defines) belong in the
# project's CMakeLists.txt; this module only consumes:
#   ROM_LINKER_SCRIPT          linker-script template (run through cpp -P)
#   ROM_LINKER_SCRIPT_DEFINES  extra cpp arguments for the template
#   ROM_LINKER_SCRIPT_DEPENDS  extra files the template depends on
#   ROM_VERSION / ROM_SHA1 / ROM_VALIDATED   the version being built
#   ROM_VERSIONS               every version, for objdiff.json units
if(NOT AGBCC_TOOLCHAIN)
    return()
endif()

set_target_properties(rom PROPERTIES SUFFIX ".elf")

set(_generated_linker_script "${CMAKE_BINARY_DIR}/ld_script.ld")
set(_linker_cpp_args
    -E -P -x c
    ${ROM_LINKER_SCRIPT_DEFINES}
    "${ROM_LINKER_SCRIPT}"
    -o "${_generated_linker_script}")
execute_process(
    COMMAND "${AGBCC_HOST_CC}" ${_linker_cpp_args}
    RESULT_VARIABLE _linker_cpp_result)
if(NOT _linker_cpp_result EQUAL 0)
    message(FATAL_ERROR "Failed to preprocess ld_script.ld")
endif()
add_custom_command(
    OUTPUT "${_generated_linker_script}"
    COMMAND "${AGBCC_HOST_CC}" ${_linker_cpp_args}
    DEPENDS "${ROM_LINKER_SCRIPT}" ${ROM_LINKER_SCRIPT_DEPENDS}
    VERBATIM)
add_custom_target(linker_script DEPENDS "${_generated_linker_script}")
add_dependencies(rom linker_script)
set_property(TARGET rom APPEND PROPERTY LINK_DEPENDS
    "${_generated_linker_script}"
    "${AGBCC}/lib/libgcc.a")

get_target_property(_rom_sources rom SOURCES)
set(_rom_clean_files)
foreach(_source IN LISTS _rom_sources)
    if(_source MATCHES "\\.c$")
        set_property(SOURCE "${_source}" APPEND PROPERTY OBJECT_DEPENDS
            "${AGBCC_DRIVER};${AGBCC}/bin/old_agbcc;${CMAKE_ASM_COMPILER}")
        list(APPEND _rom_clean_files
            "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/rom.dir/${_source}.o.i"
            "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/rom.dir/${_source}.o.s")
    endif()
endforeach()
set_property(TARGET rom APPEND PROPERTY ADDITIONAL_CLEAN_FILES
    "${_rom_clean_files}")

add_custom_command(
    OUTPUT "${CMAKE_BINARY_DIR}/rom.gba"
    COMMAND "${CMAKE_OBJCOPY}" -O binary --pad-to 0x8800000
            "$<TARGET_FILE:rom>" "${CMAKE_BINARY_DIR}/rom.gba"
    DEPENDS rom
    VERBATIM)
add_custom_target(rom_gba ALL DEPENDS "${CMAKE_BINARY_DIR}/rom.gba")

enable_testing()
set(_rom_test_name "rom-${ROM_VERSION}-matches")
add_test(NAME "${_rom_test_name}"
    COMMAND "${CMAKE_SOURCE_DIR}/tools/check-rom"
        "${ROM_VERSION}"
        "${ROM_SHA1}"
        "${ROM_VALIDATED}"
        "${CMAKE_BINARY_DIR}/rom.gba")
set_tests_properties("${_rom_test_name}" PROPERTIES SKIP_RETURN_CODE 77)
add_custom_target(compare
    COMMAND "${CMAKE_CTEST_COMMAND}" --output-on-failure --verbose
        -R "^${_rom_test_name}$"
    DEPENDS rom_gba
    VERBATIM)

set(_objdiff_units "")
set(_objdiff_first_unit TRUE)
# One unit set per version; a version's baseline (expected/build/<ver>) only
# exists once tools/update-expected has snapshotted a matching build.
foreach(_objdiff_version IN LISTS ROM_VERSIONS)
    foreach(_source IN LISTS _rom_sources)
        if(NOT _source MATCHES "^src/.+\\.c$")
            continue()
        endif()

        if(_objdiff_first_unit)
            set(_objdiff_first_unit FALSE)
        else()
            string(APPEND _objdiff_units ",\n")
        endif()

        string(APPEND _objdiff_units
            "    {\n"
            "      \"name\": \"${_objdiff_version}/${_source}\",\n"
            "      \"target_path\": \"expected/build/${_objdiff_version}/CMakeFiles/rom.dir/${_source}.o\",\n"
            "      \"base_path\": \"build/${_objdiff_version}/CMakeFiles/rom.dir/${_source}.o\",\n"
            "      \"metadata\": {\n"
            "        \"source_path\": \"${_source}\",\n"
            "        \"progress_categories\": [\"game\"]\n"
            "      }\n"
            "    }")
    endforeach()
endforeach()

file(WRITE "${CMAKE_SOURCE_DIR}/objdiff.json"
    "{\n"
    "  \"min_version\": \"3.0.0\",\n"
    "  \"custom_make\": \"tools/objdiff-build\",\n"
    "  \"custom_args\": [],\n"
    "  \"build_base\": true,\n"
    "  \"build_target\": false,\n"
    "  \"options\": {\"arm.archVersion\": \"v4t\"},\n"
    "  \"watch_patterns\": [\n"
    "    \"src/**/*.c\",\n"
    "    \"src/**/*.h\",\n"
    "    \"asm/dump/**/*.s\",\n"
    "    \"ld_script.ld\"\n"
    "  ],\n"
    "  \"progress_categories\": [\n"
    "    {\"id\": \"game\", \"name\": \"Game\"}\n"
    "  ],\n"
    "  \"units\": [\n"
    "${_objdiff_units}\n"
    "  ]\n"
    "}\n")
