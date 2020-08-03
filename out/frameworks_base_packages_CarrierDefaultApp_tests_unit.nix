{ android_test }:
let

#  Copyright 2016, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CarrierDefaultAppUnitTests = android_test {
    name = "CarrierDefaultAppUnitTests";
    certificate = "platform";
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
    ];
    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];
    #  Include all test java files.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    instrumentation_for = "CarrierDefaultApp";
};

in { inherit CarrierDefaultAppUnitTests; }
