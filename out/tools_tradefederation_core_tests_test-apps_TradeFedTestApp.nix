{ android_test }:
let

#  Copyright (C) 2010 The Android Open Source Project
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

TradeFedTestApp = android_test {
    name = "TradeFedTestApp";
    srcs = [
        "src/com/android/tradefed/testapp/CrashMeActivity.java"
        "src/com/android/tradefed/testapp/CrashOnInitTest.java"
        "src/com/android/tradefed/testapp/HangOnInitTest.java"
        "src/com/android/tradefed/testapp/OnDeviceTest.java"
    ];
    sdk_version = "4";
};

in { inherit TradeFedTestApp; }
