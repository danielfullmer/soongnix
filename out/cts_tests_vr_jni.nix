{ cc_library_shared }:
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

libctsvrextensions_jni = cc_library_shared {
    name = "libctsvrextensions_jni";
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
    srcs = ["VrExtensionsJni.cpp"];
    include_dirs = [
        "system/core/include"
        "frameworks/native/opengl/include"
    ];
    shared_libs = [
        "libandroid"
        "libnativehelper_compat_libc++"
        "liblog"
        "libEGL"
        "libGLESv2"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

in { inherit libctsvrextensions_jni; }
