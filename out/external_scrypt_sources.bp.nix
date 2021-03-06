{ cc_defaults }:
let

#  Auto-generated - DO NOT EDIT!
#  To regenerate, edit scrypt.config, then run:
#      ./import_scrypt.sh import /path/to/scrypt-1.1.6.tar.gz
#

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

libscrypt_sources = cc_defaults {
    name = "libscrypt_sources";

    cflags = [
        "-DHAVE_CONFIG_H"
        "-DUSE_OPENSSL_PBKDF2"
        "-Wall"
        "-Werror"
        "-Wno-implicit-function-declaration"
        "-Wno-unused-variable"
    ];

    export_include_dirs = [
        "lib/crypto"
    ];

    local_include_dirs = [
        "lib/util"
    ];

    srcs = [
        "lib/crypto/crypto_scrypt-ref.c"
    ];

    arch = {
        arm = {
            neon = {
                srcs = [
                    "lib/crypto/crypto_scrypt-neon.c"
                ];
                exclude_srcs = [
                    "lib/crypto/crypto_scrypt-ref.c"
                ];
            };
        };
        arm64 = {
            srcs = [
                "lib/crypto/crypto_scrypt-neon.c"
            ];
            exclude_srcs = [
                "lib/crypto/crypto_scrypt-ref.c"
            ];
        };
        x86 = {
            srcs = [
                "lib/crypto/crypto_scrypt-sse.c"
            ];
            exclude_srcs = [
                "lib/crypto/crypto_scrypt-ref.c"
            ];
        };
        x86_64 = {
            srcs = [
                "lib/crypto/crypto_scrypt-sse.c"
            ];
            exclude_srcs = [
                "lib/crypto/crypto_scrypt-ref.c"
            ];
        };
    };
};

in { inherit libscrypt_sources; }
