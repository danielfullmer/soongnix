{ cc_library_static, cc_test }:
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

"android.hardware.drm@1.2-vts" = cc_library_static {
    name = "android.hardware.drm@1.2-vts";
    defaults = ["VtsHalTargetTestDefaults"];
    local_include_dirs = [
        "include"
    ];
    srcs = [
        "drm_hal_clearkey_module.cpp"
        "drm_hal_common.cpp"
        "drm_hal_test.cpp"
    ];
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.1"
        "android.hardware.drm@1.2"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libhidlmemory"
        "libnativehelper"
    ];
    static_libs = [
        "android.hardware.drm@1.0-helper"
        "libcrypto_static"
        "libdrmvtshelper"
    ];
    export_shared_lib_headers = [
        "android.hardware.drm@1.2"
    ];
    export_static_lib_headers = [
        "android.hardware.drm@1.0-helper"
    ];
    export_include_dirs = [
        "include"
    ];
};

VtsHalDrmV1_2TargetTest = cc_test {
    name = "VtsHalDrmV1_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "drm_hal_test_main.cpp"
    ];
    whole_static_libs = [
        "android.hardware.drm@1.2-vts"
    ];
    shared_libs = [
        "android.hardware.drm@1.0"
        "android.hardware.drm@1.2"
        "android.hidl.allocator@1.0"
        "libhidlmemory"
    ];
    static_libs = [
        "android.hardware.drm@1.0-helper"
        "libcrypto_static"
        "libdrmvtshelper"
    ];
    arch = {
        arm = {
            data = [":libvtswidevine-arm-prebuilts"];
        };
        arm64 = {
            data = [":libvtswidevine-arm64-prebuilts"];
        };
        x86 = {
            data = [":libvtswidevine-x86-prebuilts"];
        };
        x86_64 = {
            data = [":libvtswidevine-x86_64-prebuilts"];
        };
    };
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit "android.hardware.drm@1.2-vts" VtsHalDrmV1_2TargetTest; }
