{ art_cc_binary, art_cc_test, cc_defaults }:
let

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

dexdump_defaults = cc_defaults {
    name = "dexdump_defaults";
    defaults = ["art_defaults"];
    srcs = [
        "dexdump_cfg.cc"
        "dexdump_main.cc"
        "dexdump.cc"
    ];
};

dexdump = art_cc_binary {
    name = "dexdump";
    defaults = ["dexdump_defaults"];
    host_supported = true;
    target = {
        android = {
            shared_libs = [
                "libdexfile"
                "libartbase"
                "libbase"
            ];
        };
        #  Use static libs on host: required for Windows build and
        #  static_sdk_tools build.
        host = {
            enabled = true;
            static_libs = [
                "libdexfile"
                "libartbase"
                "libbase"
                "libartpalette"
                "liblog"
                "libz"
                "libziparchive"
            ];
        };
        darwin = {
            enabled = true;
        };
    };
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
        "//apex_available:platform" #  for SDK
    ];
};

art_dexdump_tests = art_cc_test {
    name = "art_dexdump_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = ["dexdump_test.cc"];
};

in { inherit art_dexdump_tests dexdump dexdump_defaults; }
