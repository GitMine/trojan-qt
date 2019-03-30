cmake_minimum_required(VERSION 3.7.2)
cmake_policy(VERSION 3.12.0)
project(trojan-qt)

# taken from https://stackoverflow.com/a/27599484
macro(find_framework fwname target)
    find_library(FRAMEWORK_${fwname}
    NAMES ${fwname}
    PATHS ${CMAKE_OSX_SYSROOT}/System/Library
    PATH_SUFFIXES Frameworks
    NO_DEFAULT_PATH)
    if( ${FRAMEWORK_${fwname}} STREQUAL FRAMEWORK_${fwname}-NOTFOUND)
        message(ERROR "Framework ${fwname} not found")
    else()
        target_link_libraries(${target} PRIVATE "${FRAMEWORK_${fwname}}")
        target_include_directories(${target} PRIVATE "${FRAMEWORK_${fwname}}/Headers")
        message(STATUS "Framework ${fwname} found at ${FRAMEWORK_${fwname}}")
    endif()
endmacro(find_framework)

if(WIN32)
    add_definitions(-D_WIN32_WINNT=0x0600 -DWINVER=0x0600)
    add_definitions(-DWIN32_LEAN_AND_MEAN)
    # add_definitions(-D_UNICODE -DUNICODE)
endif()

find_package(Threads REQUIRED)
find_package(Boost 1.54.0 REQUIRED COMPONENTS system program_options)
find_package(OpenSSL 1.0.2 REQUIRED)
find_package(Qt5 REQUIRED COMPONENTS Widgets)

if(MSVC)
    add_definitions(-DBOOST_DATE_TIME_NO_LIB)
endif()

add_subdirectory(src)
