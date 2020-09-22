{ android_test }:
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

CtsSyncManagerTestsCases = android_test {
    name = "CtsSyncManagerTestsCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "CtsSyncManagerCommon"
        "androidx.test.rules"
        "androidx.legacy_legacy-support-v4"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/content/syncmanager/cts/BroadcastRpc.java"
        "src/android/content/syncmanager/cts/CtsSyncManagerTest.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsSyncManagerTestsCases; }
