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

project("Python client library")

configure_file ("setup.py.in" "setup.py" @ONLY)

set(PY_SDIST_NAME "thrift-${PACKAGE_VERSION}.tar.gz")

add_custom_target(py_sdist ALL DEPENDS ${CMAKE_CURRENT_BINARY_DIR}/dist/${PY_SDIST_NAME})

add_custom_command(
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/dist/${PY_SDIST_NAME}
  WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
  COMMAND "${PYTHON_EXECUTABLE}" "setup.py" "build"
  COMMAND "${PYTHON_EXECUTABLE}" "setup.py" "build" "sdist")
