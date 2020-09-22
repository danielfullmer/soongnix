{ cc_binary }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

# #################################
"android.automotive.evs.manager@1.0" = cc_binary {
    name = "android.automotive.evs.manager@1.0";

    srcs = [
        "service.cpp"
        "Enumerator.cpp"
        "HalCamera.cpp"
        "VirtualCamera.cpp"
        "HalDisplay.cpp"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libutils"
        "libui"
        "libhidlbase"
        "libhardware"
        "android.hardware.automotive.evs@1.0"
    ];

    init_rc = ["android.automotive.evs.manager@1.0.rc"];

    cflags = ["-DLOG_TAG=\"EvsManagerV1_0\""] ++ [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
    ] ++ [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];

};

in { inherit "android.automotive.evs.manager@1.0"; }
