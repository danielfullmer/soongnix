{ android_test_helper_app }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsIntentReceiverApp = android_test_helper_app {
    name = "CtsIntentReceiverApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/intent/receiver/BroadcastIntentReceiver.java"
        "src/com/android/cts/intent/receiver/ClearApplicationDataTest.java"
        "src/com/android/cts/intent/receiver/IntentReceiverActivity.java"
        "src/com/android/cts/intent/receiver/OwnerChangedBroadcastTest.java"
        "src/com/android/cts/intent/receiver/SimpleIntentReceiverActivity.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
    ];
    sdk_version = "current";
    min_sdk_version = "19";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsIntentReceiverApp; }
