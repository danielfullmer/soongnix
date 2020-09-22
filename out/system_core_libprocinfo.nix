{ cc_benchmark, cc_defaults, cc_library, cc_test }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

libprocinfo_defaults = cc_defaults {
    name = "libprocinfo_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

libprocinfo = cc_library {
    name = "libprocinfo";
    defaults = ["libprocinfo_defaults"];
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    recovery_available = true;
    vndk = {
        enabled = true;
    };
    host_supported = true;
    srcs = [
        "process.cpp"
        "process_map.cpp"
    ];

    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    shared_libs = ["libbase"];
    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = false;
        };
    };

    apex_available = [
        "//apex_available:platform"
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  Tests
#  ------------------------------------------------------------------------------
libprocinfo_test = cc_test {
    name = "libprocinfo_test";
    defaults = ["libprocinfo_defaults"];
    host_supported = true;
    isolated = true;
    srcs = [
        "process_test.cpp"
        "process_map_test.cpp"
    ];
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = false;
        };
    };

    shared_libs = [
        "libbase"
        "libprocinfo"
    ];

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    data = [
        "testdata/maps"
    ];

    test_suites = ["device-tests"];
};

libprocinfo_benchmark = cc_benchmark {
    name = "libprocinfo_benchmark";
    defaults = ["libprocinfo_defaults"];
    srcs = [
        "process_map_benchmark.cpp"
    ];
    shared_libs = [
        "libbacktrace"
        "libbase"
        "libprocinfo"
        "libunwindstack"
    ];
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    data = [
        "testdata/maps"
    ];
};

in { inherit libprocinfo libprocinfo_benchmark libprocinfo_defaults libprocinfo_test; }
