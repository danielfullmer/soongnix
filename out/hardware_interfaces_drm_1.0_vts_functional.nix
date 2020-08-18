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

VtsHalDrmV1_0TargetTest = cc_test {
    name = "VtsHalDrmV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "drm_hal_clearkey_test.cpp"
        "drm_hal_vendor_test.cpp"
        "vendor_modules.cpp"
    ];
    static_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.0-helper"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libhidlmemory"
        "libnativehelper"
        "libssl"
        "libcrypto"
    ];
    test_suites = ["general-tests"];
};

in { inherit VtsHalDrmV1_0TargetTest; }
