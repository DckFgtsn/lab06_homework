cmake_minimum_required(VERSION 3.4)
project(equasion)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib ${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib)

#add_subdirectory(../formatter_ex_lib)

add_executable(equation equation.cpp)

target_link_libraries(equation formatter_ex solver)
