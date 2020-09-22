{ cc_defaults, cc_library, cc_library_headers }:
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

libese-defaults = cc_defaults {
    name = "libese-defaults";

    proprietary = true;
    cflags = [
        "-std=c99"
        "-D_FORTIFY_SOURCE=2"
        "-Wall"
        "-Werror"
    ];

    #  This doesn't work yet, but is good documentation for when
    #  debugging is needed.
    debug = {
        cflags = ["-DLOG_NDEBUG=0"];
    };
};

libese-api-headers = cc_library_headers {
    name = "libese-api-headers";
    host_supported = true;
    proprietary = true;
    export_include_dirs = ["include"];
    visibility = ["//external/libese:__subpackages__"];
};

libese-api-defaults = cc_defaults {
    name = "libese-api-defaults";
    defaults = ["libese-defaults"];

    header_libs = ["libese-api-headers"];
    export_header_lib_headers = ["libese-api-headers"];

    #  Ensure that only explicitly exported symbols are visible.
    cflags = ["-fvisibility=internal"];
};

libese = cc_library {
    name = "libese";
    defaults = ["libese-api-defaults"];
    host_supported = true;

    srcs = [
        "ese.c"
        "ese_sg.c"
    ];

    shared_libs = [
        "libese-sysdeps"
        "liblog"
    ];
    export_shared_lib_headers = [
        "libese-sysdeps"
        "liblog"
    ];
};

subdirs = ["tests"];

in { inherit libese libese-api-defaults libese-api-headers libese-defaults; }
