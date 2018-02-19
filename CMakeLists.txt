cmake_minimum_required(VERSION 3.9)
project(HelloWorld)

set(CMAKE_CXX_STANDARD 11)

find_package(Threads REQUIRED)

if(CMAKE_COMPILER_IS_GNUCXX)
    add_definitions(-Wall -ansi -Wno-deprecated -pthread)
endif()

#-------------------
# set common include folder for module
#-------------------
set(COMMON_INCLUDES ${PROJECT_SOURCE_DIR}/include)
set(EXT_PROJECTS_DIR ${PROJECT_SOURCE_DIR}/external)

add_subdirectory(${EXT_PROJECTS_DIR}/gtest)


#include dirs like this
#include_directories(${GTEST_INCLUDE_DIRS} ${COMMON_INCLUDES})
#include_directories( ${GTEST_INCLUDE_DIRS} ${GTEST_SOURCE_DIR})

#include( ${PROJECT_SOURCE_DIR}/cmake/GTest2.cmake )


set(SourceFiles "src/main.cpp"
        )

add_executable(HelloWorld ${SourceFiles})


##### TESTING ####

set(TestSrcFiles test/unit_dummy.cpp)

include( ${PROJECT_SOURCE_DIR}/cmake/CodeCoverage.cmake )
link_directories( ${GTEST_LIBS_DIR} )
include_directories( ${GTEST_INCLUDE_DIR})

add_executable(runDummyTest
        ${TestSrcFiles}
        )


target_link_libraries(runDummyTest gtest gtest_main ${CMAKE_THREAD_LIBS_INIT})

APPEND_COVERAGE_COMPILER_FLAGS()

set(COVERAGE_EXCLUDES '${PROJECT_SOURCE_DIR}/external/*' '${PROJECT_SOURCE_DIR}/test/*' )

SETUP_TARGET_FOR_COVERAGE(
        NAME coverage_runner
        EXECUTABLE runDummyTest -j ${PROCESSOR_COUNT}
        DEPENDENCIES runDummyTest
)
