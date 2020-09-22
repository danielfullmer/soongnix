{ cc_defaults, cc_library, cc_test }:
let

#
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
#

#  =========================================================================
#  Native library that toggles between the old and new statsd socket
#  protocols. This library should only be used by DNS resolver or other
#  native modules on Q that log pushed atoms to statsd.
#  =========================================================================
libstatspush_compat_defaults = cc_defaults {
    name = "libstatspush_compat_defaults";
    srcs = [
        "statsd_writer.c"
        "stats_event_list.c"
        "StatsEventCompat.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-DWRITE_TO_STATSD=1"
        "-DWRITE_TO_LOGD=0"
    ];
    header_libs = ["libstatssocket_headers"];
    static_libs = [
        "libbase"
    ];
    shared_libs = [
        "liblog"
    ];
};

libstatspush_compat = cc_library {
    name = "libstatspush_compat";
    defaults = ["libstatspush_compat_defaults"];
    export_include_dirs = ["include"];
    export_header_lib_headers = [
        "libstatssocket_headers"
    ];
    static_libs = ["libgtest_prod"];
    apex_available = ["com.android.resolv"];
    min_sdk_version = "29";
};

libstatspush_compat_test = cc_test {
    name = "libstatspush_compat_test";
    defaults = ["libstatspush_compat_defaults"];
    test_suites = ["device_tests"];
    srcs = [
        "tests/StatsEventCompat_test.cpp"
    ];
    static_libs = ["libgmock"];
};

in { inherit libstatspush_compat libstatspush_compat_defaults libstatspush_compat_test; }
