{ cc_library_host_static }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

libheader-checker-proto = cc_library_host_static {
    name = "libheader-checker-proto";

    defaults = ["llvm-build-host-tools-defaults"];

    srcs = [
        "abi_dump.proto"
        "abi_diff.proto"
    ];

    proto = {
        export_proto_headers = true;
        type = "full";
        canonical_path_from_root = false;
    };

    shared_libs = ["libc++_host"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wcast-qual"
        "-Wno-long-long"
        "-Wno-unused-parameter"
    ];

    export_include_dirs = ["."];

    target = {
        windows = {
            enabled = false;
        };
    };

    stl = "none";
    compile_multilib = "64";
};

in { inherit libheader-checker-proto; }
