{ filegroup }:
let

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

CtsSuspendHelpersConstants = filegroup {
    name = "CtsSuspendHelpersConstants";
    srcs = [
        "test-apps/SuspendTestApp/src/com/android/suspendapps/suspendtestapp/Constants.java"
        "test-apps/SuspendTestApp/src/com/android/suspendapps/suspendtestapp/SuspendTestActivity.java"
        "test-apps/SuspendTestApp/src/com/android/suspendapps/suspendtestapp/SuspendTestReceiver.java"
        "test-apps/SuspendTestApp/src/com/android/suspendapps/suspendtestapp/TestService.java"
        "test-apps/TestDeviceAdmin/src/com/android/suspendapps/testdeviceadmin/TestCommsReceiver.java"
        "test-apps/TestDeviceAdmin/src/com/android/suspendapps/testdeviceadmin/TestDeviceAdmin.java"
    ];
};

CtsSuspendHelpersAidl = filegroup {
    name = "CtsSuspendHelpersAidl";

    srcs = [
        "test-apps/SuspendTestApp/aidl/com/android/suspendapps/suspendtestapp/IBroadcastReporter.aidl"
        "test-apps/SuspendTestApp/aidl/com/android/suspendapps/suspendtestapp/ITestService.aidl"
    ];

    path = "test-apps/SuspendTestApp/aidl";
};

in { inherit CtsSuspendHelpersAidl CtsSuspendHelpersConstants; }
