{ cc_library_static }:
let

#
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
#
#

libinterception = cc_library_static {
    name = "libinterception";
    host_supported = true;
    sdk_version = "19";

    include_dirs = ["external/compiler-rt/lib"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = [
        "-fvisibility=hidden"
        "-fno-exceptions"
        "-std=c++11"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "interception_linux.cc"
        "interception_mac.cc"
        "interception_type_test.cc"
        "interception_win.cc"
    ];
    stl = "none";
    sanitize = {
        never = true;
    };
    compile_multilib = "both";
};

in { inherit libinterception; }
