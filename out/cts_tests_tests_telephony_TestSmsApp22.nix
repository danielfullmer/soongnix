{ android_test }:
let

#  Copyright (C) 2018 Google Inc.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

TestSmsApp22 = android_test {
    name = "TestSmsApp22";
    sdk_version = "test_current";

    srcs = ["src/android/telephony/cts/sms23/MainActivity.java"];

    static_libs = [
        "compatibility-device-util-axt"
    ];

    test_suites = [
        "cts"
    ];
};

in { inherit TestSmsApp22; }
