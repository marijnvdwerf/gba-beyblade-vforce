cmake_minimum_required(VERSION 3.2.2)

# project title
set(PROJECT beybladevforce)

if (CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR)
    message(FATAL_ERROR "Building in-source is not supported! Create a build dir and remove ${CMAKE_SOURCE_DIR}/CMakeCache.txt")
endif ()

set(DEVKITARM "" CACHE PATH "")
if (DEVKITARM STREQUAL "")
    message(FATAL_ERROR "DEVKITARM not specified")
endif ()

set(AGBCC "" CACHE PATH "")
if (AGBCC STREQUAL "")
    message(FATAL_ERROR "AGBCC not specified")
endif ()

find_program(ICONV iconv)

# DevkitARM tools
set(AS ${DEVKITARM}/bin/arm-none-eabi-as)
set(AS_FLAGS -mcpu=arm7tdmi)
set(CPP ${DEVKITARM}/bin/arm-none-eabi-cpp)
set(CPP_FLAGS -I${AGBCC}/include -nostdinc -undef)
set(GBAFIX ${DEVKITARM}/bin/gbafix)
set(LD ${DEVKITARM}/bin/arm-none-eabi-ld)
set(OBJCOPY ${DEVKITARM}/bin/arm-none-eabi-objcopy)

# PokeRuby tools
set(CC1 ${AGBCC}/bin/agbcc)
set(CC1_OLD ${AGBCC}/bin/old_agbcc)
set(C_FLAGS -mthumb-interwork -Wimplicit -Wparentheses -Wunused -Werror -O2 -fhex-asm -ffunction-sections)
set(LIBGCC_A ${AGBCC}/lib/libgcc.a)


include_directories("${AGBCC}/include")
set(CMAKE_C_STANDARD 90)

set(LD_SCRIPT "${CMAKE_CURRENT_BINARY_DIR}/ld_script.ld")
configure_file(ld_script.ld "${CMAKE_CURRENT_BINARY_DIR}/ld_script.ld")

set(ASM_OBJS)
file(GLOB_RECURSE ASM_SOURCES RELATIVE "${CMAKE_SOURCE_DIR}" "asm/*.s" "data/*.s")
foreach (ASM_NAME ${ASM_SOURCES})
    # Generate output file name
    set(ASM_OUT "${CMAKE_CURRENT_BINARY_DIR}/${ASM_NAME}.o")

    # Generate input file name
    set(ASM_IN "${CMAKE_SOURCE_DIR}/${ASM_NAME}")

    get_filename_component(DIR "${ASM_OUT}" DIRECTORY)

    # Custom command to do the processing
    add_custom_command(
            OUTPUT "${ASM_OUT}"
            COMMAND ${CMAKE_COMMAND} -E make_directory "${DIR}"
            COMMAND ${AS} ${AS_FLAGS} -I "${CMAKE_SOURCE_DIR}" -o "${ASM_OUT}" "${ASM_IN}"
            DEPENDS "${ASM_IN}"
    )

    # Finally remember the output file for dependencies
    list(APPEND ASM_OBJS ${ASM_OUT})
endforeach ()


set(C_OBJS)
file(GLOB_RECURSE C_SOURCES RELATIVE "${CMAKE_SOURCE_DIR}" "src/*.c")
foreach (C_NAME ${C_SOURCES})
    # Generate output file name
    set(C_OBJ "${CMAKE_CURRENT_BINARY_DIR}/${C_NAME}.o")
    set(C_INT "${CMAKE_CURRENT_BINARY_DIR}/${C_NAME}.i")
    set(C_INT2 "${CMAKE_CURRENT_BINARY_DIR}/${C_NAME}.i2")
    set(C_ASM "${CMAKE_CURRENT_BINARY_DIR}/${C_NAME}.s")

    set(FLAGS "${C_FLAGS}")
    if ("${C_NAME}" STREQUAL "src/libc.c")
        set(FLAGS "-O2")
    endif ()

    # Generate input file name
    set(C_SRC "${CMAKE_SOURCE_DIR}/${C_NAME}")

    get_filename_component(DIR "${C_OBJ}" DIRECTORY)

    # Custom command to do the processing
    add_custom_command(
            OUTPUT "${C_OBJ}"
            COMMAND ${CMAKE_COMMAND} -E make_directory "${DIR}"
            COMMAND ${CPP} ${CPP_FLAGS} "${C_SRC}" -o  "${C_INT}"
            COMMAND ${ICONV} --from-code=UTF-8 --to-code=WINDOWS-1252 "${C_INT}" > "${C_INT2}"
            COMMAND ${CC1_OLD} ${FLAGS} -o "${C_ASM}" "${C_INT2}"
            COMMAND ${AS} ${AS_FLAGS} -I "${CMAKE_SOURCE_DIR}" -o "${C_OBJ}" "${C_ASM}"
            DEPENDS "${C_SRC}"
    )

    # Finally remember the output file for dependencies
    list(APPEND C_OBJS ${C_OBJ})
endforeach ()

set(OUT_GBA "${CMAKE_CURRENT_BINARY_DIR}/rom.gba")
set(OUT_MAP "${CMAKE_CURRENT_BINARY_DIR}/rom.map")
set(OUT_ELF "${CMAKE_CURRENT_BINARY_DIR}/rom.elf")

add_custom_command(
        OUTPUT ${OUT_ELF}
        BYPRODUCTS ${OUT_MAP}
        COMMAND ${LD} -T ${LD_SCRIPT} -Map ${OUT_MAP} -o ${OUT_ELF} ${LIBGCC_A}
        DEPENDS ${LD_SCRIPT} ${ASM_OBJS} ${C_OBJS}
)

add_custom_command(
        OUTPUT ${OUT_GBA}
        COMMAND ${OBJCOPY} -O binary --pad-to 0x8800000 ${OUT_ELF} ${OUT_GBA}
        WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
        DEPENDS ${OUT_ELF}
)

add_custom_target(
        compare
        COMMAND ${CMAKE_COMMAND} -DFILE=${OUT_GBA} -DCHECKSUM=cd527c8c24e20e33913fc45199e64b3e6138a6e5 -P ${CMAKE_SOURCE_DIR}/scripts/compare.cmake
        DEPENDS ${OUT_GBA}
)

add_custom_target(beyblade ALL DEPENDS ${OUT_GBA})

file(GLOB_RECURSE SOURCES RELATIVE "${CMAKE_SOURCE_DIR}" "src/*.c" "src/*.h" "asm/*" "data/*" "ld_script.ld")
add_executable(beyblade_stub ${SOURCES})
