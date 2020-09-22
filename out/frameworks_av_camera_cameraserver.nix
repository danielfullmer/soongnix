{ cc_binary }:
let

#  Copyright 2018 The Android Open Source Project
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

cameraserver = cc_binary {
    name = "cameraserver";

    srcs = ["main_cameraserver.cpp"];

    header_libs = [
        "libmedia_headers"
    ];

    shared_libs = [
        "libcameraservice"
        "liblog"
        "libutils"
        "libui"
        "libgui"
        "libbinder"
        "libhidlbase"
        "android.hardware.camera.common@1.0"
        "android.hardware.camera.provider@2.4"
        "android.hardware.camera.provider@2.5"
        "android.hardware.camera.provider@2.6"
        "android.hardware.camera.device@1.0"
        "android.hardware.camera.device@3.2"
        "android.hardware.camera.device@3.4"
    ];
    compile_multilib = "32";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    init_rc = ["cameraserver.rc"];

    vintf_fragments = [
        "manifest_android.frameworks.cameraservice.service@2.1.xml"
    ];
};

in { inherit cameraserver; }
