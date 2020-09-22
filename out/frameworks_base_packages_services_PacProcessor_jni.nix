{ cc_library_shared }:
let

#
#  Copyright (C) 2013 The Android Open Source Project
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

libjni_pacprocessor = cc_library_shared {
    name = "libjni_pacprocessor";

    srcs = [
        "jni_init.cpp"
        "com_android_pacprocessor_PacNative.cpp"
    ];

    shared_libs = [
        "libandroidfw"
        "libandroid_runtime"
        "liblog"
        "libutils"
        "libnativehelper"
        "libpac"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
    sanitize = {
        cfi = true;
    };
};

in { inherit libjni_pacprocessor; }
