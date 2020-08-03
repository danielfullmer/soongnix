{ art_cc_binary, art_cc_test, cc_defaults }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

dexoptanalyzer-defaults = cc_defaults {
    name = "dexoptanalyzer-defaults";
    host_supported = true;
    defaults = ["art_defaults"];
    srcs = [
        "dexoptanalyzer.cc"
    ];

    target = {
        android = {
            #  Use the 32-bit version of dexoptanalyzer on devices.
            compile_multilib = "prefer32";
        };
    };

    shared_libs = [
        "libbase"
    ];
};

dexoptanalyzer = art_cc_binary {
    name = "dexoptanalyzer";
    defaults = ["dexoptanalyzer-defaults"];
    shared_libs = [
        "libart"
        "libartbase"
    ];
};

dexoptanalyzerd = art_cc_binary {
    name = "dexoptanalyzerd";
    defaults = [
        "art_debug_defaults"
        "dexoptanalyzer-defaults"
    ];
    shared_libs = [
        "libartd"
        "libartbased"
    ];
};

art_dexoptanalyzer_tests = art_cc_test {
    name = "art_dexoptanalyzer_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    shared_libs = [
        "libbacktrace"
    ];
    srcs = ["dexoptanalyzer_test.cc"];
};

in { inherit art_dexoptanalyzer_tests dexoptanalyzer dexoptanalyzer-defaults dexoptanalyzerd; }
