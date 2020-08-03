{ cc_defaults, cc_library_headers }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

swiftshader_common = cc_defaults {
    name = "swiftshader_common";

    gnu_extensions = false;

    cflags = [
        "-Xclang"
        "-fuse-init-array"
        "-fno-operator-names"
        "-msse2"
        "-Werror"
        "-Wwrite-strings"
    ];

    cppflags = [
        "-Woverloaded-virtual"
    ];
    cpp_std = "c++11";

    target = {
        host = {
            cppflags = [
                "-fno-rtti"
                "-fno-exceptions"
            ];
            compile_multilib = "64";
        };

        #  We don't need Darwin host-side builds
        darwin = {
            enabled = false;
        };
    };
};

swiftshader_common_release = cc_defaults {
    name = "swiftshader_common_release";

    defaults = ["swiftshader_common"];

    cflags = [
        "-Os"
        "-fomit-frame-pointer"
        "-ffunction-sections"
        "-fdata-sections"
    ];
};

swiftshader_common_debug = cc_defaults {
    name = "swiftshader_common_debug";

    defaults = ["swiftshader_common"];

    cflags = [
        "-O0"
        "-g"
        "-UNDEBUG"
    ];
};

swiftshader_subzero = cc_defaults {
    name = "swiftshader_subzero";

    cflags = [
        "-DALLOW_DUMP=0"
        "-DALLOW_TIMERS=0"
        "-DALLOW_LLVM_CL=0"
        "-DALLOW_LLVM_IR=0"
        "-DALLOW_LLVM_IR_AS_INPUT=0"
        "-DALLOW_MINIMAL_BUILD=0"
        "-DALLOW_WASM=0"
        "-DICE_THREAD_LOCAL_HACK=1"
    ];
};

swiftshader_platform_headers = cc_library_headers {
    name = "swiftshader_platform_headers";
    host_supported = true;
    export_include_dirs = ["include"];
};

swiftshader_host_headers = cc_library_headers {
    name = "swiftshader_host_headers";
    device_supported = false;
    host_supported = true;
    export_include_dirs = ["include/Android"];
};

subdirs = [
    "src"
    "third_party/llvm-subzero"
    "third_party/LLVM"
    "third_party/subzero"
];

in { inherit swiftshader_common swiftshader_common_debug swiftshader_common_release swiftshader_host_headers swiftshader_platform_headers swiftshader_subzero; }
