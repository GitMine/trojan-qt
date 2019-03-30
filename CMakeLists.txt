cmake_minimum_required(VERSION 3.7.2)
project(trojan-qt)

find_package(Threads REQUIRED)
find_package(Boost 1.54.0 REQUIRED COMPONENTS system program_options)
find_package(OpenSSL 1.0.2 REQUIRED)
find_package(Qt5 REQUIRED COMPONENTS Widgets)

if(MSVC)
    add_definitions(-DBOOST_DATE_TIME_NO_LIB)
endif()

add_subdirectory(src)
