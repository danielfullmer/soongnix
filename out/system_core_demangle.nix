{ cc_binary, cc_defaults, cc_library, cc_test }:
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

libdemangle_defaults = cc_defaults {
    name = "libdemangle_defaults";

    host_supported = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];

    target = {
        linux_bionic = {
            enabled = true;
        };
    };
};

libdemangle = cc_library {
    name = "libdemangle";
    defaults = ["libdemangle_defaults"];
    vendor_available = true;
    recovery_available = true;

    srcs = [
        "Demangler.cpp"
    ];

    local_include_dirs = [
        "include"
    ];

    export_include_dirs = [
        "include"
    ];
};

demangle = cc_binary {
    name = "demangle";
    defaults = ["libdemangle_defaults"];
    srcs = ["demangle.cpp"];
    host_supported = true;

    shared_libs = ["libdemangle"];
};

# -------------------------------------------------------------------------
#  Unit Tests
# -------------------------------------------------------------------------
libdemangle_test = cc_test {
    name = "libdemangle_test";
    defaults = ["libdemangle_defaults"];

    srcs = [
        "DemangleTest.cpp"
    ];

    cflags = [
        "-O0"
        "-g"
    ];

    shared_libs = [
        "libdemangle"
    ];

    test_suites = ["device-tests"];
    required = [
        "libdemangle"
    ];
};

in { inherit demangle libdemangle libdemangle_defaults libdemangle_test; }
