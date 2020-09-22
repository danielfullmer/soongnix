{ cc_defaults, cc_library, cc_library_static }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

libadb_tls_connection_defaults = cc_defaults {
    name = "libadb_tls_connection_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Wthread-safety"
        "-Werror"
    ];

    compile_multilib = "both";

    srcs = [
        "adb_ca_list.cpp"
        "tls_connection.cpp"
    ];
    target = {
        windows = {
            compile_multilib = "first";
            enabled = true;
        };
    };
    export_include_dirs = ["include"];

    host_supported = true;
    recovery_available = true;

    visibility = [
        "//bootable/recovery/minadbd:__subpackages__"
        "//system/core/adb:__subpackages__"
    ];

    shared_libs = [
        "libbase"
        "libcrypto"
        "liblog"
        "libssl"
    ];
};

libadb_tls_connection = cc_library {
    name = "libadb_tls_connection";
    defaults = ["libadb_tls_connection_defaults"];

    apex_available = [
        "com.android.adbd"
        "test_com.android.adbd"
    ];
};

#  For running atest (b/147158681)
libadb_tls_connection_static = cc_library_static {
    name = "libadb_tls_connection_static";
    defaults = ["libadb_tls_connection_defaults"];

    apex_available = [
        "//apex_available:platform"
    ];
};

in { inherit libadb_tls_connection libadb_tls_connection_defaults libadb_tls_connection_static; }
