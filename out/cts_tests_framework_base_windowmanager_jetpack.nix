{ android_library_import, android_test, java_library }:
let

#  Copyright (C) 2020 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

cts_window-extensions_nodeps = android_library_import {
    name = "cts_window-extensions_nodeps";
    aars = ["window-extensions-release.aar"];
    sdk_version = "current";
};

cts_window-extensions = java_library {
    name = "cts_window-extensions";
    sdk_version = "current";
    static_libs = [
        "cts_window-extensions_nodeps"
    ];
    installable = false;
};

cts_window-sidecar_nodeps = android_library_import {
    name = "cts_window-sidecar_nodeps";
    aars = ["window-sidecar-release.aar"];
    sdk_version = "current";
};

cts_window-sidecar = java_library {
    name = "cts_window-sidecar";
    sdk_version = "current";
    static_libs = [
        "cts_window-sidecar_nodeps"
    ];
    installable = false;
};

CtsWindowManagerJetpackTestCases = android_test {
    name = "CtsWindowManagerJetpackTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/server/wm/jetpack/ExtensionTest.java"
        "src/android/server/wm/jetpack/ExtensionUtils.java"
        "src/android/server/wm/jetpack/JetpackExtensionTestBase.java"
        "src/android/server/wm/jetpack/TestActivity.java"
        "src/android/server/wm/jetpack/TestConfigChangeHandlingActivity.java"
        "src/android/server/wm/jetpack/TestGetWindowLayoutInfoActivity.java"
        "src/android/server/wm/jetpack/Version.java"
        "src/android/server/wm/jetpack/wrapper/TestDeviceState.java"
        "src/android/server/wm/jetpack/wrapper/TestDisplayFeature.java"
        "src/android/server/wm/jetpack/wrapper/TestInterfaceCompat.java"
        "src/android/server/wm/jetpack/wrapper/TestWindowLayoutInfo.java"
        "src/android/server/wm/jetpack/wrapper/extensionwrapperimpl/TestExtensionCompat.java"
        "src/android/server/wm/jetpack/wrapper/extensionwrapperimpl/TestExtensionDeviceState.java"
        "src/android/server/wm/jetpack/wrapper/extensionwrapperimpl/TestExtensionDisplayFeature.java"
        "src/android/server/wm/jetpack/wrapper/extensionwrapperimpl/TestExtensionWindowLayoutInfo.java"
        "src/android/server/wm/jetpack/wrapper/sidecarwrapperimpl/TestSidecarCompat.java"
        "src/android/server/wm/jetpack/wrapper/sidecarwrapperimpl/TestSidecarDeviceState.java"
        "src/android/server/wm/jetpack/wrapper/sidecarwrapperimpl/TestSidecarDisplayFeature.java"
        "src/android/server/wm/jetpack/wrapper/sidecarwrapperimpl/TestSidecarWindowLayoutInfo.java"
    ];
    static_libs = [
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "cts-wm-util"
        "platform-test-annotations"
    ];
    libs = [
        "android.test.base.stubs"
        "cts_window-extensions"
        "cts_window-sidecar"
    ];
    test_suites = [
        "cts"
        "vts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsWindowManagerJetpackTestCases cts_window-extensions cts_window-extensions_nodeps cts_window-sidecar cts_window-sidecar_nodeps; }
