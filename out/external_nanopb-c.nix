{ cc_defaults, cc_library_static }:
let

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
#

libprotobuf-c-nano-defaults = cc_defaults {
    name = "libprotobuf-c-nano-defaults";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "pb_common.c"
        "pb_decode.c"
        "pb_encode.c"
    ];
    sdk_version = "19";
    export_include_dirs = ["."];
    vendor_available = true;
};

libprotobuf-c-nano = cc_library_static {
    name = "libprotobuf-c-nano";
    defaults = ["libprotobuf-c-nano-defaults"];
};

libprotobuf-c-nano-enable_malloc = cc_library_static {
    name = "libprotobuf-c-nano-enable_malloc";
    defaults = ["libprotobuf-c-nano-defaults"];

    cflags = ["-DPB_ENABLE_MALLOC"];
};

libprotobuf-c-nano-16bit = cc_library_static {
    name = "libprotobuf-c-nano-16bit";
    defaults = ["libprotobuf-c-nano-defaults"];

    cflags = ["-DPB_FIELD_16BIT"];
};

libprotobuf-c-nano-enable_malloc-16bit = cc_library_static {
    name = "libprotobuf-c-nano-enable_malloc-16bit";
    defaults = ["libprotobuf-c-nano-defaults"];

    cflags = [
        "-DPB_ENABLE_MALLOC"
        "-DPB_FIELD_16BIT"
    ];
};

libprotobuf-c-nano-32bit = cc_library_static {
    name = "libprotobuf-c-nano-32bit";
    defaults = ["libprotobuf-c-nano-defaults"];

    cflags = ["-DPB_FIELD_32BIT"];
};

libprotobuf-c-nano-enable_malloc-32bit = cc_library_static {
    name = "libprotobuf-c-nano-enable_malloc-32bit";
    defaults = ["libprotobuf-c-nano-defaults"];

    cflags = [
        "-DPB_ENABLE_MALLOC"
        "-DPB_FIELD_32BIT"
    ];
};

in { inherit libprotobuf-c-nano libprotobuf-c-nano-16bit libprotobuf-c-nano-32bit libprotobuf-c-nano-defaults libprotobuf-c-nano-enable_malloc libprotobuf-c-nano-enable_malloc-16bit libprotobuf-c-nano-enable_malloc-32bit; }
