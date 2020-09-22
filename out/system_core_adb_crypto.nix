{ cc_defaults, cc_library, cc_library_static }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

libadb_crypto_defaults = cc_defaults {
    name = "libadb_crypto_defaults";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Wthread-safety"
        "-Werror"
    ];

    compile_multilib = "both";

    srcs = [
        "key.cpp"
        "rsa_2048_key.cpp"
        "x509_generator.cpp"
    ];

    target = {
        windows = {
            compile_multilib = "first";
            enabled = true;
        };
    };

    export_include_dirs = ["include"];

    visibility = [
        "//system/core/adb:__subpackages__"
        "//bootable/recovery/minadbd:__subpackages__"
    ];

    host_supported = true;
    recovery_available = true;

    shared_libs = [
        "libadb_protos"
        "libbase"
        "liblog"
        "libcrypto"
        "libcrypto_utils"
    ];
};

libadb_crypto = cc_library {
    name = "libadb_crypto";
    defaults = ["libadb_crypto_defaults"];

    apex_available = [
        "com.android.adbd"
        "test_com.android.adbd"
    ];
};

#  For running atest (b/147158681)
libadb_crypto_static = cc_library_static {
    name = "libadb_crypto_static";
    defaults = ["libadb_crypto_defaults"];

    apex_available = [
        "//apex_available:platform"
    ];

    static_libs = [
        "libadb_protos_static"
    ];
};

in { inherit libadb_crypto libadb_crypto_defaults libadb_crypto_static; }