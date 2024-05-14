#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "solver" for configuration ""
set_property(TARGET solver APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(solver PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib1/libsolver.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS solver )
list(APPEND _IMPORT_CHECK_FILES_FOR_solver "${_IMPORT_PREFIX}/lib1/libsolver.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
