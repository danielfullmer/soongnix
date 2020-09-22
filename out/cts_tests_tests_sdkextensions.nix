{ android_test }:
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

CtsSdkExtensionsTestCases = android_test {
    name = "CtsSdkExtensionsTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.rules"
        "ctstestrunner-axt"
    ];
    srcs = ["src/android/os/ext/cts/SdkExtensionsTest.java"];
    test_config = "CtsSdkExtensionsTestCases.xml";
    test_suites = [
        "cts"
        "mts"
        "general-tests"
    ];
    sdk_version = "system_current";
};

in { inherit CtsSdkExtensionsTestCases; }
