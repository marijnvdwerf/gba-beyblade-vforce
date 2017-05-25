cmake_minimum_required(VERSION 3.6)

# project title
set(PROJECT beybladevforce)

if (CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR)
    message(FATAL_ERROR "Building in-source is not supported! Create a build dir and remove ${CMAKE_SOURCE_DIR}/CMakeCache.txt")
endif ()

set(DEVKITARM "" CACHE PATH "")
if (DEVKITARM STREQUAL "")
    message(FATAL_ERROR "DEVKITARM not specified")
endif ()

set(POKERUBY "" CACHE PATH "")
if (POKERUBY STREQUAL "")
    message(FATAL_ERROR "POKERUBY not specified")
endif ()

set(ICONV /usr/bin/iconv)

# DevkitARM tools
set(AS ${DEVKITARM}/bin/arm-none-eabi-as)
set(AS_FLAGS -mcpu=arm7tdmi)
set(CPP ${DEVKITARM}/bin/arm-none-eabi-cpp)
set(CPP_FLAGS -I${POKERUBY}/tools/agbcc/include -nostdinc -undef)
set(GBAFIX ${DEVKITARM}/bin/gbafix)
set(LD ${DEVKITARM}/bin/arm-none-eabi-ld)
set(OBJCOPY ${DEVKITARM}/bin/arm-none-eabi-objcopy)

# PokeRuby tools
set(GFX ${POKERUBY}/tools/gbagfx/gbagfx)
set(AIF ${POKERUBY}/tools/aif2pcm/aif2pcm)
set(BIN2C ${POKERUBY}/tools/bin2c/bin2c)
set(MID ${POKERUBY}/tools/mid2agb/mid2agb)
set(SCANINC ${POKERUBY}/tools/scaninc/scaninc)
set(PREPROC ${POKERUBY}/tools/preproc/preproc)
set(RAMSCRGEN ${POKERUBY}/tools/ramscrgen/ramscrgen)
set(RSFONT ${POKERUBY}/tools/rsfont/rsfont)
set(CC1 ${POKERUBY}/tools/agbcc/bin/agbcc)
set(CC1_OLD ${POKERUBY}/tools/agbcc/bin/old_agbcc)
set(C_FLAGS -mthumb-interwork -Wimplicit -Wparentheses -Wunused -Werror -O2 -fhex-asm)
set(LIBGCC ${POKERUBY}/tools/agbcc/lib/libgcc.a)


include_directories("${POKERUBY}/tools/agbcc/include")
set(CMAKE_C_FLAGS "-nostdinc -undef")
set(CMAKE_C_STANDARD 90)

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

    # Generate input file name
    set(C_SRC "${CMAKE_SOURCE_DIR}/${C_NAME}")

    get_filename_component(DIR "${C_OBJ}" DIRECTORY)

    # Custom command to do the processing
    add_custom_command(
            OUTPUT "${C_OBJ}"
            COMMAND ${CMAKE_COMMAND} -E make_directory "${DIR}"
            COMMAND ${CPP} ${CPP_FLAGS} "${C_SRC}" -o  "${C_INT}"
            COMMAND ${ICONV} --from-code=UTF-8 --to-code=WINDOWS-1252 "${C_INT}" > "${C_INT2}"
            COMMAND ${CC1} ${C_FLAGS} -o  "${C_ASM}" "${C_INT2}"
            COMMAND ${AS} ${AS_FLAGS} -I "${CMAKE_SOURCE_DIR}" -o "${C_OBJ}" "${C_ASM}"
            DEPENDS "${C_SRC}"
    )

# @$(CPP) $(CPPFLAGS) -D $(VERSION) -D REVISION=$(REVISION) $< -o $*.i
# @$(PREPROC) $*.i charmap.txt | $(CC1) $(CFLAGS) -o $*.s
# @
# $(AS) $(ASFLAGS) -o $@ $*.s

    # Finally remember the output file for dependencies
    list(APPEND C_OBJS ${C_OBJ})
endforeach ()

set(OUT_GBA "${CMAKE_CURRENT_BINARY_DIR}/rom.gba")
set(OUT_MAP "${CMAKE_CURRENT_BINARY_DIR}/rom.map")
set(OUT_ELF "${CMAKE_CURRENT_BINARY_DIR}/rom.elf")

