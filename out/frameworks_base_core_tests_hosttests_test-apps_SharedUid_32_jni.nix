{ cc_test_library }:
let

#
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

#  This makefile supplies the rules for building a library of JNI code for
#  use by our example of how to bundle a shared library with an APK.

libpmtest32 = cc_test_library {

    #  This is the target being built.
    name = "libpmtest32";
    compile_multilib = "32";

    #  All of the source files that we will compile.
    srcs = ["native.cpp"];

    shared_libs = ["liblog"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];

    sdk_version = "current";
};

in { inherit libpmtest32; }
