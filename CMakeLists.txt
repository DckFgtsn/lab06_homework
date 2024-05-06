cmake_minimum_required(VERSION 3.4)
project(lab06)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CompilerFlags
        CMAKE_CXX_FLAGS
        CMAKE_CXX_FLAGS_DEBUG
        CMAKE_CXX_FLAGS_RELEASE
        CMAKE_C_FLAGS
        CMAKE_C_FLAGS_DEBUG
        CMAKE_C_FLAGS_RELEASE
        )
foreach(CompilerFlag ${CompilerFlags})
  string(REPLACE "/MD" "/MT" ${CompilerFlag} "${${CompilerFlag}}")
endforeach()

option(BUILD_TESTS "Building tests" ON)
option(COVERAGE "Coverage" ON)

add_subdirectory(./formatter_ex_lib)
add_subdirectory(./solver_application)
add_subdirectory(./hello_world_application)
add_subdirectory(./solver_lib)
