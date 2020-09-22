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

VtsHalCasV1_0TargetTest = cc_test {
    name = "VtsHalCasV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalCasV1_0TargetTest.cpp"];
    static_libs = [
        "android.hardware.cas@1.0"
        "android.hardware.cas.native@1.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libhidlallocatorutils"
        "libhidlmemory"
    ];
    shared_libs = [
        "libbinder"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalCasV1_0TargetTest; }
