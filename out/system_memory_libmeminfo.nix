{ cc_benchmark, cc_defaults, cc_library, cc_test }:
let

#
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
#

libmeminfo_defaults = cc_defaults {
    name = "libmeminfo_defaults";
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "liblog"
        "libprocinfo"
    ];
    static_libs = [
        "libdmabufinfo"
    ];
    target = {
        darwin = {
            enabled = false;
        };

    };
};

libmeminfo = cc_library {
    name = "libmeminfo";
    host_supported = true;
    native_bridge_supported = true;
    defaults = ["libmeminfo_defaults"];
    export_include_dirs = [
        "include"
        "libdmabufinfo/include"
    ];
    export_shared_lib_headers = ["libbase"];
    srcs = [
        "pageacct.cpp"
        "procmeminfo.cpp"
        "sysmeminfo.cpp"
    ];

    apex_available = [
        "//apex_available:platform"
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

libmeminfo_test = cc_test {
    name = "libmeminfo_test";
    test_suites = ["device-tests"];
    defaults = ["libmeminfo_defaults"];
    require_root = true;

    static_libs = [
        "libmeminfo"
        "libbase"
        "liblog"
    ];

    srcs = [
        "libmeminfo_test.cpp"
    ];

    data = [
        "testdata1/mm_stat"
        "testdata1/smaps"
        "testdata1/smaps_short"
        "testdata1/vmallocinfo"
        "testdata2/mem_used_total"
    ];
};

libmeminfo_benchmark = cc_benchmark {
    name = "libmeminfo_benchmark";
    srcs = [
        "libmeminfo_benchmark.cpp"
    ];
    static_libs = [
        "libbase"
        "liblog"
        "libmeminfo"
        "libprocinfo"
    ];

    data = [
        "testdata1/mm_stat"
        "testdata1/smaps"
        "testdata1/smaps_short"
        "testdata1/vmallocinfo"
    ];
};

in { inherit libmeminfo libmeminfo_benchmark libmeminfo_defaults libmeminfo_test; }
