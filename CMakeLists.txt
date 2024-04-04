cmake_minimum_required(VERSION 3.4)
project(lab03)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#include_directories(./formatter_ex_lib)

add_subdirectory(./formatter_ex_lib)
add_subdirectory(./solver_application)
add_subdirectory(./hello_world_application)
add_subdirectory(./solver_lib)

#add_executable(hello_world ./hello_world_application/hello_world.cpp)

#target_link_libraries(hello_world formatter_ex)
