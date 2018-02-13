cmake_minimum_required(VERSION 3.9)
project(HelloWorld)

set(CMAKE_CXX_STANDARD 11)

set(SourceFiles "main.cpp"
        )

add_executable(HelloWorld ${SourceFiles})