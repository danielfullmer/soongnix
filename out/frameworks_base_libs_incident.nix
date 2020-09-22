{ cc_defaults, cc_library_shared, cc_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

libincidentpriv_defaults = cc_defaults {
    name = "libincidentpriv_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
        "libprotobuf-cpp-lite"
    ];

    static_libs = [
        "libplatformprotos"
    ];

    whole_static_libs = [
        "libincidentcompanion"
    ];

    aidl = {
        include_dirs = [
            "frameworks/base/core/java"
            "frameworks/native/libs/incidentcompanion/binder"
        ];
        export_aidl_headers = true;
    };

    srcs = [
        ":libincident_aidl"
        "src/IncidentReportArgs.cpp"
    ];
};

libincidentpriv = cc_library_shared {
    name = "libincidentpriv";
    defaults = ["libincidentpriv_defaults"];
    export_include_dirs = ["include_priv"];
};

libincident = cc_library_shared {
    name = "libincident";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-missing-field-initializers"
        "-Wno-unused-variable"
        "-Wunused-parameter"
    ];

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
        "libincidentpriv"
    ];

    srcs = [
        "src/incident_report.cpp"
    ];

    export_include_dirs = ["include"];

    stubs = {
        symbol_file = "libincident.map.txt";
        versions = [
            "30"
        ];
    };
};

libincident_test = cc_test {
    name = "libincident_test";
    test_config = "AndroidTest.xml";
    defaults = ["libincidentpriv_defaults"];
    test_suites = [
        "device-tests"
        "mts"
    ];
    compile_multilib = "both";
    multilib = {
        lib64 = {
            suffix = "64";
        };
        lib32 = {
            suffix = "32";
        };
    };
    require_root = true;

    include_dirs = [
        "frameworks/base/libs/incident/include"
        "frameworks/base/libs/incident/include_priv"
    ];

    srcs = [
        "tests/IncidentReportArgs_test.cpp"
        "tests/IncidentReportRequest_test.cpp"
    ];

    shared_libs = [
        "libincident"
    ];

    static_libs = [
        "libgmock"
    ];
};

in { inherit libincident libincident_test libincidentpriv libincidentpriv_defaults; }
