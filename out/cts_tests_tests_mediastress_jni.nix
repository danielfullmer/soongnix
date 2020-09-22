{ cc_library_shared }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

libctsmediastress_jni = cc_library_shared {
    name = "libctsmediastress_jni";
    srcs = ["native-media-jni.cpp"];
    include_dirs = ["frameworks/wilhelm/include"];
    shared_libs = [
        "libandroid"
        "libnativehelper_compat_libc++"
        "liblog"
        "libOpenMAXAL"
    ];
    stl = "none";
    sdk_version = "current";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
};

in { inherit libctsmediastress_jni; }
