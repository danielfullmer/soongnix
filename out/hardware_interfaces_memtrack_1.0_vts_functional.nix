{ cc_test }:
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

VtsHalMemtrackV1_0TargetTest = cc_test {
    name = "VtsHalMemtrackV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalMemtrackV1_0TargetTest.cpp"];
    static_libs = ["android.hardware.memtrack@1.0"];
    test_suites = ["general-tests"];
};

in { inherit VtsHalMemtrackV1_0TargetTest; }