{ cc_binary, cc_defaults, cc_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

libcap_defaults = cc_defaults {
    name = "libcap_defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-result"
        "-Wno-tautological-compare"
    ];
};

libcap = cc_library {
    name = "libcap";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    vndk = {
        enabled = true;
    };
    defaults = ["libcap_defaults"];

    srcs = [
        "libcap/cap_alloc.c"
        "libcap/cap_extint.c"
        "libcap/cap_file.c"
        "libcap/cap_flag.c"
        "libcap/cap_proc.c"
        "libcap/cap_text.c"
    ];

    local_include_dirs = ["libcap/include"];
    export_include_dirs = ["libcap/include"];

    target = {
        darwin = {
            enabled = false;
        };
        linux_bionic = {
            enabled = true;
        };
    };
    apex_available = [
        "//apex_available:platform"
        "com.android.adbd"
        "com.android.media.swcodec"
    ];
    min_sdk_version = "29";
};

getcap = cc_binary {
    name = "getcap";

    srcs = ["progs/getcap.c"];

    defaults = ["libcap_defaults"];

    static_libs = [
        "libcap"
    ];
};

setcap = cc_binary {
    name = "setcap";

    srcs = ["progs/setcap.c"];

    defaults = ["libcap_defaults"];

    static_libs = [
        "libcap"
    ];
};

in { inherit getcap libcap libcap_defaults setcap; }
