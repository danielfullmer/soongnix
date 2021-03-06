{ android_test_helper_app }:
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

BstatsTestApp = android_test_helper_app {
    name = "BstatsTestApp";

    test_suites = [
        "device-tests"
    ];

    static_libs = ["coretests-aidl"];

    srcs = [
        "src/com/android/coretests/apps/bstatstestapp/BaseCmdReceiver.java"
        "src/com/android/coretests/apps/bstatstestapp/Common.java"
        "src/com/android/coretests/apps/bstatstestapp/IsolatedTestService.java"
        "src/com/android/coretests/apps/bstatstestapp/TestActivity.java"
        "src/com/android/coretests/apps/bstatstestapp/TestService.java"
    ];

    sdk_version = "current";
    certificate = "platform";
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
};

in { inherit BstatsTestApp; }
