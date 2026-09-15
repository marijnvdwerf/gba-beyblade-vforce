if(NOT AGBCC_TOOLCHAIN)
    return()
endif()

set_target_properties(rom PROPERTIES SUFFIX ".elf")

target_compile_definitions(rom PRIVATE
    "$<$<COMPILE_LANGUAGE:C>:GAME_VERSION=${GAME_VERSION_DEFINE}>"
    "$<$<COMPILE_LANGUAGE:C>:GAME_REGION=${GAME_REGION_DEFINE}>")
target_compile_options(rom PRIVATE
    "$<$<COMPILE_LANGUAGE:C>:-I${AGBCC}/include;-mthumb-interwork;-Wimplicit;-Wparentheses;-Wunused;-Werror;-O2;-fhex-asm;-g>"
    "$<$<COMPILE_LANGUAGE:ASM>:-mcpu=arm7tdmi;-I${CMAKE_SOURCE_DIR};-I${CMAKE_BINARY_DIR}>")
set_source_files_properties(src/libc.c PROPERTIES
    COMPILE_OPTIONS "--reset-flags;-O2")
set_source_files_properties(src/backup.c PROPERTIES
    COMPILE_OPTIONS "--cc1=${AGBCC}/bin/agbcc;-O1;-fprologue-bugfix")
set_source_files_properties(src/iwram.c PROPERTIES
    COMPILE_OPTIONS "-marm")

set(_generated_version_include "${CMAKE_BINARY_DIR}/version.inc")
string(CONCAT _version_include_content
    ".macro GAME_CODE\n    .ascii \"${GAME_CODE}\"\n.endm\n"
    ".equ GAME_COMPLEMENT_CHECK, ${GAME_COMPLEMENT_CHECK}\n")
file(GENERATE OUTPUT "${_generated_version_include}"
    CONTENT "${_version_include_content}")
set_property(SOURCE asm/crt0.s APPEND PROPERTY OBJECT_DEPENDS
    "${_generated_version_include}")

set(_generated_linker_script "${CMAKE_BINARY_DIR}/ld_script.ld")
set(_linker_cpp_args
    -E -P -x c
    "-I${CMAKE_SOURCE_DIR}/src"
    "-DGAME_VERSION=${GAME_VERSION_DEFINE}"
    "-DGAME_REGION=${GAME_REGION_DEFINE}"
    "${CMAKE_SOURCE_DIR}/ld_script.ld"
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
    DEPENDS
        "${CMAKE_SOURCE_DIR}/ld_script.ld"
        "${CMAKE_SOURCE_DIR}/src/version.h"
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
set(_rom_test_name "rom-${GAME_VERSION}-matches")
add_test(NAME "${_rom_test_name}"
    COMMAND "${CMAKE_SOURCE_DIR}/tools/check-rom"
        "${GAME_VERSION}"
        "${GAME_SHA1}"
        "${GAME_VERSION_VALIDATED}"
        "${CMAKE_BINARY_DIR}/rom.gba")
set_tests_properties("${_rom_test_name}" PROPERTIES SKIP_RETURN_CODE 77)
add_custom_target(compare
    COMMAND "${CMAKE_CTEST_COMMAND}" --output-on-failure --verbose
        -R "^${_rom_test_name}$"
    DEPENDS rom_gba
    VERBATIM)

set(_objdiff_units "")
set(_objdiff_first_unit TRUE)
foreach(_objdiff_version us eu debug)
    # The US baseline is generated from the validated matching build.
    # The EU baseline is created only after that version is validated.
    # The debug baseline is created only after that version is validated.
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
