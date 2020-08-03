{ cc_binary, cc_library, java_library }:
let

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

libbrotli = cc_library {
    name = "libbrotli";
    host_supported = true;
    recovery_available = true;
    cflags = [
        "-Werror"
        "-O2"
    ];
    export_include_dirs = ["c/include"];
    srcs = [
        "c/common/*.c"
        "c/dec/*.c"
        "c/enc/*.c"
    ];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
    stl = "none";
};

brotli = cc_binary {
    name = "brotli";
    host_supported = true;
    cflags = ["-Werror"];
    srcs = ["c/tools/brotli.c"];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
    shared_libs = ["libbrotli"];
};

#
#  Support for brotli in java code.
#

brotli-java = java_library {
    name = "brotli-java";
    host_supported = true;
    hostdex = true;
    srcs = ["java/**/*.java"];
    exclude_srcs = ["java/**/*Test.java"];
    sdk_version = "current";
};

in { inherit brotli brotli-java libbrotli; }
