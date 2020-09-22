{ android_test_helper_app }:
let

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

CallRedirectionServiceTestApp = android_test_helper_app {
    name = "CallRedirectionServiceTestApp";
    srcs = [
        "src/android/telecom/cts/redirectiontestapp/CtsCallRedirectionService.java"
        "src/android/telecom/cts/redirectiontestapp/CtsCallRedirectionServiceController.java"
        "aidl/android/telecom/cts/redirectiontestapp/ICtsCallRedirectionServiceController.aidl"
    ];
    aidl = {
        local_include_dirs = ["aidl/"];
    };
    sdk_version = "test_current";
    test_suites = [
        "cts"
        "vts10"
    ];
    optimize = {
        enabled = false;
    };
};

in { inherit CallRedirectionServiceTestApp; }
