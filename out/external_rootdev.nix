{ cc_binary, cc_library_shared }:
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

rootdev_CFLAGS = [
    "-D_BSD_SOURCE"
    "-D_FILE_OFFSET_BITS=64"
    "-D_LARGEFILE_SOURCE"
    "-include sys/sysmacros.h"
    "-Wall"
    "-Werror"
    "-Wno-deprecated-declarations"
    "-Wno-sign-compare"
];

#  Build the shared library.
librootdev = cc_library_shared {
    name = "librootdev";
    cflags = rootdev_CFLAGS;
    srcs = ["rootdev.c"];
    export_include_dirs = ["."];
};

#  Build the command line tool.
rootdev = cc_binary {
    name = "rootdev";
    cflags = rootdev_CFLAGS;
    shared_libs = ["librootdev"];
    srcs = ["main.c"];
};

in { inherit librootdev rootdev; }
