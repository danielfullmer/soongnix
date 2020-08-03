{ cc_library_shared }:
let

#  Copyright 2018, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

libgamecore_sample = cc_library_shared {
    name = "libgamecore_sample";
    sdk_version = "26";
    srcs = [
        "src/cpp/circle.cpp"
        "src/cpp/common.cpp"
        "src/cpp/shader.cpp"
        "src/cpp/vecmath.cpp"
        "src/cpp/renderer.cpp"
        "src/cpp/main.cpp"
    ];
    stl = "libc++";
    shared_libs = [
        "libagq"
        "liblog"
        "libandroid"
        "libEGL"
        "libGLESv2"
    ];
    static_libs = ["android_native_app_glue"];
    ldflags = [
        "-uANativeActivity_onCreate"
    ];
    export_include_dirs = ["src/cpp"];
};

in { inherit libgamecore_sample; }
