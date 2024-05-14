## Homework
1. По аналогии с предыдущими проектами прописал файлы CMakeLists.txt
2. добавил:
```sh
include(CPackConfig.cmake)
```
в основной CMakeLists.txt
3. В остальных CMakeLists.txt добавил:
# solver lib
```sh
install(TARGETS solver LIBRARY DESTINATION lib)
install(FILES solver.h DESTINATION include)
```
# formatter_ex_lib
```sh
install(TARGETS formatter_ex LIBRARY DESTINATION lib)
install(FILES formatter_ex.h DESTINATION include)
```
# formatter_lib
```sh
install(TARGETS formatter LIBRARY DESTINATION lib)
install(FILES formatter.h DESTINATION include)
```
# solver_application
```sh
install(TARGETS equation RUNTIME DESTINATION bin)
```
4. Добавил файл ChangeLog.md с таким содержанием:
```sh
* ${DATE} ${GITHUB_USERNAME} <${GITHUB_EMAIL}> 0.1.0.0
- Initial RPM release
```
5. Добавил файл CPackConfig.cmake с таким содержанием:
```sh
include(InstallRequiredSystemLibraries)
set(CPACK_PACKAGE_VERSION \${PRINT_VERSION})
set(CPACK_RPM_PACKAGE_NAME "solver-devel")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_GROUP "solver")
set(CPACK_RPM_CHANGELOG_FILE ${CMAKE_CURRENT_SOURCE_DIR}/ChangeLog.md)
set(CPACK_RPM_PACKAGE_RELEASE 1)
set(CPACK_SOURCE_GENERATOR "TGZ")
include(CPack)
```
6. В yml файле в конце добавил:
```sh
    - name: Archivation

      run: |
        cd ${{ steps.strings.outputs.build-output-dir }} && cpack -G "TGZ"
```
