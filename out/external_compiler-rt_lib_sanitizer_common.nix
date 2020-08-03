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

# ###############################################################################
#  Host modules

libsan = cc_library_static {
    name = "libsan";
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
        "-fno-rtti"
        "-fno-builtin"
        "-std=c++11"
        "-Wno-non-virtual-dtor"
        "-Wno-unused-parameter"
    ];
    srcs = [
        "*.cc"
    ];
    exclude_srcs = [
        "sanitizer_common_nolibc.cc"
    ];
    arch = {
        x86_64 = {
            srcs = [
                "sanitizer_linux_x86_64.S"
            ];
        };
    };
    stl = "none";
    sanitize = {
        never = true;
    };
    compile_multilib = "both";
    target = {
        darwin = {
            enabled = false;
        };
    };
};

subdirs = ["tests"];

#  ANDROIDMK TRANSLATION ERROR: unsupported conditional
#  ifndef SANITIZE_HOST
#  ANDROIDMK TRANSLATION ERROR: unsupported include
#  include $(LOCAL_PATH)/tests/Android.mk
#  ANDROIDMK TRANSLATION ERROR: endif from unsupported contitional
#  endif

in { inherit libsan; }
