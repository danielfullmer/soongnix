{ android_test }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

CaptivePortalLoginTests = android_test {
    name = "CaptivePortalLoginTests";
    srcs = [
        "src/com/android/captiveportallogin/CaptivePortalLoginActivityTest.java"
        "src/com/android/captiveportallogin/DownloadServiceTest.kt"
        "src/com/android/captiveportallogin/RequestDismissKeyguardActivity.kt"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";

    static_libs = [
        "androidx.test.rules"
        "androidx.test.uiautomator"
        "mockito-target-extended-minus-junit4"
        "CaptivePortalLoginTestLib"
        "android.test.runner-minus-junit"
        "androidx.test.core"
        "androidx.test.espresso.intents"
        "androidx.test.espresso.web"
        "androidx.test.ext.junit"
        "androidx.test.uiautomator"
        "kotlin-test"
        "libnanohttpd"
        "net-tests-utils"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];
};

in { inherit CaptivePortalLoginTests; }
