{ cc_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

test-hwc2 = cc_test {
    name = "test-hwc2";
    defaults = ["surfaceflinger_defaults"];
    cflags = [
        "-DEGL_EGLEXT_PROTOTYPES"
        "-DGL_GLEXT_PROTOTYPES"
        "-fno-builtin"
        "-fstack-protector-all"
        "-g"
        "-Wextra"
    ];
    srcs = [
        "Hwc2Test.cpp"
        "Hwc2TestProperties.cpp"
        "Hwc2TestLayer.cpp"
        "Hwc2TestLayers.cpp"
        "Hwc2TestBuffer.cpp"
        "Hwc2TestClientTarget.cpp"
        "Hwc2TestVirtualDisplay.cpp"
        "Hwc2TestPixelComparator.cpp"
    ];
    static_libs = [
        "libadf"
        "libadfhwc"
        "libbase"
        "libmath"
    ];
    shared_libs = [
        "android.hardware.graphics.common@1.1"
        "libcutils"
        "libEGL"
        "libGLESv2"
        "libgui"
        "libhardware"
        "libhwui"
        "liblog"
        "libsync"
        "libui"
        "libutils"
    ];
};

in { inherit test-hwc2; }
