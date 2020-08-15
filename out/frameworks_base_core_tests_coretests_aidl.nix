{ java_test }:
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

coretests-aidl = java_test {
    name = "coretests-aidl";
    sdk_version = "current";
    srcs = [
        "com/android/frameworks/coretests/aidl/IBinderProxyCountingService.aidl"
        "com/android/frameworks/coretests/aidl/IBpcCallbackObserver.aidl"
        "com/android/frameworks/coretests/aidl/IBpcTestAppCmdService.aidl"
        "com/android/frameworks/coretests/aidl/IBpcTestServiceCmdService.aidl"
        "com/android/frameworks/coretests/aidl/ICmdCallback.aidl"
        "com/android/frameworks/coretests/aidl/ICmdReceiver.aidl"
        "com/android/frameworks/coretests/aidl/ITestRemoteCallback.aidl"
    ];
};

in { inherit coretests-aidl; }
