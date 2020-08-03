{ cc_library_static }:
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

libbionic_tests_headers_posix = cc_library_static {
    name = "libbionic_tests_headers_posix";
    srcs = ["*.c"];
    cflags = [
        "-Wno-absolute-value" #  broken clang diagnostic that doesn't understand <tgmath.h>
        "-Wno-deprecated"
        "-Werror"
        "-D_POSIX_C_SOURCE=200809L"
        "-D_XOPEN_SOURCE=700"
    ];
    host_supported = true;
    target = {
        darwin = {
            enabled = false;
        };
    };
};

in { inherit libbionic_tests_headers_posix; }
