{ art_cc_library, cc_defaults }:
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

#  Build variants {target,host} x {debug,ndebug} x {32,64}

titrace-defaults = cc_defaults {
    name = "titrace-defaults";
    host_supported = true;
    srcs = [
        "titrace.cc"
        "instruction_decoder.cc"
    ];
    defaults = ["art_defaults"];

    #  Note that this tool needs to be built for both 32-bit and 64-bit since it requires
    #  to be same ISA as what it is attached to.
    compile_multilib = "both";

    shared_libs = [
        "libbase"
    ];
    target = {
        android = {
        };
        host = {
        };
    };
    header_libs = [
        "libopenjdkjvmti_headers"
    ];
    include_dirs = ["art/libdexfile"]; #  for dex_instruction_list.h only
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    symlink_preferred_arch = true;
};

libtitrace = art_cc_library {
    name = "libtitrace";
    defaults = ["titrace-defaults"];
    shared_libs = [
    ];
};

libtitraced = art_cc_library {
    name = "libtitraced";
    defaults = [
        "art_debug_defaults"
        "titrace-defaults"
    ];
    shared_libs = [
    ];
};

# art_cc_test {
#     name: "art_titrace_tests",
#     defaults: [
#         "art_gtest_defaults",
#     ],
#     srcs: ["titrace_test.cc"],
# }

in { inherit libtitrace libtitraced titrace-defaults; }
