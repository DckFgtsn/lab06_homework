cmake_minimum_required(VERSION 3.4)
project(formatter_ex)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(./formatter_lib)
add_subdirectory(./formatter_lib)

add_library(formatter_ex STATIC ./formatter_ex.cpp)

target_link_libraries(formatter_ex formatter)

install(TARGETS formatter_ex LIBRARY DESTINATION lib)
install(FILES formatter_ex.h DESTINATION include)
