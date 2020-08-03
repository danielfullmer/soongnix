{ python_binary_host, python_defaults }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

aidegen_functional_test_default = python_defaults {
    name = "aidegen_functional_test_default";
    pkg_path = "aidegen_functional_test";
    version = {
        py2 = {
            enabled = false;
            embedded_launcher = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = false;
        };
    };
};

aidegen_functional_test = python_binary_host {
    name = "aidegen_functional_test";
    defaults = ["aidegen_functional_test_default"];
    main = "aidegen_functional_test_main.py";
    srcs = [
        "aidegen_functional_test_main.py"
    ];
    libs = [
        "aidegen_lib"
        "atest_module_info"
    ];
};

in { inherit aidegen_functional_test aidegen_functional_test_default; }
