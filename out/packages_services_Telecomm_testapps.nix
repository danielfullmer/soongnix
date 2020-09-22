{ android_test }:
let

#
#  Copyright (C) 2013 The Android Open Source Project
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

TelecomTestApps = android_test {
    name = "TelecomTestApps";
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "android-ex-camera2"
        "guava"
    ];
    srcs = [
        "src/com/android/server/telecom/testapps/CallListAdapter.java"
        "src/com/android/server/telecom/testapps/CallNotificationReceiver.java"
        "src/com/android/server/telecom/testapps/CallRedirectionActivity.java"
        "src/com/android/server/telecom/testapps/CallServiceNotifier.java"
        "src/com/android/server/telecom/testapps/CameraThread.java"
        "src/com/android/server/telecom/testapps/HandoverActivity.java"
        "src/com/android/server/telecom/testapps/IncomingSelfManagedCallActivity.java"
        "src/com/android/server/telecom/testapps/PostCallActivity.java"
        "src/com/android/server/telecom/testapps/RttChatbot.java"
        "src/com/android/server/telecom/testapps/SelfManagedCallList.java"
        "src/com/android/server/telecom/testapps/SelfManagedCallListAdapter.java"
        "src/com/android/server/telecom/testapps/SelfManagedCallNotificationReceiver.java"
        "src/com/android/server/telecom/testapps/SelfManagedCallingActivity.java"
        "src/com/android/server/telecom/testapps/SelfManagedConnection.java"
        "src/com/android/server/telecom/testapps/SelfManagedConnectionService.java"
        "src/com/android/server/telecom/testapps/TestCallActivity.java"
        "src/com/android/server/telecom/testapps/TestCallList.java"
        "src/com/android/server/telecom/testapps/TestCallRedirectionService.java"
        "src/com/android/server/telecom/testapps/TestCallScreeningService.java"
        "src/com/android/server/telecom/testapps/TestCertActivity.java"
        "src/com/android/server/telecom/testapps/TestConnectionManager.java"
        "src/com/android/server/telecom/testapps/TestConnectionService.java"
        "src/com/android/server/telecom/testapps/TestConnectionServiceReceiver.java"
        "src/com/android/server/telecom/testapps/TestDialerActivity.java"
        "src/com/android/server/telecom/testapps/TestInCallServiceBroadcastReceiver.java"
        "src/com/android/server/telecom/testapps/TestInCallServiceImpl.java"
        "src/com/android/server/telecom/testapps/TestInCallUI.java"
        "src/com/android/server/telecom/testapps/TestManagedVideoProvider.java"
        "src/com/android/server/telecom/testapps/TestRttActivity.java"
        "src/com/android/server/telecom/testapps/TestUssdActivity.java"
        "src/com/android/server/telecom/testapps/TestVideoProvider.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit TelecomTestApps; }
