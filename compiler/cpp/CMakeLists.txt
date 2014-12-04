# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements. See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership. The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License. You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied. See the License for the
# specific language governing permissions and limitations
# under the License.
#

project(compiler)

include("${CMAKE_ROOT}/Modules/FindFLEX.cmake")

find_package(FLEX REQUIRED)
find_package(BISON REQUIRED)

FLEX_TARGET(thriftl.cc src/thriftl.ll thriftl.cc)
BISON_TARGET(thrifty.cc src/thrifty.yy thrifty.cc COMPILE_FLAGS "-y --defines")

configure_file ("version.h.in" "version.h" @ONLY)

include_directories(${CMAKE_CURRENT_BINARY_DIR})
include_directories(src)
include_directories(src/generate)
include_directories(/src/parse)
include_directories(src/windows)

file(GLOB_RECURSE COMPILER_SRC src/*.cc)
file(GLOB_RECURSE COMPILER_HDR src/*.h)

set(GENERATED_SRC
  thriftl.cc
  thrifty.cc
  thrifty.hh
  version.h)

add_executable(compiler
  ${COMPILER_SRC}
  ${COMPILER_HDR}
  ${GENERATED_SRC})

set_target_properties(compiler PROPERTIES OUTPUT_NAME thrift)

install(TARGETS compiler RUNTIME DESTINATION bin)
