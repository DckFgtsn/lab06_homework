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
add_subdirectory(./tests)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib
		${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)

if(BUILD_TESTS)
  enable_testing()
  add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/third-party/gtest)
  file(GLOB ${PROJECT_NAME}_TEST_SOURCES tests/*.cpp)
  add_executable(check ${${PROJECT_NAME}_TEST_SOURCES})
  target_link_libraries(check formatter_ex solver gtest_main)
  add_test(NAME check COMMAND check)
endif()
