{ python_library_host }:
let

#  Copyright 2017 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Base library that should be extended/included to run as part of Tradefed
tradefed_python_lib = python_library_host {
    name = "tradefed_python_lib";
    srcs = [
        "tradefed_py/__init__.py"
        "tradefed_py/adb_handler.py"
        "tradefed_py/android_device.py"
        "tradefed_py/base_test.py"
        "tradefed_py/tf_main.py"
        "tradefed_py/tf_runner.py"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = false;
        };
    };
};

in { inherit tradefed_python_lib; }
