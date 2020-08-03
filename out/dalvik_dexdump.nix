{ cc_binary }:
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

#
#  dexdump, similar in purpose to objdump.
#

dexdump = cc_binary {
    name = "dexdump";
    host_supported = true;

    srcs = ["DexDump.cpp"];
    include_dirs = ["dalvik"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        android = {
            static_libs = [
                "libdex"
                "libbase"
            ];
            shared_libs = [
                "libz"
                "liblog"
            ];
        };
        host = {
            static_libs = [
                "libdex"
                "libbase"
                "liblog"
                "libz"
            ];
        };
        windows = {
            enabled = true;
        };
    };
};

in { inherit dexdump; }
