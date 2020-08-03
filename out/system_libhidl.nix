{ cc_defaults, cc_library, cc_test }:
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

libhidl-defaults = cc_defaults {
    name = "libhidl-defaults";
    cflags = [
        "-Wall"
        "-Wdocumentation" #  since some users use this
        "-Werror"
        "-Wextra-semi"
    ];
};

libhidl_test = cc_test {
    name = "libhidl_test";
    defaults = ["libhidl-defaults"];
    gtest = false;
    srcs = ["test_main.cpp"];
    test_suites = ["device-tests"];

    shared_libs = [
        "android.hidl.memory@1.0"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
        "libcutils"
    ];
    static_libs = [
        "libgtest"
        "libgmock"
    ];

    cflags = [
        "-O0"
        "-g"
    ];
};

libhidlbase-combined-impl = cc_defaults {
    name = "libhidlbase-combined-impl";

    defaults = [
        "libhwbinder-impl-shared-libs"
        "libhidlbase-impl-shared-libs"
        "libhidltransport-impl-shared-libs"
    ];

    whole_static_libs = [
        "libhidlbase-impl-internal"
        "libhidltransport-impl-internal"
    ];
};

libhidlbase = cc_library {
    name = "libhidlbase";
    defaults = ["libhidlbase-combined-impl"];
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    whole_static_libs = [
        "libhwbinder-impl-internal"
    ];
};

#  Only libhwbinder_benchmark needs to have pgo enabled. When all places
#  support having PGO selectively enabled, all places can use libhwbinder.
#
#  http://b/77320844
libhidlbase_pgo = cc_library {
    name = "libhidlbase_pgo";
    defaults = [
        "libhidlbase-combined-impl"
        "hwbinder_benchmark_pgo"
    ];
    whole_static_libs = [
        "libhwbinder_pgo-impl-internal"
    ];
};

#  WARNING: deprecated
#  This library is no longer required, and dependencies should be taken
#  on libhidlbase instead.
libhidltransport = cc_library {
    name = "libhidltransport";
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
};

in { inherit libhidl-defaults libhidl_test libhidlbase libhidlbase-combined-impl libhidlbase_pgo libhidltransport; }
