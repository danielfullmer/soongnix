{ android_test }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

TelecomCarModeApp = android_test {
    name = "TelecomCarModeApp";
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "guava"
    ];
    srcs = [
        "src/com/android/server/telecom/carmodedialer/CallListAdapter.java"
        "src/com/android/server/telecom/carmodedialer/CarModeCallList.java"
        "src/com/android/server/telecom/carmodedialer/CarModeDialerActivity.java"
        "src/com/android/server/telecom/carmodedialer/CarModeInCallServiceImpl.java"
        "src/com/android/server/telecom/carmodedialer/CarModeInCallUI.java"
        "src/com/android/server/telecom/carmodedialer/TestInCallServiceBroadcastReceiver.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit TelecomCarModeApp; }
