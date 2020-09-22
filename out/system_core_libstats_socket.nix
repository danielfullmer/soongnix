{ cc_defaults, cc_library, cc_library_headers, cc_test, cc_test_library }:
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

#  =========================================================================
#  Native library to write stats log to statsd socket on Android R and later
#  =========================================================================
libstatssocket_defaults = cc_defaults {
    name = "libstatssocket_defaults";
    srcs = [
        "stats_buffer_writer.c"
        "stats_event.c"
        "stats_socket.c"
        "statsd_writer.c"
    ];
    export_include_dirs = ["include"];
    static_libs = [
        "libcutils" #  does not expose a stable C API
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

libstatssocket = cc_library {
    name = "libstatssocket";
    defaults = [
        "libstatssocket_defaults"
    ];
    host_supported = true;
    target = {
        #  On android, libstatssocket should only be linked as a shared lib
        android = {
            static = {
                enabled = false;
            };
        };
        host = {
            shared = {
                enabled = false;
            };
        };
    };
    stl = "libc++_static";

    #  enumerate stable entry points for APEX use
    stubs = {
        symbol_file = "libstatssocket.map.txt";
        versions = [
            "30"
        ];
    };
    apex_available = [
        "com.android.os.statsd"
        "test_com.android.os.statsd"
    ];
};

# TODO (b/149842105): Figure out if there is a better solution for this.
libstatssocket_private = cc_test_library {
    name = "libstatssocket_private";
    defaults = [
        "libstatssocket_defaults"
    ];
    visibility = [
        "//frameworks/base/apex/statsd/tests/libstatspull"
        "//frameworks/base/cmds/statsd"
    ];
};

libstatssocket_headers = cc_library_headers {
    name = "libstatssocket_headers";
    export_include_dirs = ["include"];
    host_supported = true;
    apex_available = ["com.android.resolv"];
    min_sdk_version = "29";
};

libstatssocket_test = cc_test {
    name = "libstatssocket_test";
    srcs = [
        "tests/stats_event_test.cpp"
        "tests/stats_writer_test.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = [
        "libgmock"
        "libstatssocket_private"
    ];
    shared_libs = [
        "libcutils"
        "libutils"
    ];
    test_suites = [
        "device-tests"
        "mts"
    ];
    test_config = "libstatssocket_test.xml";
    # TODO(b/153588990): Remove when the build system properly separates.
    # 32bit and 64bit architectures.
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
};

in { inherit libstatssocket libstatssocket_defaults libstatssocket_headers libstatssocket_private libstatssocket_test; }
