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

include("${CMAKE_ROOT}/Modules/FindRuby.cmake")

option(with-ruby "Build the Ruby client library" ON)

find_package(Ruby REQUIRED)
find_program(RUBY_EXECUTABLE NAMES ruby)
find_program(BUNDLER_EXECUTABLE NAMES bundle)

if (NOT (RUBY_FOUND AND RUBY_EXECUTABLE_FOUND AND BUNDLER_EXECUTABLE_FOUND))
  SET(with-ruby OFF CACHE BOOL "Build the Ruby client library")
endif()

if (with-ruby)
  add_subdirectory(${PROJECT_SOURCE_DIR}/lib/rb)
endif()