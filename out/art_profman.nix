{ art_cc_binary, art_cc_test, cc_defaults }:
let

#
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
#

profman-defaults = cc_defaults {
    name = "profman-defaults";
    host_supported = true;
    defaults = ["art_defaults"];
    srcs = [
        "boot_image_profile.cc"
        "profman.cc"
        "profile_assistant.cc"
    ];

    target = {
        android = {
            #  Use the 32-bit version of profman on devices.
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

profman = art_cc_binary {
    name = "profman";
    defaults = ["profman-defaults"];
    shared_libs = [
        "libprofile"
        "libdexfile"
        "libartbase"
    ];
};

profmand = art_cc_binary {
    name = "profmand";
    defaults = [
        "art_debug_defaults"
        "profman-defaults"
    ];
    shared_libs = [
        "libprofiled"
        "libdexfiled"
        "libartbased"
    ];
};

profmans = art_cc_binary {
    name = "profmans";
    defaults = [
        "profman-defaults"
        "libprofile_static_defaults"
        "libdexfile_static_defaults"
        "libartbase_static_defaults"
    ];
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

art_profman_tests = art_cc_test {
    name = "art_profman_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    shared_libs = [
        "libprofiled"
    ];
    srcs = ["profile_assistant_test.cc"];
};

in { inherit art_profman_tests profman profman-defaults profmand profmans; }
