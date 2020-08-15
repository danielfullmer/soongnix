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

ONSTests = android_test {
    name = "ONSTests";
    srcs = [
        "src/com/android/ons/ONSBaseTest.java"
        "src/com/android/ons/ONSNetworkScanCtlrTest.java"
        "src/com/android/ons/ONSProfileSelectorTest.java"
        "src/com/android/ons/OpportunisticNetworkServiceTest.java"
    ];
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.mock"
        "android.test.base"
    ];
    static_libs = [
        "androidx.test.rules"
        "mockito-target"
        "platform-test-annotations"
    ];
    platform_apis = true;
    certificate = "platform";
    instrumentation_for = "ONS";
    test_suites = ["device-tests"];
};

in { inherit ONSTests; }
