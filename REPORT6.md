## Homework
1. В папке banking создадим CMakeLists.txt с таким наполнением:
```sh
cmake_minimum_required(VERSION 3.4)
project(banking)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_library(Account STATIC Account.cpp)
add_library(Transaction STATIC Transaction.cpp)
```
2. Создать папку tests, в ней файлы test1.cpp и CMakeLists.txt
3. Файл test1.cpp выглядитт так:
```sh
#include <gtest/gtest.h>

#include "Transaction.h"
#include "Account.h"

TEST(Transaction, gee_test) {
    Account John(228, 121);
    Account James(1337,102);
    Transaction transaction;
    EXPECT_TRUE(transaction.Make(John, James, 100));
}


TEST(Transaction, fee_check) {
    Account John(11, 100);
    Account Peter(12, 0);
    Transaction transaction;
    EXPECT_FALSE(transaction.Make(John, Peter, 100));
}

TEST(Transaction, id_check) {
    Account John(11, 100);
    Account Peter(11, 100);
    Transaction transaction;

    try {
        transaction.Make(John, Peter, 100);
        FAIL() << "expected error" << std::endl;
    } catch(std::logic_error& err) {
        EXPECT_EQ(err.what(), std::string("invalid action"));
    } catch(...) {
        FAIL() << "expected logic error" << std::endl;
    }
}

TEST(Transaction, sum_check) {
    Account John(1, 1000);
    Account Peter(12, 100);
    Transaction transaction;

    try {
        transaction.Make(John, Peter, -100);
        FAIL() << "expected error" << std::endl;
    } catch(std::invalid_argument& arg) {

        EXPECT_EQ(arg.what(), std::string("sum can't be negative"));
    } catch(...) {
        FAIL() << "expected argument error" << std::endl;
    }
}



TEST(Transaction, change_balance) {
    Account John(173, 1000);
    Account Peter(12, 100);
    try {
        John.ChangeBalance(30);
        FAIL() << "expected error" << std::endl;
    } catch(std::runtime_error& time) {
        EXPECT_EQ(time.what(), std::string("at first lock the account"));
    } catch(...) {
        FAIL() << "expected time error" << std::endl;
    }
}
```
4. Файл CmakeLists.txt выглядит так:
```sh
cmake_minimum_required(VERSION 3.4)
project(test)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/../banking)
```
5. Создаём папку .githib/workflows и файл cmake-multi-platform.yml с данным наполнением:
```sh
name: CMake on multiple platforms

on:
  push:
    branches: [ "master" ]
  pull_request:
    branches: [ "master" ]

jobs:
  build:
    runs-on: ${{ matrix.os }}

    strategy:

      fail-fast: false

      matrix:
        os: [ubuntu-latest, windows-latest]
        build_type: [Release]
        c_compiler: [gcc, clang, cl]
        include:
          - os: windows-latest
            c_compiler: cl
            cpp_compiler: cl
          - os: ubuntu-latest
            c_compiler: gcc
            cpp_compiler: g++
          - os: ubuntu-latest
            c_compiler: clang
            cpp_compiler: clang++
        exclude:
          - os: windows-latest
            c_compiler: gcc
          - os: windows-latest
            c_compiler: clang
          - os: ubuntu-latest
            c_compiler: cl

    steps:
    - uses: actions/checkout@v3

    - name: Set reusable strings

      id: strings
      shell: bash
      run: |
        echo "build-output-dir=${{ github.workspace }}/build" >> "$GITHUB_OUTPUT"

    - name: Configure CMake

      run: |
        git submodule update --init --recursive
        echo cmake -B ${{ steps.strings.outputs.build-output-dir }} -DCMAKE_CXX_COMPILER=${{ matrix.cpp_compiler }} -DCMAKE_C_COMPILER=${{ matrix.c_compiler }} -DCMAKE_BUILD_TYPE=${{ matrix.build_type }} -S ${{ github.workspace }}
        cmake -B ${{ steps.strings.outputs.build-output-dir }} -DCMAKE_CXX_COMPILER=${{ matrix.cpp_compiler }} -DCMAKE_C_COMPILER=${{ matrix.c_compiler }} -DCMAKE_BUILD_TYPE=${{ matrix.build_type }} -S ${{ github.workspace }}
    - name: Build

      run: |
        cmake --build ${{ steps.strings.outputs.build-output-dir }} --config ${{ matrix.build_type }}

    - name: Test
      working-directory: ${{ steps.strings.outputs.build-output-dir }}

      run: ctest --build-config ${{ matrix.build_type }}
```
6. компилируем, билдим и тестим.
