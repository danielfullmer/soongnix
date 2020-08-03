{ cc_library_shared, cc_library_static }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

libfilterpack_base = cc_library_static {
    name = "libfilterpack_base";
    srcs = [
        "native/base/geometry.cpp"
        "native/base/time_util.cpp"
    ];

    cflags = [
        "-DANDROID"
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

libfilterpack_imageproc = cc_library_shared {
    name = "libfilterpack_imageproc";

    srcs = [
        "native/imageproc/brightness.c"
        "native/imageproc/contrast.c"
        "native/imageproc/invert.c"
        "native/imageproc/to_rgba.c"
    ];

    shared_libs = [
        "liblog"
        "libutils"
        "libfilterfw"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"

        #  Bug: http://b/29823425 Disable constant-conversion warning triggered in
        #  native/imageproc/to_rgba.c
        "-Wno-constant-conversion"
    ];
};

in { inherit libfilterpack_base libfilterpack_imageproc; }
