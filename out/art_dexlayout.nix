{ art_cc_binary, art_cc_defaults, art_cc_library, art_cc_test, cc_defaults }:
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

libart-dexlayout-defaults = art_cc_defaults {
    name = "libart-dexlayout-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "compact_dex_writer.cc"
        "dexlayout.cc"
        "dex_ir.cc"
        "dex_ir_builder.cc"
        "dex_verify.cc"
        "dex_visualize.cc"
        "dex_writer.cc"
    ];
    export_include_dirs = ["."];
    target = {
        android = {
            shared_libs = [
                "libartbase"
                "libartpalette"
                "libdexfile"
                "libprofile"
                "libbase"
            ];
        };
        not_windows = {
            shared_libs = [
                "libartbase"
                "libartpalette"
                "libdexfile"
                "libprofile"
                "libbase"
            ];
        };
        windows = {
            cflags = ["-Wno-thread-safety"];
            static_libs = [
                "libartbase"
                "libartpalette"
                "libdexfile"
                "libprofile"
                "libbase"
            ];
        };
    };
    static_libs = ["libz"];
};

libart-dexlayout_static_base_defaults = cc_defaults {
    name = "libart-dexlayout_static_base_defaults";
    static_libs = [
        "libbase"
        "libz"
    ];
};

libart-dexlayout = art_cc_library {
    name = "libart-dexlayout";
    defaults = [
        "libart-dexlayout-defaults"
        "dex2oat-pgo-defaults"
    ];
    target = {
        android = {
            lto = {
                thin = true;
            };
        };
        windows = {
            enabled = true;
            shared = {
                enabled = false;
            };
        };
    };
};

libart-dexlayout_static_defaults = cc_defaults {
    name = "libart-dexlayout_static_defaults";
    defaults = [
        "libart-dexlayout_static_base_defaults"
        "libartbase_static_defaults"
        "libdexfile_static_defaults"
        "libprofile_static_defaults"
    ];
    static_libs = ["libart-dexlayout"];
};

libartd-dexlayout = art_cc_library {
    name = "libartd-dexlayout";
    defaults = [
        "libart-dexlayout-defaults"
        "art_debug_defaults"
    ];
    shared_libs = [
        "libdexfiled"
        "libartbased"
        "libprofiled"
    ];
};

libartd-dexlayout_static_defaults = cc_defaults {
    name = "libartd-dexlayout_static_defaults";
    defaults = [
        "libart-dexlayout_static_base_defaults"
        "libartbased_static_defaults"
        "libdexfiled_static_defaults"
        "libprofiled_static_defaults"
    ];
    static_libs = ["libartd-dexlayout"];
};

dexlayout-defaults = cc_defaults {
    name = "dexlayout-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    shared_libs = [
        "libbase"
    ];
};

dexlayout = art_cc_binary {
    name = "dexlayout";
    defaults = ["dexlayout-defaults"];
    srcs = ["dexlayout_main.cc"];
    shared_libs = [
        "libdexfile"
        "libprofile"
        "libartbase"
        "libart-dexlayout"
    ];
};

dexlayouts = art_cc_binary {
    name = "dexlayouts";
    defaults = [
        "dexlayout-defaults"
        "libart-dexlayout_static_defaults"
        "libprofile_static_defaults"
        "libdexfile_static_defaults"
        "libartbase_static_defaults"
    ];
    srcs = ["dexlayout_main.cc"];
    host_supported = true;
    device_supported = false;
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = true;
            cflags = ["-Wno-thread-safety"];
        };
    };
};

dexlayoutd = art_cc_binary {
    name = "dexlayoutd";
    defaults = [
        "art_debug_defaults"
        "dexlayout-defaults"
    ];
    srcs = ["dexlayout_main.cc"];
    shared_libs = [
        "libdexfiled"
        "libprofiled"
        "libartbased"
        "libartd-dexlayout"
    ];
};

art_dexlayout_tests = art_cc_test {
    name = "art_dexlayout_tests";
    defaults = ["art_gtest_defaults"];
    shared_libs = [
        "libprofiled"
        "libartd-dexlayout"
    ];
    srcs = ["dexlayout_test.cc"];
};

dexdiag = art_cc_binary {
    name = "dexdiag";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = ["dexdiag.cc"];
    cflags = ["-Wall"];
    shared_libs = [
        "libart"
        "libdexfile"
        "libartbase"
        "libart-dexlayout"
        "libbase"
    ];
    target = {
        android = {
            shared_libs = [
                "libmeminfo"
            ];
        };
    };
};

art_dexdiag_tests = art_cc_test {
    name = "art_dexdiag_tests";
    host_supported = true;
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = ["dexdiag_test.cc"];
};

in { inherit art_dexdiag_tests art_dexlayout_tests dexdiag dexlayout dexlayout-defaults dexlayoutd dexlayouts libart-dexlayout libart-dexlayout-defaults libart-dexlayout_static_base_defaults libart-dexlayout_static_defaults libartd-dexlayout libartd-dexlayout_static_defaults; }
