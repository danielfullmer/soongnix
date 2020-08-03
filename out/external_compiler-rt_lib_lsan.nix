{ cc_library_static }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

liblsan = cc_library_static {
    name = "liblsan";
    host_supported = true;
    defaults = ["asan_arch_defaults"];
    include_dirs = [
        "external/compiler-rt/lib"
        "external/compiler-rt/include"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-fno-exceptions"
        "-Wno-covered-switch-default"
        "-Wno-non-virtual-dtor"
        "-Wno-sign-compare"
        "-Wno-unused-parameter"
        "-std=c++11"
        "-fno-rtti"
        "-fno-builtin"
        "-Wall"
        "-Werror"
    ];
    srcs = [
        "lsan_common.cc"
        "lsan_common_linux.cc"
    ];

    sdk_version = "19";
    stl = "none";

    sanitize = {
        never = true;
    };
};

in { inherit liblsan; }
