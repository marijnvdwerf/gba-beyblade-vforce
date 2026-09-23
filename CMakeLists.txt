cmake_minimum_required(VERSION 3.21)

project(beybladevforce LANGUAGES C ASM)

if(CMAKE_BINARY_DIR STREQUAL CMAKE_SOURCE_DIR)
    message(FATAL_ERROR "Building in-source is not supported. Remove CMakeCache.txt and use a separate build directory.")
endif()

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# The three ROMs are two properties: region (src/version.h REGION_*) and
# whether it is the debug build. The name only selects the build tree + SHA.
set(BVV_VERSION_TABLE
    # name|sha1|validated|region|debug
    "us|cd527c8c24e20e33913fc45199e64b3e6138a6e5|TRUE|US|0"
    "eu|6d20a586e7bb52b4a9352bbeaec9d7be65e93369|TRUE|EU|0"
    "debug|9210a12ce01fefbf7994af2a8d51351ed82d7253|FALSE|EU|1")

set(GAME_VERSION "" CACHE STRING "ROM to build (us, eu, debug)")
set_property(CACHE GAME_VERSION PROPERTY STRINGS us eu debug)

set(_game_version_found FALSE)
foreach(_version_row IN LISTS BVV_VERSION_TABLE)
    string(REPLACE "|" ";" _version_fields "${_version_row}")
    list(GET _version_fields 0 _version_name)
    if(GAME_VERSION STREQUAL _version_name)
        list(GET _version_fields 1 GAME_SHA1)
        list(GET _version_fields 2 GAME_VERSION_VALIDATED)
        list(GET _version_fields 3 GAME_REGION)
        list(GET _version_fields 4 GAME_DEBUG)
        # as --defsym takes integers only; keep in sync with src/version.h.
        if(GAME_REGION STREQUAL "US")
            set(GAME_REGION_ID 0)
        elseif(GAME_REGION STREQUAL "EU")
            set(GAME_REGION_ID 1)
        else()
            message(FATAL_ERROR "Unknown region '${GAME_REGION}' in BVV_VERSION_TABLE")
        endif()
        set(_game_version_found TRUE)
        break()
    endif()
endforeach()

if(NOT _game_version_found)
    message(FATAL_ERROR
        "GAME_VERSION must be one of: us, eu, debug (got '${GAME_VERSION}')")
endif()

add_library(agb INTERFACE)
target_include_directories(agb INTERFACE "${CMAKE_SOURCE_DIR}/lib/agb/include")

add_executable(rom
    asm/arm1.s
    src/iwram.c
    asm/audio0.s
    asm/audio1.s
    asm/audio2.s
    asm/crt0.s
    asm/data1.s
    asm/data10.s
    asm/data11.s
    asm/data12.s
    asm/data3.s
    asm/data5.s
    asm/data6.s
    asm/data7.s
    asm/data8.s
    asm/data9.s
    asm/dataA.s
    asm/dataB.s
    asm/dataC.s
    data/1-1/geometry.s
    data/1-1/metadata.s
    data/1-2/geometry.s
    data/1-2/metadata.s
    data/1-3/geometry.s
    data/1-3/metadata.s
    data/1-4/geometry.s
    data/1-4/metadata.s
    data/1-5/geometry.s
    data/1-5/metadata.s
    data/1-6/geometry.s
    data/1-6/metadata.s
    data/1-7/geometry.s
    data/1-7/metadata.s
    data/1-8/geometry.s
    data/1-8/metadata.s
    data/2-1/geometry.s
    data/2-1/metadata.s
    data/2-2/geometry.s
    data/2-2/metadata.s
    data/2-3/geometry.s
    data/2-3/metadata.s
    data/2-4/geometry.s
    data/2-4/metadata.s
    data/2-5/geometry.s
    data/2-5/metadata.s
    data/2-6/geometry.s
    data/2-6/metadata.s
    data/2-7/geometry.s
    data/2-7/metadata.s
    data/2-8/geometry.s
    data/2-8/metadata.s
    data/3-1/geometry.s
    data/3-1/metadata.s
    data/3-2/geometry.s
    data/3-2/metadata.s
    data/3-3/geometry.s
    data/3-3/metadata.s
    data/3-4/geometry.s
    data/3-4/metadata.s
    data/3-5/geometry.s
    data/3-5/metadata.s
    data/3-6/geometry.s
    data/3-6/metadata.s
    data/3-7/geometry.s
    data/3-7/metadata.s
    data/3-8/geometry.s
    data/3-8/metadata.s
    data/4-1/geometry.s
    data/4-1/metadata.s
    data/4-2/geometry.s
    data/4-2/metadata.s
    data/4-3/geometry.s
    data/4-3/metadata.s
    data/4-4/geometry.s
    data/4-4/metadata.s
    data/4-5/geometry.s
    data/4-5/metadata.s
    data/4-6/geometry.s
    data/4-6/metadata.s
    data/4-7/geometry.s
    data/4-7/metadata.s
    data/4-8/geometry.s
    data/4-8/metadata.s
    data/5-1/geometry.s
    data/5-1/metadata.s
    data/5-2/geometry.s
    data/5-2/metadata.s
    data/5-3/geometry.s
    data/5-3/metadata.s
    data/5-4/geometry.s
    data/5-4/metadata.s
    data/5-5/geometry.s
    data/5-5/metadata.s
    data/5-6/geometry.s
    data/5-6/metadata.s
    data/5-7/geometry.s
    data/5-7/metadata.s
    data/5-8/geometry.s
    data/5-8/metadata.s
    data/6-1/geometry.s
    data/6-1/metadata.s
    data/6-2/geometry.s
    data/6-2/metadata.s
    data/6-3/geometry.s
    data/6-3/metadata.s
    data/6-4/geometry.s
    data/6-4/metadata.s
    data/6-5/geometry.s
    data/6-5/metadata.s
    data/6-6/geometry.s
    data/6-6/metadata.s
    data/6-7/geometry.s
    data/6-7/metadata.s
    data/6-8/geometry.s
    data/6-8/metadata.s
    data/7-1/geometry.s
    data/7-1/metadata.s
    data/7-2/geometry.s
    data/7-2/metadata.s
    data/7-3/geometry.s
    data/7-3/metadata.s
    data/7-4/geometry.s
    data/7-4/metadata.s
    data/7-5/geometry.s
    data/7-5/metadata.s
    data/7-6/geometry.s
    data/7-6/metadata.s
    data/7-7/geometry.s
    data/7-7/metadata.s
    data/7-8/geometry.s
    data/7-8/metadata.s
    src/actor.c
    src/actorheap.c
    src/ai.c
    src/render.c
    src/anim.c
    src/animevent.c
    src/background.c
    src/backup.c
    src/battery.c
    src/beyblade.c
    src/bios.c
    src/camera.c
    src/code_8057944.c
    src/collectable.c
    src/collection.c
    src/collision.c
    src/credits.c
    src/debug.c
    src/dialogue.c
    src/display.c
    src/effects.c
    src/envactor.c
    src/event.c
    src/festate.c
    src/frontend.c
    src/gameinit.c
    src/gameloop.c
    src/gamestate.c
    src/geometry.c
    src/hud.c
    src/iconmenu.c
    src/irq.c
    src/keystate.c
    src/language.c
    src/layer.c
    src/levelhud.c
    src/levelrow.c
    src/levelselect.c
    src/libc.c
    src/main.c
    src/math.c
    src/memory.c
    src/menu.c
    src/menuobject.c
    src/motion.c
    src/multiplayer.c
    src/music.c
    src/packet.c
    src/palette.c
    src/particle.c
    src/profile.c
    src/projectile.c
    src/ram.c
    src/ram2.c
    src/ram3.c
    src/results.c
    src/rider.c
    src/riderphysics.c
    src/riderstate.c
    src/sound.c
    src/sprite.c
    src/spritestring.c
    src/spritestringactors.c
    src/spritetext.c
    src/system.c
    src/teletype.c
    src/text.c
    src/trail.c
    src/transition.c
    src/tutorial.c
    src/strings0.c
    src/strings_86fcf20.c
    src/strings_86fcf98.c
    src/strings_86fd2e0.c
    src/strings_8723428.c
    src/strings_8727048.c
    src/strings_87270f8.c
    src/strings_87294ac.c
    src/strings_8729894.c
    src/strings_872af0c.c
    src/strings_875566c.c
    src/strings5.c
    src/strings6.c
    src/strings_8756870.c
)

