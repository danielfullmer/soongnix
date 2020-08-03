{ python_binary_host, python_defaults, python_library_host, python_test_host }:
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

aidegen_default = python_defaults {
    name = "aidegen_default";
    pkg_path = "aidegen";
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

aidegen = python_binary_host {
    name = "aidegen";
    #  Make aidegen's built name to aidegen-dev
    stem = "aidegen-dev";
    defaults = ["aidegen_default"];
    main = "aidegen_main.py";
    srcs = [
        "**/*.py"
    ];
    data = [
        "templates/**/*"
    ];
    libs = [
        "atest_module_info"
        "asuite_cc_client"
    ];
    dist = {
        targets = ["droidcore"];
    };
};

aidegen_lib = python_library_host {
    name = "aidegen_lib";
    defaults = ["aidegen_default"];
    srcs = [
        "aidegen_main.py"
        "constant.py"
        "unittest_constants.py"
        "lib/*.py"
    ];
};

aidegen_unittests = python_test_host {
    name = "aidegen_unittests";
    main = "aidegen_run_unittests.py";
    pkg_path = "aidegen";
    srcs = [
        "**/*.py"
    ];
    data = [
        "templates/**/*"
        "test_data/**/*"
    ];
    libs = [
        "py-mock"
        "asuite_cc_client"
    ];
    test_config = "aidegen_unittests.xml";
    test_suites = ["general-tests"];
    defaults = ["aidegen_default"];
};

in { inherit aidegen aidegen_default aidegen_lib aidegen_unittests; }
