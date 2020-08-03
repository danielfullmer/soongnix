{ cc_defaults, cc_library_static, cc_test }:
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

hwc_tests_defaults = cc_defaults {

    name = "hwc_tests_defaults";
    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

libhwcTest = cc_library_static {

    name = "libhwcTest";
    srcs = ["hwcTestLib.cpp"];

    static_libs = [
        "libarect"
        "libglTest"
        "libtestUtil"
    ];
    shared_libs = [
        "libui"
        "libnativewindow"
    ];
    defaults = ["hwc_tests_defaults"];
};

hwc_lib_defaults = cc_defaults {

    name = "hwc_lib_defaults";
    shared_libs = [
        "libcutils"
        "libEGL"
        "libGLESv2"
        "libhardware"
        "liblog"
        "libui"
        "libutils"
        "libnativewindow"
    ];

    gtest = false;

    static_libs = [
        "libglTest"
        "libhwcTest"
        "libtestUtil"
    ];
};

hwcStress = cc_test {

    name = "hwcStress";
    srcs = ["hwcStress.cpp"];

    defaults = [
        "hwc_lib_defaults"
        "hwc_tests_defaults"
    ];
};

hwcRects = cc_test {

    name = "hwcRects";
    srcs = ["hwcRects.cpp"];

    defaults = [
        "hwc_lib_defaults"
        "hwc_tests_defaults"
    ];
};

hwcColorEquiv = cc_test {

    name = "hwcColorEquiv";
    srcs = ["hwcColorEquiv.cpp"];

    defaults = [
        "hwc_lib_defaults"
        "hwc_tests_defaults"
    ];
};

hwcCommit = cc_test {

    name = "hwcCommit";
    srcs = ["hwcCommit.cpp"];

    defaults = [
        "hwc_lib_defaults"
        "hwc_tests_defaults"
    ];
};

in { inherit hwcColorEquiv hwcCommit hwcRects hwcStress hwc_lib_defaults hwc_tests_defaults libhwcTest; }
