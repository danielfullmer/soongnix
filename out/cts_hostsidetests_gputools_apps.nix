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

libctsgputools_jni = cc_test_library {
    name = "libctsgputools_jni";
    gtest = false;
    srcs = [
        "jni/CtsGpuToolsJniOnLoad.cpp"
        "jni/android_gputools_cts_RootlessGpuDebug.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libandroid"
        "libvulkan"
        "liblog"
        "libandroid"
        "libvulkan"
        "libEGL"
        "libGLESv3"
        "liblog"
    ];
    stl = "c++_shared";
    sdk_version = "current";
};

CtsGpuToolsRootlessGpuDebugApp-DEBUG = android_test_helper_app {
    name = "CtsGpuToolsRootlessGpuDebugApp-DEBUG";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/rootlessgpudebug/app/RootlessGpuDebugDeviceActivity.java"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    compile_multilib = "both";
    jni_libs = ["libctsgputools_jni"];
    aaptflags = [
        "--rename-manifest-package"
        "android.rootlessgpudebug.DEBUG.app"
        "--debug-mode"
    ];
    use_embedded_native_libs = false;
    stl = "c++_shared";
};

CtsGpuToolsRootlessGpuDebugApp-RELEASE = android_test_helper_app {
    name = "CtsGpuToolsRootlessGpuDebugApp-RELEASE";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/rootlessgpudebug/app/RootlessGpuDebugDeviceActivity.java"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    compile_multilib = "both";
    jni_libs = [
        "libctsgputools_jni"
        "libVkLayer_nullLayerC"
        "libGLES_glesLayerC"
    ];
    aaptflags = [
        "--rename-manifest-package android.rootlessgpudebug.RELEASE.app"
    ];
    use_embedded_native_libs = false;
    stl = "c++_shared";
};

CtsGpuToolsRootlessGpuDebugApp-INJECT = android_test_helper_app {
    name = "CtsGpuToolsRootlessGpuDebugApp-INJECT";
    defaults = ["cts_support_defaults"];
    srcs = ["src/android/rootlessgpudebug/app/RootlessGpuDebugDeviceActivity.java"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    compile_multilib = "both";
    jni_libs = [
        "libctsgputools_jni"
        "libVkLayer_nullLayerC"
        "libGLES_glesLayerC"
    ];
    manifest = "inject/AndroidManifest.xml";
    aaptflags = [
        "--rename-manifest-package android.rootlessgpudebug.INJECT.app"
    ];
    use_embedded_native_libs = false;
    stl = "c++_shared";
};

in { inherit CtsGpuToolsRootlessGpuDebugApp-DEBUG CtsGpuToolsRootlessGpuDebugApp-INJECT CtsGpuToolsRootlessGpuDebugApp-RELEASE libctsgputools_jni; }
