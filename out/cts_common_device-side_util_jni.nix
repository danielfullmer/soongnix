{ cc_library_shared }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

libcts_jni = cc_library_shared {
    name = "libcts_jni";

    srcs = [
        "CtsJniOnLoad.cpp"
        "android_cts_FileUtils.cpp"
        "android_cts_CpuFeatures.cpp"
    ];

    shared_libs = [
        "libnativehelper_compat_libc++"
        "liblog"
        "libdl"
    ];

    static_libs = ["cpufeatures"];
    sdk_version = "19";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit libcts_jni; }
