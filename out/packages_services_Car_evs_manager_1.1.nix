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
"android.automotive.evs.manager@1.1" = cc_binary {
    name = "android.automotive.evs.manager@1.1";

    srcs = [
        "Enumerator.cpp"
        "HalCamera.cpp"
        "HalDisplay.cpp"
        "VirtualCamera.cpp"
        "service.cpp"
        "stats/CameraUsageStats.cpp"
        "stats/LooperWrapper.cpp"
        "stats/StatsCollector.cpp"
        "sync/unique_fd.cpp"
        "sync/unique_fence.cpp"
        "sync/unique_timeline.cpp"
    ];

    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "libbase"
        "libcamera_metadata"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libprocessgroup"
        "libstatslog"
        "libsync"
        "libui"
        "libutils"
    ];

    init_rc = ["android.automotive.evs.manager@1.1.rc"];

    cflags = ["-DLOG_TAG=\"EvsManagerV1_1\""] ++ [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS"
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
        "-Wthread-safety"
    ];

    include_dirs = [
        "system/core/libsync"
    ];

    product_variables = {
        debuggable = {
            cflags = [
                "-DEVS_DEBUG"
            ];
        };
    };

    vintf_fragments = [
        "manifest_android.automotive.evs.manager@1.1.xml"
    ];
};

in { inherit "android.automotive.evs.manager@1.1"; }
