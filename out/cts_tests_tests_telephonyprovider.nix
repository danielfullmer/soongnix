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

CtsTelephonyProviderTestCases = android_test {
    name = "CtsTelephonyProviderTestCases";
    defaults = ["cts_defaults"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "androidx.test.core"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/telephonyprovider/TelephonyProviderActivity.java"
        "src/android/telephonyprovider/TelephonyProviderService.java"
        "src/android/telephonyprovider/TelephonyProviderSmsDeliverReceiver.java"
        "src/android/telephonyprovider/TelephonyProviderWapPushDeliverReceiver.java"
        "src/android/telephonyprovider/cts/CellBroadcastProviderTest.java"
        "src/android/telephonyprovider/cts/DefaultSmsAppHelper.java"
        "src/android/telephonyprovider/cts/LockedMessageTest.java"
        "src/android/telephonyprovider/cts/MmsPartTest.java"
        "src/android/telephonyprovider/cts/MmsTest.java"
        "src/android/telephonyprovider/cts/PduHeaders.java"
        "src/android/telephonyprovider/cts/SmsConversationTest.java"
        "src/android/telephonyprovider/cts/SmsTest.java"
        "src/android/telephonyprovider/cts/SmsTestHelper.java"
        "src/android/telephonyprovider/cts/ThreadsTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsTelephonyProviderTestCases; }
