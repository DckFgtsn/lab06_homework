# CMake generated Testfile for 
# Source directory: /home/tony/DckFgtsn/workspace/tasks/lab06
# Build directory: /home/tony/DckFgtsn/workspace/tasks/lab06/_build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(check "/home/tony/DckFgtsn/workspace/tasks/lab06/_build/check")
set_tests_properties(check PROPERTIES  _BACKTRACE_TRIPLES "/home/tony/DckFgtsn/workspace/tasks/lab06/CMakeLists.txt;36;add_test;/home/tony/DckFgtsn/workspace/tasks/lab06/CMakeLists.txt;0;")
subdirs("formatter_ex_lib")
subdirs("solver_application")
subdirs("hello_world_application")
subdirs("solver_lib")
subdirs("tests")
subdirs("third-party/gtest")
