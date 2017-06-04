cmake_minimum_required(VERSION 3.2.2)

file(GLOB_RECURSE
        SOURCE_FILES
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c
        ${CMAKE_CURRENT_SOURCE_DIR}/src/*.h)

if (NOT CLANG_FORMAT)
    find_program(CLANG_FORMAT "clang-format")
endif ()

if (NOT CLANG_FORMAT)
    message(FATAL_ERROR "clang-format couldn't be found")
endif ()

foreach (FILE ${SOURCE_FILES})
    execute_process(
            COMMAND ${CLANG_FORMAT} -style=file -output-replacements-xml ${FILE}
            OUTPUT_VARIABLE CLANG_FORMAT_OUT
    )

    string(FIND "${CLANG_FORMAT_OUT}" "offset" CLANG_FORMAT_REPLACEMENT_OFFSET)
    if (NOT CLANG_FORMAT_REPLACEMENT_OFFSET EQUAL -1)
        message(FATAL_ERROR "clang-format suggested changes")
    endif ()
endforeach ()
