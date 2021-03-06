{ cc_binary, cc_defaults }:
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

libui_tools_default = cc_defaults {
    name = "libui_tools_default";
    clang_cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

lutgen = cc_binary {
    name = "lutgen";
    cppflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = ["libui"];
    srcs = ["lutgen.cpp"];
};

in { inherit libui_tools_default lutgen; }
