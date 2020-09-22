{ art_cc_defaults, art_cc_library, cc_library_headers }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

libart-disassembler-defaults = art_cc_defaults {
    name = "libart-disassembler-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "disassembler.cc"
    ];
    codegen = {
        arm = {
            srcs = ["disassembler_arm.cc"];
        };
        arm64 = {
            srcs = ["disassembler_arm64.cc"];
        };
        x86 = {
            srcs = ["disassembler_x86.cc"];
        };
        x86_64 = {
            srcs = ["disassembler_x86.cc"];
        };
    };
    shared_libs = [
        "libbase"
    ];
    header_libs = [
        "art_libartbase_headers"
        "libart_runtime_headers_ndk"
    ];
    export_include_dirs = ["."];
};

libart-disassembler = art_cc_library {
    name = "libart-disassembler";
    defaults = ["libart-disassembler-defaults"];
    shared_libs = [
        #  For disassembler_arm*.
        "libvixl"
    ];
    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

libartd-disassembler = art_cc_library {
    name = "libartd-disassembler";
    defaults = [
        "art_debug_defaults"
        "libart-disassembler-defaults"
    ];
    shared_libs = [
        #  For disassembler_arm*.
        "libvixld"
    ];

    apex_available = [
        "com.android.art.release"
        "com.android.art.debug"
    ];
};

art_disassembler_headers = cc_library_headers {
    name = "art_disassembler_headers";
    host_supported = true;
    export_include_dirs = [
        "."
    ];

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

in { inherit art_disassembler_headers libart-disassembler libart-disassembler-defaults libartd-disassembler; }
