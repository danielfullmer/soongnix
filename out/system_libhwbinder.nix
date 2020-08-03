{ cc_defaults, cc_library, cc_library_static }:
let

#  Copyright (C) 2009 The Android Open Source Project
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

subdirs = [
    "vts/performance"
];

libhwbinder_defaults = cc_defaults {
    name = "libhwbinder_defaults";

    export_include_dirs = ["include"];
    include_dirs = ["frameworks/native/include"];

    sanitize = {
        misc_undefined = ["integer"];
    };
    srcs = [
        "Binder.cpp"
        "BpHwBinder.cpp"
        "BufferedTextOutput.cpp"
        "Debug.cpp"
        "IInterface.cpp"
        "IPCThreadState.cpp"
        "Parcel.cpp"
        "ProcessState.cpp"
        "Static.cpp"
        "TextOutput.cpp"
    ];

    product_variables = {
        binder32bit = {
            cflags = ["-DBINDER_IPC_32BIT=1"];
        };
    };

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

libhwbinder-impl-shared-libs = cc_defaults {
    name = "libhwbinder-impl-shared-libs";
    defaults = ["libhwbinder-impl-shared-libs-no-vndk-private"];
    shared_libs = [
        "libbinderthreadstate"
    ];
};

libhwbinder-impl-shared-libs-no-vndk-private = cc_defaults {
    name = "libhwbinder-impl-shared-libs-no-vndk-private";
    shared_libs = [
        "libbase"
        "liblog"
        "libcutils"
        "libutils"
    ];
    export_shared_lib_headers = [
        "libbase"
        "libutils"
    ];
};

#  WARNING: this should no longer be used
libhwbinder = cc_library {
    name = "libhwbinder";
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };

    export_include_dirs = ["include"];
};

#  Combined into libhidlbase for efficiency.
#  Used as shared library to provide headers for libhidltransport-impl-internal.
libhwbinder-impl-internal = cc_library_static {
    name = "libhwbinder-impl-internal";
    #  TODO(b/135299443): allow this library to link against vndk-private libs
    #  and instead rely on the fact that users of this static library must be
    #  vndk (since they must use libbinderthreadstate).
    include_dirs = ["frameworks/native/libs/binderthreadstate/include/"];
    defaults = [
        "libhwbinder_defaults"
        "libhwbinder-impl-shared-libs-no-vndk-private"
        "hwbinder_pgo"
        "hwbinder_lto"
    ];
    recovery_available = true;
    vendor_available = true;
};

#  Explicitly provide a no lto, no PGO variant, to workaround the issue that we
#  can't detect non-lto users of the module in Android.mk.
#  TODO(b/135558503): remove
libhwbinder_noltopgo = cc_library {
    name = "libhwbinder_noltopgo";
    defaults = [
        "libhwbinder_defaults"
        "libhwbinder-impl-shared-libs"
    ];
    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
};

#  Only libhwbinder_benchmark needs to have pgo enabled. When all places
#  support having PGO selectively enabled, all places can use libhwbinder.
#
#  http://b/77320844
libhwbinder_pgo-impl-internal = cc_library_static {
    name = "libhwbinder_pgo-impl-internal";
    defaults = [
        "libhwbinder_defaults"
        "libhwbinder-impl-shared-libs"
        "hwbinder_benchmark_pgo"
        "hwbinder_lto"
    ];
};

#  Provide pgo property to build hwbinder with PGO
hwbinder_pgo = cc_defaults {
    name = "hwbinder_pgo";
    pgo = {
        instrumentation = true;
        profile_file = "hwbinder/hwbinder.profdata";
        benchmarks = ["hwbinder"];
        enable_profile_use = true;
    };
};

hwbinder_benchmark_pgo = cc_defaults {
    name = "hwbinder_benchmark_pgo";
    pgo = {
        instrumentation = true;
        profile_file = "hwbinder/hwbinder.profdata";
        benchmarks = ["hwbinder_benchmark"];
        enable_profile_use = true;
    };
};

#  Provide lto property to build hwbinder with LTO
hwbinder_lto = cc_defaults {
    name = "hwbinder_lto";
    target = {
        android = {
            lto = {
                thin = true;
            };
        };
    };
};

in { inherit hwbinder_benchmark_pgo hwbinder_lto hwbinder_pgo libhwbinder libhwbinder-impl-internal libhwbinder-impl-shared-libs libhwbinder-impl-shared-libs-no-vndk-private libhwbinder_defaults libhwbinder_noltopgo libhwbinder_pgo-impl-internal; }
