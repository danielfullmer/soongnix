{ cc_library_static }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

subdirs = [
    "tests"
];

libnvram-core = cc_library_static {
    name = "libnvram-core";
    host_supported = true;
    srcs = [
        "crypto_boringssl.cpp"
        "nvram_manager.cpp"
        "persistence.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];

    target = {
        host = {
            cflags = ["-DNVRAM_WIPE_STORAGE_SUPPORT"];
        };
    };

    export_include_dirs = ["include"];
    shared_libs = [
        "libnvram-messages"
        "libcrypto"
    ];
};

in { inherit libnvram-core; }
