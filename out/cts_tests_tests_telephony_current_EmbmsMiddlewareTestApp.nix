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

#  Build the Sample Embms Services

EmbmsMiddlewareCtsTestApp = android_test_helper_app {
    name = "EmbmsMiddlewareCtsTestApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/telephony/cts/embmstestapp/CtsDownloadService.java"
        "src/android/telephony/cts/embmstestapp/CtsGroupCallService.java"
        "src/android/telephony/cts/embmstestapp/CtsStreamingService.java"
        "aidl/android/telephony/cts/embmstestapp/ICtsDownloadMiddlewareControl.aidl"
        "aidl/android/telephony/cts/embmstestapp/ICtsGroupCallMiddlewareControl.aidl"
        "aidl/android/telephony/cts/embmstestapp/ICtsStreamingMiddlewareControl.aidl"
    ];
    aidl = {
        local_include_dirs = ["aidl/"];
    };
    sdk_version = "test_current";
    test_suites = [
        "cts"
        "mts"
        "vts10"
    ];
};

in { inherit EmbmsMiddlewareCtsTestApp; }
