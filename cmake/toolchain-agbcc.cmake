set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_USER_MAKE_RULES_OVERRIDE
    "${CMAKE_CURRENT_LIST_DIR}/toolchain-agbcc-rules.cmake")

get_filename_component(_AGBCC_DRIVER
    "${CMAKE_CURRENT_LIST_DIR}/../tools/agbcc" ABSOLUTE)
get_filename_component(_GBA_LINK_DRIVER
    "${CMAKE_CURRENT_LIST_DIR}/../tools/gba-link" ABSOLUTE)

set(CMAKE_C_COMPILER "${_AGBCC_DRIVER}" CACHE FILEPATH "agbcc compiler driver" FORCE)
set(CMAKE_C_COMPILER_ID GNU)
set(CMAKE_C_COMPILER_ID_RUN TRUE)
set(CMAKE_C_COMPILER_WORKS TRUE CACHE BOOL "" FORCE)
set(CMAKE_C_COMPILER_FORCED TRUE)

set(CMAKE_C_OUTPUT_EXTENSION ".o")
set(CMAKE_ASM_OUTPUT_EXTENSION ".o")

find_program(AGBCC_HOST_CC NAMES cc clang gcc REQUIRED)
find_program(AGBCC_ICONV NAMES iconv REQUIRED)
find_program(CMAKE_ASM_COMPILER NAMES arm-none-eabi-as REQUIRED)
find_program(CMAKE_AR NAMES arm-none-eabi-ar REQUIRED)
find_program(CMAKE_LINKER NAMES arm-none-eabi-ld REQUIRED)
find_program(CMAKE_OBJCOPY NAMES arm-none-eabi-objcopy REQUIRED)

set(CMAKE_ASM_COMPILER "${CMAKE_ASM_COMPILER}" CACHE FILEPATH "ARM assembler" FORCE)
set(CMAKE_AR "${CMAKE_AR}" CACHE FILEPATH "ARM archiver" FORCE)
set(CMAKE_LINKER "${CMAKE_LINKER}" CACHE FILEPATH "ARM linker" FORCE)
set(CMAKE_OBJCOPY "${CMAKE_OBJCOPY}" CACHE FILEPATH "ARM objcopy" FORCE)

set(_agbcc_default "$ENV{AGBCC}")
if(_agbcc_default STREQUAL "" AND IS_DIRECTORY "$ENV{HOME}/agbcc/tools/agbcc")
    set(_agbcc_default "$ENV{HOME}/agbcc/tools/agbcc")
endif()
set(AGBCC "${_agbcc_default}" CACHE PATH "Path to pret/agbcc tools/agbcc")
if(AGBCC STREQUAL "")
    message(FATAL_ERROR "AGBCC is not set. Export AGBCC or configure with -DAGBCC=/path/to/agbcc/tools/agbcc")
endif()
if(NOT IS_DIRECTORY "${AGBCC}/include")
    message(FATAL_ERROR "AGBCC include directory not found: ${AGBCC}/include")
endif()
if(NOT EXISTS "${AGBCC}/bin/old_agbcc")
    message(FATAL_ERROR "old_agbcc not found: ${AGBCC}/bin/old_agbcc")
endif()
if(NOT EXISTS "${AGBCC}/lib/libgcc.a")
    message(FATAL_ERROR "libgcc.a not found: ${AGBCC}/lib/libgcc.a")
endif()

if(DEFINED ENV{CFLAGS} AND NOT "$ENV{CFLAGS}" STREQUAL "")
    message(WARNING "Ignoring environment CFLAGS for the canonical matching build")
endif()
if(DEFINED ENV{ASMFLAGS} AND NOT "$ENV{ASMFLAGS}" STREQUAL "")
    message(WARNING "Ignoring environment ASMFLAGS for the canonical matching build")
endif()

foreach(_language C ASM)
    set(CMAKE_${_language}_FLAGS "" CACHE STRING "" FORCE)
    foreach(_config DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
        set(CMAKE_${_language}_FLAGS_${_config} "" CACHE STRING "" FORCE)
    endforeach()
endforeach()
set(CMAKE_EXE_LINKER_FLAGS "" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_RELWITHDEBINFO "" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS_MINSIZEREL "" CACHE STRING "" FORCE)
set(CMAKE_C_STANDARD_LIBRARIES "" CACHE STRING "" FORCE)

set(CMAKE_C_COMPILE_OBJECT
    "<CMAKE_C_COMPILER> --cpp=${AGBCC_HOST_CC} --iconv=${AGBCC_ICONV} --cc1=${AGBCC}/bin/old_agbcc --as=${CMAKE_ASM_COMPILER} --as-include=${CMAKE_SOURCE_DIR} <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT> -c <SOURCE>")
set(CMAKE_C_DEPFILE_FORMAT gcc)
set(CMAKE_C_DEPENDS_USE_COMPILER TRUE)

set(CMAKE_ASM_COMPILE_OBJECT
    "<CMAKE_ASM_COMPILER> <DEFINES> <INCLUDES> <FLAGS> -o <OBJECT> <SOURCE>")
set(CMAKE_ASM_DEPFILE_FORMAT gcc)
set(CMAKE_ASM_DEPENDS_USE_COMPILER TRUE)

set(CMAKE_C_LINK_EXECUTABLE
    "${_GBA_LINK_DRIVER} --ld=${CMAKE_LINKER} --script=${CMAKE_SOURCE_DIR}/ld_script.ld --out=<TARGET> --map=${CMAKE_BINARY_DIR}/rom.map --libgcc=${AGBCC}/lib/libgcc.a --stage=${CMAKE_BINARY_DIR}/link <LINK_FLAGS> <OBJECTS> <LINK_LIBRARIES>")

set(AGBCC_TOOLCHAIN TRUE CACHE INTERNAL "Using the agbcc GBA toolchain")
set(AGBCC_DRIVER "${_AGBCC_DRIVER}" CACHE INTERNAL "agbcc compiler driver")
