cmake_minimum_required(VERSION 3.9)
project(HelloWorld)

set(CMAKE_CXX_STANDARD 11)

find_package(Threads REQUIRED)

if(CMAKE_COMPILER_IS_GNUCXX)
    add_definitions(-Wall -ansi -Wno-deprecated -pthread)
endif()

option(COVERAGE "run the coverage analysis" OFF)
#-------------------
# set common include folder for module
#-------------------
set(COMMON_INCLUDES ${PROJECT_SOURCE_DIR}/include)
set(EXT_PROJECTS_DIR ${PROJECT_SOURCE_DIR}/external)
set(SOURCE_DIR ${PROJECT_SOURCE_DIR}/src)

add_subdirectory(${EXT_PROJECTS_DIR}/gtest)


#include dirs like this
#include_directories(${GTEST_INCLUDE_DIRS} ${COMMON_INCLUDES})
#include_directories( ${GTEST_INCLUDE_DIRS} ${GTEST_SOURCE_DIR})

#include( ${PROJECT_SOURCE_DIR}/cmake/GTest2.cmake )

include_directories(${SOURCE_DIR})


set(SourceFiles
        src/main.cpp
        src/Adder.cpp
        )

set(HeaderFiles
        src/Adder.h
        )

add_executable(HelloWorld 
                ${SourceFiles}
                ${HeaderFiles}
                )


##### TESTING ####

set(TestSrcFiles
        test/unit_dummy.cpp
        test/unit_addTest.cpp
        )

set(CppToTest
        src/Adder.cpp
        )


link_directories( ${GTEST_LIBS_DIR} )
include_directories( ${GTEST_INCLUDE_DIR})

add_executable(runDummyTest
        ${TestSrcFiles}
        ${CppToTest}
        )


target_link_libraries(runDummyTest gtest gtest_main ${CMAKE_THREAD_LIBS_INIT})

if(COVERAGE)
        include( ${PROJECT_SOURCE_DIR}/cmake/CodeCoverage.cmake )

        APPEND_COVERAGE_COMPILER_FLAGS()

        set(COVERAGE_EXCLUDES '${PROJECT_SOURCE_DIR}/external/*' '${PROJECT_SOURCE_DIR}/test/*' )

        SETUP_TARGET_FOR_COVERAGE(
                NAME coverage_runner
                EXECUTABLE runDummyTest -j ${PROCESSOR_COUNT}
                DEPENDENCIES runDummyTest
        )
endif(COVERAGE)