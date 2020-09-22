{ android_test_helper_app }:
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

#  Build the Call Screening test app.
#  This is intentionally packaged separately so that the app can use its own
#  package name which does not conflict with the CallScreeningService
#  associated with the CTS InCallService.

CallScreeningServiceTestApp = android_test_helper_app {
    name = "CallScreeningServiceTestApp";
    srcs = [
        "src/android/telecom/cts/screeningtestapp/CallScreeningServiceControl.java"
        "src/android/telecom/cts/screeningtestapp/CtsCallScreeningService.java"
        "src/android/telecom/cts/screeningtestapp/CtsPostCallActivity.java"
        "aidl/android/telecom/cts/screeningtestapp/ICallScreeningControl.aidl"
    ];
    sdk_version = "test_current";
    test_suites = [
        "cts"
        "vts10"
    ];
    optimize = {
        enabled = false;
    };
};

in { inherit CallScreeningServiceTestApp; }
