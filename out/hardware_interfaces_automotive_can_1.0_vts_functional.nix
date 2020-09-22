{ cc_defaults, cc_test }:
let

#
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
#

"android.hardware.automotive.can@vts-defaults" = cc_defaults {
    name = "android.hardware.automotive.can@vts-defaults";
    defaults = [
        "VtsHalTargetTestDefaults"
        "android.hardware.automotive.can@defaults"
    ];
    header_libs = [
        "android.hardware.automotive.can@hidl-utils-lib"
    ];
    static_libs = [
        "android.hardware.automotive.can@1.0"
        "android.hardware.automotive.can@vts-utils-lib"
        "libgmock"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

VtsHalCanControllerV1_0TargetTest = cc_test {
    name = "VtsHalCanControllerV1_0TargetTest";
    defaults = ["android.hardware.automotive.can@vts-defaults"];
    srcs = ["VtsHalCanControllerV1_0TargetTest.cpp"];
};

VtsHalCanBusV1_0TargetTest = cc_test {
    name = "VtsHalCanBusV1_0TargetTest";
    defaults = ["android.hardware.automotive.can@vts-defaults"];
    srcs = ["VtsHalCanBusV1_0TargetTest.cpp"];
};

VtsHalCanBusVirtualV1_0TargetTest = cc_test {
    name = "VtsHalCanBusVirtualV1_0TargetTest";
    defaults = ["android.hardware.automotive.can@vts-defaults"];
    srcs = ["VtsHalCanBusVirtualV1_0TargetTest.cpp"];
};

in { inherit "android.hardware.automotive.can@vts-defaults" VtsHalCanBusV1_0TargetTest VtsHalCanBusVirtualV1_0TargetTest VtsHalCanControllerV1_0TargetTest; }