set(LD_SCRIPT "${CMAKE_SOURCE_DIR}/ld_script.ld")

add_custom_command(
        OUTPUT ${OUT_ELF}
        BYPRODUCTS ${OUT_MAP}
        COMMAND ${LD} -T ${LD_SCRIPT} -Map ${OUT_MAP} -o ${OUT_ELF}
        DEPENDS ${LD_SCRIPT} ${ASM_OBJS} ${C_OBJS}
)

add_custom_command(
        OUTPUT ${OUT_GBA}
        COMMAND ${OBJCOPY} -O binary --pad-to 0x8800000 ${OUT_ELF} ${OUT_GBA}
        WORKING_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}"
        DEPENDS ${OUT_ELF}
)

add_custom_target(beyblade ALL DEPENDS ${OUT_GBA})

file(GLOB_RECURSE SOURCES RELATIVE "${CMAKE_SOURCE_DIR}" "src/*.c" "src/*.h" "asm/*" "data/*" "ld_script.ld")
add_executable(beyblade_stub ${SOURCES})

#
#set(POKE_OBJS)
#
#
#set(POKE_TEMP_LD "${CMAKE_BINARY_DIR}/ld_script.ld")
#
#set(POKE_OUT_MAP "pokeruby.map")
#set(POKE_OUT_ELF "${CMAKE_BINARY_DIR}/pokeruby.elf")
#set(POKE_OUT_GBA "pokeruby.gba")
#
#
#set(GENERATED)
#
#function(poke_require_file PATH OUT_PATH OUT_STATUS)
#    set(_OUT_PATH "${CMAKE_BINARY_DIR}/${PATH}")
#
#    if (${PATH} IN_LIST GENERATED)
#        set(${OUT_PATH} "${_OUT_PATH}" PARENT_SCOPE)
#        set(${OUT_STATUS} "previous generated" PARENT_SCOPE)
#        return()
#    endif()
#
#    if(EXISTS "${CMAKE_SOURCE_DIR}/${PATH}")
#        set(${OUT_PATH} "${CMAKE_SOURCE_DIR}/${PATH}" PARENT_SCOPE)
#        set(${OUT_STATUS} "existing" PARENT_SCOPE)
#        return()
#    endif()
#
#    set(${OUT_PATH} "${_OUT_PATH}" PARENT_SCOPE)
#    set(${OUT_STATUS} "generated" PARENT_SCOPE)
#
#    set(TOOL NONE)
#    # Generate input file name
#    if((${PATH} MATCHES "\\.1bpp$") OR (${PATH} MATCHES "\\.4bpp$") OR (${PATH} MATCHES "\\.8bpp$"))
#        string(REGEX REPLACE "\\.(1|4|8)bpp$" ".png" FILE_IN_NAME "${PATH}")
#        set(TOOL GFX)
#    elseif(${PATH} MATCHES "\\.gbapal$")
#        string(REGEX REPLACE "\\.gbapal$" ".pal" FILE_IN_NAME "${PATH}")
#        set(TOOL GFX)
#    elseif((${PATH} MATCHES "\\.lz$") OR (${PATH} MATCHES "\\.rl$"))
#        string(REGEX REPLACE "\\.(lz|rl)$" "" FILE_IN_NAME "${PATH}")
#        set(TOOL GFX)
#    elseif(${PATH} MATCHES "\\.(pcm|bin)$")
#        string(REGEX REPLACE "\\.(pcm|bin)$" ".aif" FILE_IN_NAME "${PATH}")
#        set(TOOL AIF)
#    else()
#        message("!! Unknown non-existing file encountered: ${PATH}")
#        return()
#    endif()
#
#
#    poke_require_file(${FILE_IN_NAME} FILE_IN FILE_IN_STATUS)
#
#    if(${TOOL} STREQUAL GFX)
#        add_custom_command(
#                OUTPUT ${_OUT_PATH}
#                COMMAND ${GFX} ${FILE_IN} ${_OUT_PATH}
#                DEPENDS ${FILE_IN}
#        )
#    elseif(${TOOL} STREQUAL AIF)
#        add_custom_command(
#                OUTPUT ${_OUT_PATH}
#                COMMAND ${AIF} ${FILE_IN} ${_OUT_PATH}
#                DEPENDS ${FILE_IN}
#        )
#    endif()
#
#    list(APPEND GENERATED ${PATH})
#    set(GENERATED ${GENERATED} PARENT_SCOPE)
#
#endfunction()
#
#function(scaninc FILE OUT_DEPS)
#    set(DEPS)
#    execute_process(
#            COMMAND ${SCANINC} ${FILE}
#            OUTPUT_VARIABLE SCANINC_OUT
#            OUTPUT_STRIP_TRAILING_WHITESPACE
#    )
#
#    string(REPLACE "\n" ";" SCANINC_OUT "${SCANINC_OUT}")
#    foreach(LINE ${SCANINC_OUT})
#        if(LINE MATCHES ".(inc|s)\$")
#            scaninc(${CMAKE_SOURCE_DIR}/${LINE} SUB_DEPS)
#            foreach(SD ${SUB_DEPS})
#                list(APPEND DEPS ${SD})
#            endforeach()
#        else()
#            list(APPEND DEPS ${LINE})
#        endif()
#    endforeach()
#
#    set(${OUT_DEPS} ${DEPS} PARENT_SCOPE)
#endfunction()
#
#
#set(MISC_DEPS)
#
#include(cmake/Macros.cmake)
#include(cmake/Castform.cmake)
#include(cmake/Tilesets.cmake)
#include(cmake/Fonts.cmake)
#include(cmake/Generated.cmake)
#include(cmake/Misc.cmake)
#
#
#set(POKE_C_OBJS)
#file(GLOB C_SRCS RELATIVE "${CMAKE_SOURCE_DIR}" "src/*.c")
#foreach(C_SRC_IN_NAME ${C_SRCS})
#    # Generate output file name
#    string(REGEX REPLACE ".c\$" "" C_BASE_NAME "${C_SRC_IN_NAME}")
#    set(C_SRC_IN "${CMAKE_SOURCE_DIR}/${C_SRC_IN_NAME}")
#    set(C_OBJC_TEMP_1 "${CMAKE_CURRENT_BINARY_DIR}/${C_BASE_NAME}.temp-1.i")
#    set(C_OBJC_TEMP_2 "${CMAKE_CURRENT_BINARY_DIR}/${C_BASE_NAME}.temp-2.i")
#    set(C_OBJC_S "${CMAKE_CURRENT_BINARY_DIR}/${C_BASE_NAME}.s")
#    set(C_OBJC_S_DUP "${CMAKE_SOURCE_DIR}/generated/${C_BASE_NAME}.s")
#    set(C_OBJC_OUT "${CMAKE_CURRENT_BINARY_DIR}/${C_BASE_NAME}.o")
#
#    set(COMPILER ${CC1})
#    set(COMPILE_FLAGS ${C_FLAGS})
#
#    if (${C_SRC_IN_NAME} STREQUAL "src/libc.c")
#        set(COMPILER ${CC1_OLD})
#        set(COMPILE_FLAGS -O2)
#    elseif(${C_SRC_IN_NAME} STREQUAL "src/siirtc.c")
#        set(COMPILE_FLAGS -mthumb-interwork)
#    elseif((${C_SRC_IN_NAME} STREQUAL "src/agb_flash.c")
#            OR (${C_SRC_IN_NAME} STREQUAL "src/agb_flash_1m.c")
#            OR (${C_SRC_IN_NAME} STREQUAL "src/agb_flash_mx.c"))
#        set(COMPILE_FLAGS -O -mthumb-interwork)
#    elseif((${C_SRC_IN_NAME} STREQUAL "src/m4a_2.c") OR (${C_SRC_IN_NAME} STREQUAL "src/m4a_4.c"))
#        set(COMPILER ${CC1_OLD})
#    endif()
#
#    add_custom_command(
#            OUTPUT ${C_OBJC_OUT}
#            COMMAND ${CPP} ${CPP_FLAGS} -D ${VERSION} -D REVISION=${REVISION} ${C_SRC_IN} -o ${C_OBJC_TEMP_1}
#            COMMAND ${PREPROC} ${C_OBJC_TEMP_1} ${CMAKE_SOURCE_DIR}/charmap.txt > ${C_OBJC_TEMP_2}
#            COMMAND ${COMPILER} ${COMPILE_FLAGS} -o ${C_OBJC_S} ${C_OBJC_TEMP_2}
#            COMMAND printf "\".text\\n\\t.align\\t2,0\\n\"" >> ${C_OBJC_S}
#            COMMAND ${CMAKE_COMMAND} -E copy ${C_OBJC_S} ${C_OBJC_S_DUP}
#            COMMAND ${AS} ${AS_FLAGS} -o ${C_OBJC_OUT} ${C_OBJC_S}
#            DEPENDS ${C_SRC_IN} ${GEN_FONT_HEADERS} ${GEN_LINK_HEADERS}
#    )
#
#    # Finally remember the output file for dependencies
#    list(APPEND POKE_C_OBJS ${C_OBJC_OUT})
#endforeach()
#
#if(true)
#
#
#    set(POKE_DATA_ASM_OBJS)
#    file(GLOB POKE_DATA_ASM_SRCS RELATIVE "${CMAKE_SOURCE_DIR}" "data/*.s")
#    foreach(POKE_DATA_ASM_IN_NAME ${POKE_DATA_ASM_SRCS})
#        # Generate output file name
#        string(REGEX REPLACE ".s\$" ".o" POKE_DATA_ASM_OUT_NAME "${POKE_DATA_ASM_IN_NAME}")
#        set(POKE_DATA_ASM_OUT "${CMAKE_CURRENT_BINARY_DIR}/${POKE_DATA_ASM_OUT_NAME}")
#
#        # Generate intermediate file name
#        set(POKE_DATA_ASM_REMAPPED "${CMAKE_CURRENT_BINARY_DIR}/${POKE_DATA_ASM_IN_NAME}")
#
#        # Generate input file name
#        set(POKE_DATA_ASM_IN "${CMAKE_SOURCE_DIR}/${POKE_DATA_ASM_IN_NAME}")
#
#        set(DEPS)
#        message(STATUS "Looking up dependencies for ${POKE_DATA_ASM_IN_NAME}")
#        scaninc(${POKE_DATA_ASM_IN} RAW_DEPS)
#        foreach(DEP ${RAW_DEPS})
#            poke_require_file(${DEP} DEP_PATH DEP_STATUS)
#            list(APPEND DEPS ${DEP_PATH})
#            #message(STATUS "  - ${DEP}")
#        endforeach()
#
#        # Custom command to do the preprocessing
#        add_custom_command(
#                OUTPUT ${POKE_DATA_ASM_REMAPPED}
#                COMMAND ${PREPROC} ${POKE_DATA_ASM_IN} "${CMAKE_SOURCE_DIR}/charmap.txt" > ${POKE_DATA_ASM_REMAPPED}
#                WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
#                DEPENDS ${POKE_DATA_ASM_IN} ${DEPS}
#        )
#
#        # Custom command to do the processing
#        add_custom_command(
#                OUTPUT ${POKE_DATA_ASM_OUT}
#                COMMAND ${AS} ${AS_FLAGS} -I "${CMAKE_SOURCE_DIR}" --defsym ${VERSION}=1 --defsym REVISION=${REVISION} -o ${POKE_DATA_ASM_OUT} ${POKE_DATA_ASM_REMAPPED}
#                DEPENDS ${POKE_DATA_ASM_REMAPPED} ${DEPS}
#        )
#
#        # Finally remember the output file for dependencies
#        list(APPEND POKE_DATA_ASM_OBJS ${POKE_DATA_ASM_OUT})
#    endforeach()
#
#
#    set(POKE_SONG_OBJS)
#    file(GLOB POKE_SONG_SRCS RELATIVE "${CMAKE_SOURCE_DIR}" "sound/songs/*.s")
#    foreach(POKE_SONG_IN_NAME ${POKE_SONG_SRCS})
#
#        # Generate output file name
#        string(REGEX REPLACE ".s\$" ".o" POKE_SONG_OUT_NAME "${POKE_SONG_IN_NAME}")
#        set(POKE_SONG_OUT "${CMAKE_CURRENT_BINARY_DIR}/${POKE_SONG_OUT_NAME}")
#
#        # Generate input file name
#        set(POKE_SONG_IN "${CMAKE_SOURCE_DIR}/${POKE_SONG_IN_NAME}")
#
#        # Custom command to do the processing
#        add_custom_command(
#                OUTPUT ${POKE_SONG_OUT}
#                COMMAND ${AS} ${AS_FLAGS} -I "${CMAKE_SOURCE_DIR}/sound" -o ${POKE_SONG_OUT} ${POKE_SONG_IN}
#                DEPENDS ${POKE_SONG_IN}
#        )
#
#        # Finally remember the output file for dependencies
#        list(APPEND POKE_SONG_OBJS ${POKE_SONG_OUT})
#    endforeach()
#endif()
#
#set(POKE_OBJS ${POKE_C_OBJS} ${POKE_ASM_OBJS} ${POKE_DATA_ASM_OBJS} ${POKE_SONG_OBJS})
#
#set(POKE_SYM_BSS ${CMAKE_CURRENT_BINARY_DIR}/sym_bss.ld)
#add_custom_command(
#        OUTPUT ${POKE_SYM_BSS}
#        COMMAND ${RAMSCRGEN} .bss ${CMAKE_SOURCE_DIR}/sym_bss.txt > ${POKE_SYM_BSS}
#        DEPENDS ${CMAKE_SOURCE_DIR}/sym_bss.txt ${POKE_OBJS}
#)
#
#set(POKE_SYM_COMMON ${CMAKE_CURRENT_BINARY_DIR}/sym_common.ld)
#add_custom_command(
#        OUTPUT ${POKE_SYM_COMMON}
#        COMMAND ${RAMSCRGEN} COMMON ${CMAKE_SOURCE_DIR}/sym_common.txt -c ${CMAKE_CURRENT_BINARY_DIR}/src,${CMAKE_SOURCE_DIR}/common_syms > ${POKE_SYM_COMMON}
#        DEPENDS ${CMAKE_SOURCE_DIR}/sym_common.txt ${POKE_OBJS}
#)
#
#set(POKE_SYM_EWRAM ${CMAKE_CURRENT_BINARY_DIR}/sym_ewram.ld)
#add_custom_command(
#        OUTPUT ${POKE_SYM_EWRAM}
#        COMMAND ${RAMSCRGEN} ewram_data ${CMAKE_SOURCE_DIR}/sym_ewram.txt > ${POKE_SYM_EWRAM}
#        DEPENDS ${CMAKE_SOURCE_DIR}/sym_ewram.txt
#)
#
#add_custom_command(
#        OUTPUT ${POKE_TEMP_LD}
#        COMMAND sed -f ${CMAKE_SOURCE_DIR}/ld_script.sed ${CMAKE_SOURCE_DIR}/ld_script.ld > ${POKE_TEMP_LD}
#        DEPENDS ${CMAKE_SOURCE_DIR}/ld_script.ld ${POKE_SYM_BSS} ${POKE_SYM_COMMON} ${POKE_SYM_EWRAM}
#)
#
#set(LOCAL_LIBGCC ${CMAKE_BINARY_DIR}/tools/agbcc/lib/libgcc.a)
#add_custom_command(
#        OUTPUT ${LOCAL_LIBGCC}
#        COMMAND ${CMAKE_COMMAND} -E	copy ${LIBGCC} ${LOCAL_LIBGCC}
#        DEPENDS ${LIBGCC}
#)
#
## add_executable perhaps?
#add_custom_command(
#        OUTPUT ${POKE_OUT_ELF}
#        COMMAND ${LD} -T ${POKE_TEMP_LD} -T "${CMAKE_SOURCE_DIR}/shared_syms.txt" -Map ${POKE_OUT_MAP} -o ${POKE_OUT_ELF} "tools/agbcc/lib/libgcc.a"
#        DEPENDS ${POKE_TEMP_LD} ${POKE_OBJS} ${LOCAL_LIBGCC}
#        BYPRODUCTS ${POKE_OUT_MAP}
#)
#
#add_custom_command(
#        OUTPUT ${POKE_OUT_GBA}
#        COMMAND ${OBJCOPY} -O binary --gap-fill 0xFF --pad-to 0x9000000 ${POKE_OUT_ELF} ${POKE_OUT_GBA}
#        DEPENDS ${POKE_OUT_ELF}
#)
#
#add_custom_target(pokeruby ALL DEPENDS ${POKE_OUT_GBA})
