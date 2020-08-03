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

hiddenapi-defaults = cc_defaults {
    name = "hiddenapi-defaults";
    host_supported = true;
    device_supported = false;
    defaults = ["art_defaults"];
    srcs = [
        "hiddenapi.cc"
    ];

    target = {
        android = {
            compile_multilib = "prefer32";
        };
        darwin = {
            enabled = true;
        };
    };

    shared_libs = [
        "libbase"
    ];
};

hiddenapi = art_cc_binary {
    name = "hiddenapi";
    defaults = ["hiddenapi-defaults"];
    shared_libs = [
        "libdexfile"
        "libartbase"
    ];
};

hiddenapid = art_cc_binary {
    name = "hiddenapid";
    defaults = [
        "art_debug_defaults"
        "hiddenapi-defaults"
    ];
    shared_libs = [
        "libdexfiled"
        "libartbased"
    ];
};

art_hiddenapi_tests = art_cc_test {
    name = "art_hiddenapi_tests";
    host_supported = true;
    device_supported = false;
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = ["hiddenapi_test.cc"];
};

in { inherit art_hiddenapi_tests hiddenapi hiddenapi-defaults hiddenapid; }
