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

#  TODO(ajcbik): rename dexdump2 into dexdump when Dalvik version is removed

dexdump_defaults = cc_defaults {
    name = "dexdump_defaults";
    defaults = ["art_defaults"];
    srcs = [
        "dexdump_cfg.cc"
        "dexdump_main.cc"
        "dexdump.cc"
    ];
};

dexdump2 = art_cc_binary {
    name = "dexdump2";
    defaults = ["dexdump_defaults"];
    host_supported = true;
    shared_libs = [
        "libdexfile"
        "libartbase"
        "libbase"
    ];
};

dexdumps = art_cc_binary {
    name = "dexdumps";
    defaults = [
        "dexdump_defaults"
        "libartbase_static_defaults"
        "libdexfile_static_defaults"
    ];
    host_supported = true;
    device_supported = false;
    target = {
        darwin = {
            enabled = false;
        };
        windows = {
            enabled = true;
        };
    };
};

art_dexdump_tests = art_cc_test {
    name = "art_dexdump_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = ["dexdump_test.cc"];
};

in { inherit art_dexdump_tests dexdump2 dexdump_defaults dexdumps; }
