cmake_minimum_required(VERSION 3.2.2)

message("FILE: ${FILE}")

file(SHA1 ${FILE} ACTUAL_CHECKSUM)

if (NOT ${ACTUAL_CHECKSUM} STREQUAL ${CHECKSUM})
    message(FATAL_ERROR "No match")
endif ()