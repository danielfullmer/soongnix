{ java_library_host, python_binary_host, python_defaults, python_library_host, python_test_host }:
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

atest_lib_default = python_defaults {
    name = "atest_lib_default";
    pkg_path = "atest";
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

#  Remove this defaults after python3 migration is finished.
atest_py2_default = python_defaults {
    name = "atest_py2_default";
    pkg_path = "atest";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = false;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

atest = python_binary_host {
    name = "atest";
    main = "atest.py";
    srcs = [
        "**/*.py"
    ];
    exclude_srcs = [
        "*_unittest.py"
        "*/*_unittest.py"
        "proto/*_pb2.py"
        "proto/__init__.py"
    ];
    libs = [
        "atest_proto"
    ];
    #  Make atest's built name to atest-dev
    stem = "atest-dev";
    defaults = ["atest_py2_default"];
};

atest_module_info = python_library_host {
    name = "atest_module_info";
    defaults = ["atest_lib_default"];
    srcs = [
        "module_info.py"
        "atest_utils.py"
        "constants.py"
        "constants_default.py"
    ];
};

#  Move asuite_default and asuite_metrics to //tools/asuite when atest is
#  running as a prebuilt.
asuite_default = python_defaults {
    name = "asuite_default";
    pkg_path = "asuite";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = false;
        };
        py3 = {
            enabled = true;
            embedded_launcher = false;
        };
    };
};

asuite_metrics = python_library_host {
    name = "asuite_metrics";
    defaults = ["asuite_default"];
    srcs = [
        "asuite_metrics.py"
    ];
};

atest_unittests = python_test_host {
    name = "atest_unittests";
    main = "atest_run_unittests.py";
    pkg_path = "atest";
    srcs = [
        "**/*.py"
    ];
    data = [
        "unittest_data/**/*"
        "unittest_data/**/.*"
    ];
    exclude_srcs = [
        "proto/*_pb2.py"
        "proto/__init__.py"
    ];
    libs = [
        "py-mock"
        "atest_proto"
    ];
    test_config = "atest_unittests.xml";
    test_suites = ["general-tests"];
    defaults = ["atest_py2_default"];
};

atest_integration_tests = python_test_host {
    name = "atest_integration_tests";
    main = "atest_integration_tests.py";
    pkg_path = "atest";
    srcs = [
        "atest_integration_tests.py"
    ];
    data = [
        "INTEGRATION_TESTS"
    ];
    test_config = "atest_integration_tests.xml";
    test_suites = ["general-tests"];
    defaults = ["atest_py2_default"];
};

atest_proto = python_library_host {
    name = "atest_proto";
    defaults = ["atest_py2_default"];
    srcs = [
        "proto/*.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

asuite_proto_java = java_library_host {
    name = "asuite_proto_java";
    srcs = [
        "proto/*.proto"
    ];
    libs = [
        "libprotobuf-java-full"
    ];
    proto = {
        canonical_path_from_root = false;
        include_dirs = ["external/protobuf/src"];
    };
};

asuite_proto = python_library_host {
    name = "asuite_proto";
    defaults = ["asuite_default"];
    srcs = [
        "proto/*.proto"
    ];
    proto = {
        canonical_path_from_root = false;
    };
};

asuite_cc_client = python_library_host {
    name = "asuite_cc_client";
    defaults = ["asuite_default"];
    srcs = [
        "atest_utils.py"
        "constants.py"
        "constants_default.py"
        "metrics/*.py"
    ];
    libs = [
        "asuite_proto"
        "asuite_metrics"
    ];
};

in { inherit asuite_cc_client asuite_default asuite_metrics asuite_proto asuite_proto_java atest atest_integration_tests atest_lib_default atest_module_info atest_proto atest_py2_default atest_unittests; }
