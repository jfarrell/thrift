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

cmake_minimum_required(VERSION 2.8 FATAL_ERROR)
project("Apache Thrift")

set(VERSION "0.9.3")

set(PACKAGE_BUGREPORT "https://issues.apache.org/jira/browse/THRIFT")
set(PACKAGE_NAME ${PACKAGE})
set(PACKAGE_VERSION ${VERSION})
set(PACKAGE_STRING ${PACKAGE})

# cmake module inclusion
list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/build/cmake/lib;${PROJECT_SOURCE_DIR}/build/cmake)

include(ThriftDefaults)

# Compiler
option(WITH_COMPILER "Build the compiler" ON)

if(WITH_COMPILER)
  add_subdirectory(${PROJECT_SOURCE_DIR}/compiler/cpp)
endif()

# Client libraries
include(ThriftClientLibPython)
include(ThriftClientLibRuby)
