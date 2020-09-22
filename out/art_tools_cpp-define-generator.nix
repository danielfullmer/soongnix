{ cc_genrule, cc_library_headers, cc_object, python_binary_host }:
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

#  This produces human-readable asm_defines.s with the embedded compile-time constants.
"asm_defines.s" = cc_object {
    name = "asm_defines.s";
    host_supported = true;
    device_supported = true;
    defaults = [
        "art_debug_defaults"
        "art_defaults"
    ];
    header_libs = [
        "art_libartbase_headers" #  For base/bit_utils.h
        "libart_runtime_headers_ndk"
        "libdexfile_all_headers" #  For dex/modifiers.h
    ];
    #  Produce text file rather than binary.
    cflags = ["-S"];
    srcs = ["asm_defines.cc"];
    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

#  This extracts the compile-time constants from asm_defines.s and creates the header.
cpp-define-generator-asm-support = cc_genrule {
    name = "cpp-define-generator-asm-support";
    host_supported = true;
    device_supported = true;
    srcs = [":asm_defines.s"];
    out = ["asm_defines.h"];
    tool_files = ["make_header.py"];
    cmd = "$(location make_header.py) \"$(in)\" > \"$(out)\"";
    target = {
        darwin = {
            enabled = false;
        };
    };

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

cpp-define-generator-definitions = cc_library_headers {
    name = "cpp-define-generator-definitions";
    host_supported = true;
    export_include_dirs = ["."];

    apex_available = [
        "com.android.art.debug"
        "com.android.art.release"
    ];
};

cpp-define-generator-test = python_binary_host {
    name = "cpp-define-generator-test";
    main = "make_header_test.py";
    srcs = [
        "make_header.py"
        "make_header_test.py"
    ];
    test_suites = ["general-tests"];
};

in { inherit "asm_defines.s" cpp-define-generator-asm-support cpp-define-generator-definitions cpp-define-generator-test; }
