{ cc_defaults, cc_library_static, cc_test, cc_test_host, prebuilt_etc }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

"cgroups.json" = prebuilt_etc {
    name = "cgroups.json";
    src = "cgroups.json";
};

"cgroups.recovery.json" = prebuilt_etc {
    name = "cgroups.recovery.json";
    filename = "cgroups.json";
    recovery = true;
    src = "cgroups.recovery.json";
};

"task_profiles.json" = prebuilt_etc {
    name = "task_profiles.json";
    src = "task_profiles.json";
};

libprocessgroup_test_defaults = cc_defaults {
    name = "libprocessgroup_test_defaults";
    cflags = [
        "-Wall"
        "-Werror"

        #  Needed for headers from libprotobuf.
        "-Wno-unused-parameter"
    ];
};

libprocessgroup_proto = cc_library_static {
    name = "libprocessgroup_proto";
    host_supported = true;
    defaults = ["libprocessgroup_test_defaults"];
    srcs = [
        "cgroups.proto"
        "task_profiles.proto"
    ];
    proto = {
        type = "full";
        export_proto_headers = true;
    };
};

libprocessgroup_proto_test = cc_test_host {
    name = "libprocessgroup_proto_test";
    defaults = ["libprocessgroup_test_defaults"];
    srcs = [
        "test.cpp"
    ];
    static_libs = [
        "libbase"
        "libgmock"
        "liblog"
        "libjsoncpp"
        "libjsonpbverify"
        "libjsonpbparse"
        "libprocessgroup_proto"
    ];
    shared_libs = [
        "libprotobuf-cpp-full"
    ];
    data = [
        "cgroups.json"
        "cgroups.recovery.json"
        "task_profiles.json"
    ];
    test_suites = [
        "general-tests"
    ];
};

vts_processgroup_validate_test = cc_test {
    name = "vts_processgroup_validate_test";
    defaults = ["libprocessgroup_test_defaults"];
    srcs = [
        "test_vendor.cpp"
    ];
    static_libs = [
        "libgmock"
        "libjsonpbverify"
        "libjsonpbparse"
        "libprocessgroup_proto"
    ];
    shared_libs = [
        "libbase"
        "liblog"
        "libjsoncpp"
        "libprotobuf-cpp-full"
    ];
    target = {
        android = {
            test_config = "vts_processgroup_validate_test.xml";
        };
    };
};

in { inherit "cgroups.json" "cgroups.recovery.json" "task_profiles.json" libprocessgroup_proto libprocessgroup_proto_test libprocessgroup_test_defaults vts_processgroup_validate_test; }
