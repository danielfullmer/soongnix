{ cc_test }:
let

#
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
#

VtsHalGnssV1_1TargetTest = cc_test {
    name = "VtsHalGnssV1_1TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "gnss_hal_test.cpp"
        "gnss_hal_test_cases.cpp"
        "VtsHalGnssV1_1TargetTest.cpp"
    ];
    static_libs = [
        "android.hardware.gnss@1.0"
        "android.hardware.gnss@1.1"
        "android.hardware.gnss@common-vts-lib"
    ];
    shared_libs = [
        "android.hardware.gnss.measurement_corrections@1.0"
    ];
    test_suites = ["general-tests"];
};

in { inherit VtsHalGnssV1_1TargetTest; }
