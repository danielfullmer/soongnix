{ cc_binary_host, cc_library, cc_test_host, genrule }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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
#

#  ==========================================================
#  Build the host executable: stats-log-api-gen
#  ==========================================================
stats-log-api-gen = cc_binary_host {
    name = "stats-log-api-gen";
    srcs = [
        "Collation.cpp"
        "java_writer.cpp"
        "java_writer_q.cpp"
        "main.cpp"
        "native_writer.cpp"
        "utils.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libstats_proto_host"
        "libprotobuf-cpp-full"
        "libbase"
    ];

    proto = {
        type = "full";
    };
};

#  ==========================================================
#  Build the host test executable: stats-log-api-gen
#  ==========================================================
stats-log-api-gen-test = cc_test_host {
    name = "stats-log-api-gen-test";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-g"
        "-DUNIT_TEST"
    ];
    srcs = [
        "Collation.cpp"
        "test_collation.cpp"
        "test.proto"
    ];

    static_libs = [
        "libgmock_host"
    ];

    shared_libs = [
        "libstats_proto_host"
        "libprotobuf-cpp-full"
    ];

    proto = {
        type = "full";
        include_dirs = [
            "external/protobuf/src"
        ];
    };
};

#  ==========================================================
#  Native library
#  ==========================================================
"statslog.h" = genrule {
    name = "statslog.h";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --header $(genDir)/statslog.h";
    out = [
        "statslog.h"
    ];
};

"statslog.cpp" = genrule {
    name = "statslog.cpp";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --cpp $(genDir)/statslog.cpp";
    out = [
        "statslog.cpp"
    ];
};

libstatslog = cc_library {
    name = "libstatslog";
    host_supported = true;
    generated_sources = [
        "statslog.cpp"
    ];
    generated_headers = [
        "statslog.h"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_generated_headers = [
        "statslog.h"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
    ];
    target = {
        android = {
            shared_libs = ["libstatssocket"];
        };
        host = {
            static_libs = ["libstatssocket"];
        };
    };
};

in { inherit "statslog.cpp" "statslog.h" libstatslog stats-log-api-gen stats-log-api-gen-test; }
