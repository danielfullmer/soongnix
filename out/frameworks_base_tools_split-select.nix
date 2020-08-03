{ cc_binary_host, cc_defaults, cc_library_host_static, cc_test_host }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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
#  Setup some common variables for the different build
#  targets here.
#  ==========================================================

split-select_defaults = cc_defaults {
    name = "split-select_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];
    include_dirs = ["frameworks/base/tools"];
    static_libs = [
        "libaapt"
        "libandroidfw"
        "libpng"
        "libutils"
        "liblog"
        "libcutils"
        "libexpat"
        "libziparchive"
        "libbase"
        "libz"
    ];
    group_static_libs = true;

    target = {
        windows = {
            enabled = true;
        };
    };

    #  This tool is prebuilt if we're doing an app-only build.
    product_variables = {
        pdk = {
            enabled = false;
        };
        unbundled_build = {
            enabled = false;
        };
    };
};

#  ==========================================================
#  Build the host static library: libsplit-select
#  ==========================================================
libsplit-select = cc_library_host_static {
    name = "libsplit-select";
    defaults = ["split-select_defaults"];

    srcs = [
        "Abi.cpp"
        "Grouper.cpp"
        "Rule.cpp"
        "RuleGenerator.cpp"
        "SplitDescription.cpp"
        "SplitSelector.cpp"
    ];
    cflags = ["-D_DARWIN_UNLIMITED_STREAMS"];

};

#  ==========================================================
#  Build the host tests: libsplit-select_tests
#  ==========================================================
libsplit-select_tests = cc_test_host {
    name = "libsplit-select_tests";
    defaults = ["split-select_defaults"];

    srcs = [
        "Grouper_test.cpp"
        "Rule_test.cpp"
        "RuleGenerator_test.cpp"
        "SplitSelector_test.cpp"
        "TestRules.cpp"
    ];

    static_libs = ["libsplit-select"];

};

#  ==========================================================
#  Build the host executable: split-select
#  ==========================================================
split-select = cc_binary_host {
    name = "split-select";
    defaults = ["split-select_defaults"];
    srcs = ["Main.cpp"];

    static_libs = ["libsplit-select"];
};

in { inherit libsplit-select libsplit-select_tests split-select split-select_defaults; }
