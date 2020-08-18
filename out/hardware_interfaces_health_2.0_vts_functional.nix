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

VtsHalHealthV2_0TargetTest = cc_test {
    name = "VtsHalHealthV2_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalHealthV2_0TargetTest.cpp"];
    static_libs = [
        "libgflags"
        "android.hardware.health@1.0"
        "android.hardware.health@2.0"
    ];
    test_suites = ["general-tests"];
};

in { inherit VtsHalHealthV2_0TargetTest; }