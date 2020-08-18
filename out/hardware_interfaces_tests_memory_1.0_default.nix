{ cc_library }:
let

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

"android.hardware.tests.memory@1.0-impl" = cc_library {
    name = "android.hardware.tests.memory@1.0-impl";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    srcs = [
        "MemoryTest.cpp"
    ];
    shared_libs = [
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhidlmemory"
        "libhwbinder"
        "liblog"
        "libutils"
        "android.hidl.memory@1.0"
        "android.hidl.memory.token@1.0"
    ];

    #  These are static libs only for testing purposes and portability. Shared
    #  libs should be used on device.
    static_libs = ["android.hardware.tests.memory@1.0"];
};

in { inherit "android.hardware.tests.memory@1.0-impl"; }
