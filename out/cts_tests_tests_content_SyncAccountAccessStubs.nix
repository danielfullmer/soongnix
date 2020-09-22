{ android_test_helper_app }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

CtsSyncAccountAccessStubs = android_test_helper_app {
    name = "CtsSyncAccountAccessStubs";
    defaults = ["cts_support_defaults"];
    static_libs = ["android-support-annotations"];
    srcs = [
        "src/com/android/cts/stub/StubAuthenticator.java"
        "src/com/android/cts/stub/StubProvider.java"
        "src/com/android/cts/stub/StubProvider2.java"
    ];
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    min_sdk_version = "29";
};

in { inherit CtsSyncAccountAccessStubs; }