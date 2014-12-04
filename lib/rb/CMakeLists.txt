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

project("Ruby client library")

configure_file ("thrift.gemspec.in" "thrift.gemspec" @ONLY)

set(GEM_NAME "thrift-${PACKAGE_VERSION}.gem")

add_custom_target(ruby_gem ALL DEPENDS ${GEM_NAME})

add_custom_command(
  OUTPUT ${GEM_NAME}
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMAND "${BUNDLER_EXECUTABLE}" "install"
  COMMAND "${BUNDLER_EXECUTABLE}" "exec" "rake")

set_directory_properties(PROPERTIES ADDITIONAL_MAKE_CLEAN_FILES ${GEM_NAME})