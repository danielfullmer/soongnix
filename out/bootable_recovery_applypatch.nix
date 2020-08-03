{ cc_binary, cc_binary_host, cc_defaults, cc_library_static }:
let

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

applypatch_defaults = cc_defaults {
    name = "applypatch_defaults";

    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-DZLIB_CONST"
        "-Wall"
        "-Werror"
    ];

    local_include_dirs = [
        "include"
    ];
};

libapplypatch = cc_library_static {
    name = "libapplypatch";

    host_supported = true;

    defaults = [
        "applypatch_defaults"
    ];

    srcs = [
        "applypatch.cpp"
        "bspatch.cpp"
        "freecache.cpp"
        "imgpatch.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    static_libs = [
        "libbase"
        "libbspatch"
        "libbz"
        "libcrypto"
        "libedify"
        "libotautil"
        "libz"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

libapplypatch_modes = cc_library_static {
    name = "libapplypatch_modes";

    defaults = [
        "applypatch_defaults"
    ];

    srcs = [
        "applypatch_modes.cpp"
    ];

    static_libs = [
        "libapplypatch"
        "libbase"
        "libcrypto"
        "libedify"
        "libotautil"
    ];
};

applypatch = cc_binary {
    name = "applypatch";

    defaults = [
        "applypatch_defaults"
    ];

    srcs = [
        "applypatch_main.cpp"
    ];

    static_libs = [
        "libapplypatch_modes"
        "libapplypatch"
        "libedify"
        "libotautil"
        "libbspatch"
    ];

    shared_libs = [
        "libbase"
        "libbrotli"
        "libbz"
        "libcrypto"
        "liblog"
        "libz"
        "libziparchive"
    ];
};

libimgdiff = cc_library_static {
    name = "libimgdiff";

    host_supported = true;

    defaults = [
        "applypatch_defaults"
    ];

    srcs = [
        "imgdiff.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    static_libs = [
        "libbase"
        "libbsdiff"
        "libdivsufsort"
        "libdivsufsort64"
        "liblog"
        "libotautil"
        "libutils"
        "libz"
        "libziparchive"
    ];
};

imgdiff = cc_binary_host {
    name = "imgdiff";

    srcs = [
        "imgdiff_main.cpp"
    ];

    defaults = [
        "applypatch_defaults"
    ];

    static_libs = [
        "libimgdiff"
        "libotautil"
        "libbsdiff"
        "libdivsufsort"
        "libdivsufsort64"
        "libziparchive"
        "libbase"
        "libutils"
        "liblog"
        "libbrotli"
        "libbz"
        "libz"
    ];
};

libimgpatch = cc_library_static {
    name = "libimgpatch";

    #  The host module is for recovery_host_test (Linux only).
    host_supported = true;

    defaults = [
        "applypatch_defaults"
    ];

    srcs = [
        "bspatch.cpp"
        "imgpatch.cpp"
    ];

    static_libs = [
        "libbase"
        "libbspatch"
        "libbz"
        "libcrypto"
        "libedify"
        "libotautil"
        "libz"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit applypatch applypatch_defaults imgdiff libapplypatch libapplypatch_modes libimgdiff libimgpatch; }