target_link_libraries(rom PRIVATE agb)

# Compiler flags of the original build (agbcc via tools/agbcc).
target_compile_definitions(rom PRIVATE
    "$<$<COMPILE_LANGUAGE:C>:REGION=REGION_${GAME_REGION}>"
    "$<$<COMPILE_LANGUAGE:C>:DEBUG=${GAME_DEBUG}>")
target_compile_options(rom PRIVATE
    "$<$<COMPILE_LANGUAGE:C>:-I${AGBCC}/include;-mthumb-interwork;-Wimplicit;-Wparentheses;-Wunused;-Werror;-O2;-fhex-asm;-g>"
    "$<$<COMPILE_LANGUAGE:ASM>:-mcpu=arm7tdmi;-I${CMAKE_SOURCE_DIR}>"
    # as has no preprocessor: REGION/DEBUG reach .s files as symbols (usable
    # in .if), mirroring src/version.h. Single tokens: CMake would
    # de-duplicate repeated "--defsym" entries.
    "$<$<COMPILE_LANGUAGE:ASM>:--defsym=REGION_US=0;--defsym=REGION_EU=1>"
    "$<$<COMPILE_LANGUAGE:ASM>:--defsym=REGION=${GAME_REGION_ID};--defsym=DEBUG=${GAME_DEBUG}>")
set_source_files_properties(src/libc.c PROPERTIES
    COMPILE_OPTIONS "--reset-flags;-O2")
# Nintendo's prebuilt EEPROM_V122 library: matches only with pret agbcc -O1.
set_source_files_properties(src/backup.c PROPERTIES
    COMPILE_OPTIONS "--cc1=${AGBCC}/bin/agbcc;-O1;-fprologue-bugfix")
set_source_files_properties(src/iwram.c PROPERTIES
    COMPILE_OPTIONS "-marm")

# Inputs for the generic GBA rom module (cmake/gba.cmake).
set(ROM_LINKER_SCRIPT "${CMAKE_SOURCE_DIR}/ld_script.ld")
set(ROM_LINKER_SCRIPT_DEFINES
    "-I${CMAKE_SOURCE_DIR}/src"
    "-DREGION=REGION_${GAME_REGION}"
    "-DDEBUG=${GAME_DEBUG}")
set(ROM_LINKER_SCRIPT_DEPENDS "${CMAKE_SOURCE_DIR}/src/version.h")
set(ROM_VERSION "${GAME_VERSION}")
set(ROM_SHA1 "${GAME_SHA1}")
set(ROM_VALIDATED "${GAME_VERSION_VALIDATED}")
set(ROM_VERSIONS us eu debug)

include(cmake/gba.cmake OPTIONAL)
