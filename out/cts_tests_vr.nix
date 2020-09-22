{ android_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

CtsVrTestCases = android_test {
    name = "CtsVrTestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    jni_libs = [
        "libctsvrextensions_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/vr/cts/CtsActivity.java"
        "src/android/vr/cts/OpenGLESActivity.java"
        "src/android/vr/cts/RendererBasicTest.java"
        "src/android/vr/cts/RendererProtectedTexturesTest.java"
        "src/android/vr/cts/RendererRefreshRateTest.java"
        "src/android/vr/cts/VrCpuTest.java"
        "src/android/vr/cts/VrDisplayTest.java"
        "src/android/vr/cts/VrExtensionBehaviorTest.java"
        "src/android/vr/cts/VrFeaturesTest.java"
        "src/android/vr/cts/VrSetFIFOThreadTest.java"
        ":CtsVerifierMockVrListenerServiceFiles"
    ];
    sdk_version = "test_current";
    min_sdk_version = "14";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsVrTestCases; }
