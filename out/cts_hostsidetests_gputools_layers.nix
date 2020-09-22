{ android_test_helper_app, cc_test_library }:
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

libVkLayer_nullLayerA = cc_test_library {
    name = "libVkLayer_nullLayerA";
    gtest = false;
    srcs = ["jni/nullLayer.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=A"
    ];
    shared_libs = [
        "libandroid"
        "libvulkan"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libVkLayer_nullLayerB = cc_test_library {
    name = "libVkLayer_nullLayerB";
    gtest = false;
    srcs = ["jni/nullLayer.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=B"
    ];
    shared_libs = [
        "libandroid"
        "libvulkan"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libVkLayer_nullLayerC = cc_test_library {
    name = "libVkLayer_nullLayerC";
    gtest = false;
    srcs = ["jni/nullLayer.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=C"
    ];
    shared_libs = [
        "libandroid"
        "libvulkan"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libVkLayer_nullLayerD = cc_test_library {
    name = "libVkLayer_nullLayerD";
    gtest = false;
    srcs = ["jni/nullLayer.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=D"
        "-DDEBUGUTILSPECVERSION=1"
    ];
    shared_libs = [
        "libandroid"
        "libvulkan"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libVkLayer_nullLayerE = cc_test_library {
    name = "libVkLayer_nullLayerE";
    gtest = false;
    srcs = ["jni/nullLayer.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=E"
        "-DDEBUGUTILSPECVERSION=2"
    ];
    shared_libs = [
        "libandroid"
        "libvulkan"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libGLES_glesLayerA = cc_test_library {
    name = "libGLES_glesLayerA";
    gtest = false;
    srcs = ["jni/glesLayer.cpp"];
    cflags = [
        "-std=c++14"
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=A"
    ];
    shared_libs = [
        "libandroid"
        "libEGL"
        "libGLESv3"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libGLES_glesLayerB = cc_test_library {
    name = "libGLES_glesLayerB";
    gtest = false;
    srcs = ["jni/glesLayer.cpp"];
    cflags = [
        "-std=c++14"
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=B"
    ];
    shared_libs = [
        "libandroid"
        "libEGL"
        "libGLESv3"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

libGLES_glesLayerC = cc_test_library {
    name = "libGLES_glesLayerC";
    gtest = false;
    srcs = ["jni/glesLayer.cpp"];
    cflags = [
        "-std=c++14"
        "-Wall"
        "-Werror"
        "-fvisibility=hidden"
        "-DLAYERNAME=C"
    ];
    shared_libs = [
        "libandroid"
        "libEGL"
        "libGLESv3"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

CtsGpuToolsRootlessGpuDebugApp-LAYERS = android_test_helper_app {
    name = "CtsGpuToolsRootlessGpuDebugApp-LAYERS";
    defaults = ["cts_support_defaults"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    compile_multilib = "both";
    jni_libs = [
        "libVkLayer_nullLayerA"
        "libVkLayer_nullLayerB"
        "libVkLayer_nullLayerC"
        "libVkLayer_nullLayerD"
        "libVkLayer_nullLayerE"
    ];
    use_embedded_native_libs = false;
    stl = "c++_shared";
};

CtsGpuToolsRootlessGpuDebugApp-GLES_LAYERS = android_test_helper_app {
    name = "CtsGpuToolsRootlessGpuDebugApp-GLES_LAYERS";
    defaults = ["cts_support_defaults"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    compile_multilib = "both";
    jni_libs = [
        "libGLES_glesLayerA"
        "libGLES_glesLayerB"
        "libGLES_glesLayerC"
    ];
    use_embedded_native_libs = false;
    aaptflags = [
        "--rename-manifest-package android.rootlessgpudebug.GLES_LAYERS.app"
    ];
    stl = "c++_shared";
};

in { inherit CtsGpuToolsRootlessGpuDebugApp-GLES_LAYERS CtsGpuToolsRootlessGpuDebugApp-LAYERS libGLES_glesLayerA libGLES_glesLayerB libGLES_glesLayerC libVkLayer_nullLayerA libVkLayer_nullLayerB libVkLayer_nullLayerC libVkLayer_nullLayerD libVkLayer_nullLayerE; }
