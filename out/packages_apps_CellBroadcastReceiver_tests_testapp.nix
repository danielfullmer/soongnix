{ android_test }:
let

#  Copyright 2011, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CellBroadcastReceiverTests = android_test {
    name = "CellBroadcastReceiverTests";
    #  We only want this apk build for tests.
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
    ];
    static_libs = ["junit"];
    #  Include all test java files.
    srcs = [
        "src/com/android/cellbroadcastreceiver/tests/GsmSmsCbMessage.java"
        "src/com/android/cellbroadcastreceiver/tests/SendCdmaCmasMessages.java"
        "src/com/android/cellbroadcastreceiver/tests/SendGsmCmasMessages.java"
        "src/com/android/cellbroadcastreceiver/tests/SendTestBroadcastActivity.java"
        "src/com/android/cellbroadcastreceiver/tests/SendTestMessages.java"
        ":cellbroadcast-util-shared-srcs"
    ];
    #  Notice that we don't have to include the src files of Email because, by
    #  running the tests using an instrumentation targeting Eamil, we
    #  automatically get all of its classes loaded into our environment.
    platform_apis = true;
    #  Apk must be signed with platform signature in order to send test broadcasts.
    certificate = "platform";
    instrumentation_for = "CellBroadcastApp";
};

in { inherit CellBroadcastReceiverTests; }
