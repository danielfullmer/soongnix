{ cc_binary, cc_library }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

libbz = cc_library {
    name = "libbz";
    host_supported = true;
    recovery_available = true;
    arch = {
        arm = {
            #  measurements show that the ARM version of ZLib is about x1.17 faster
            #  than the thumb one...
            instruction_set = "arm";
        };
    };
    cflags = [
        "-O3"
        "-DUSE_MMAP"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    export_include_dirs = ["."];
    srcs = [
        "blocksort.c"
        "bzlib.c"
        "compress.c"
        "crctable.c"
        "decompress.c"
        "huffman.c"
        "randtable.c"
    ];
    sdk_version = "9";
    stl = "none";
};

bzip2 = cc_binary {
    name = "bzip2";
    host_supported = true;

    cflags = [
        "-Werror"
        "-Wno-unused-parameter"
    ];
    shared_libs = ["libbz"];
    srcs = ["bzip2.c"];
    stl = "none";
    symlinks = [
        "bunzip2"
        "bzcat"
    ];
};

in { inherit bzip2 libbz; }
