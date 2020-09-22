{ cc_test }:
let

#
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
#

VtsHalHealthStorageV1_0TargetTest = cc_test {
    name = "VtsHalHealthStorageV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalHealthStorageV1_0TargetTest.cpp"];
    static_libs = ["android.hardware.health.storage@1.0"];
    shared_libs = [
        "libhidlbase"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
    test_config = "VtsHalHealthStorageV1_0TargetTest.config";
};

in { inherit VtsHalHealthStorageV1_0TargetTest; }
