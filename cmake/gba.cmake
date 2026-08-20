if(NOT AGBCC_TOOLCHAIN)
    return()
endif()

set_target_properties(rom PROPERTIES SUFFIX ".elf")

target_compile_options(rom PRIVATE
    "$<$<COMPILE_LANGUAGE:C>:-I${AGBCC}/include;-mthumb-interwork;-Wimplicit;-Wparentheses;-Wunused;-Werror;-O2;-fhex-asm>"
    "$<$<COMPILE_LANGUAGE:ASM>:-mcpu=arm7tdmi;-I${CMAKE_SOURCE_DIR}>")
set_source_files_properties(src/libc.c PROPERTIES
    COMPILE_OPTIONS "--reset-flags;-O2")

set_property(TARGET rom APPEND PROPERTY LINK_DEPENDS
    "${CMAKE_SOURCE_DIR}/ld_script.ld"
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
add_test(NAME rom-matches
    COMMAND "${CMAKE_COMMAND}" -E sha1sum "${CMAKE_BINARY_DIR}/rom.gba")
set_tests_properties(rom-matches PROPERTIES PASS_REGULAR_EXPRESSION
    "^cd527c8c24e20e33913fc45199e64b3e6138a6e5")
add_custom_target(compare
    COMMAND "${CMAKE_CTEST_COMMAND}" --output-on-failure -R rom-matches
    DEPENDS rom_gba
    VERBATIM)

set(_canonical_binary_dir "${CMAKE_SOURCE_DIR}/build")
if("${CMAKE_BINARY_DIR}" STREQUAL "${_canonical_binary_dir}")
    set(_objdiff_units "")
    set(_objdiff_first_unit TRUE)
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
            "      \"name\": \"${_source}\",\n"
            "      \"target_path\": \"expected/CMakeFiles/rom.dir/${_source}.o\",\n"
            "      \"base_path\": \"build/CMakeFiles/rom.dir/${_source}.o\",\n"
            "      \"metadata\": {\n"
            "        \"source_path\": \"${_source}\",\n"
            "        \"progress_categories\": [\"game\"]\n"
            "      }\n"
            "    }")
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

endif()
