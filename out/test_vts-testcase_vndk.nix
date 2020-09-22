{ python_defaults, python_library_host, python_test_host }:
let

#  Copyright 2020 Google Inc. All rights reserved.
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

vts_vndk_utils = python_library_host {
    name = "vts_vndk_utils";
    pkg_path = "vts/testcases/vndk";
    srcs = [
        "utils.py"
        "golden/vndk_data.py"
    ];
    data = [
        ":vndk_lib_lists"
        ":vndk_lib_extra_lists"
    ];
    version = {
        py2 = {
            enabled = true;
        };
        py3 = {
            enabled = true;
        };
    };
};

vts_vndk_default = python_defaults {
    name = "vts_vndk_default";
    libs = [
        "vndk_utils"
        "vts_vndk_utils"
    ];
    version = {
        py2 = {
            enabled = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = true;
        };
    };
};

vts_vndk_abi_test = python_test_host {
    name = "vts_vndk_abi_test";
    defaults = ["vts_vndk_default"];
    main = "abi/vts_vndk_abi_test.py";
    srcs = [
        "abi/vts_vndk_abi_test.py"
    ];
    data = [
        ":vts_vndk_abi_dump_zip"
    ];
    test_suites = [
        "vts"
    ];
    test_config = "abi/vts_vndk_abi_test.xml";
};

vts_vndk_dependency_test = python_test_host {
    name = "vts_vndk_dependency_test";
    defaults = ["vts_vndk_default"];
    main = "dependency/vts_vndk_dependency_test.py";
    srcs = [
        "dependency/vts_vndk_dependency_test.py"
    ];
    test_suites = [
        "vts"
    ];
    test_config = "dependency/vts_vndk_dependency_test.xml";
};

vts_vndk_files_test = python_test_host {
    name = "vts_vndk_files_test";
    defaults = ["vts_vndk_default"];
    main = "files/vts_vndk_files_test.py";
    srcs = [
        "files/vts_vndk_files_test.py"
    ];
    test_suites = [
        "vts"
    ];
    test_config = "files/vts_vndk_files_test.xml";
};

in { inherit vts_vndk_abi_test vts_vndk_default vts_vndk_dependency_test vts_vndk_files_test vts_vndk_utils; }
