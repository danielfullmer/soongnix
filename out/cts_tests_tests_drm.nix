{ android_test }:
let

#  Copyright (C) 2011 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsDrmTestCases = android_test {
    name = "CtsDrmTestCases";
    defaults = ["cts_defaults"];
    #  Include both the 32 and 64 bit versions of libs
    compile_multilib = "both";
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/android/drm/cts/Config.java"
        "src/android/drm/cts/ConfigFactory.java"
        "src/android/drm/cts/DRMTest.java"
        "src/android/drm/cts/DrmEventTest.java"
        "src/android/drm/cts/DrmInfoRequestTest.java"
        "src/android/drm/cts/DrmInfoStatusTest.java"
        "src/android/drm/cts/DrmInfoTest.java"
        "src/android/drm/cts/DrmSupportInfoTest.java"
        "src/android/drm/cts/NativeCodeTest.java"
        "src/android/drm/cts/configs/FwdLockConfig.java"
        "src/android/drm/cts/configs/PassthruConfig.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    jni_libs = [
        "libctsdrm_jni"
        "libdrmtestplugin"
    ];
    platform_apis = true;
};

in { inherit CtsDrmTestCases; }
