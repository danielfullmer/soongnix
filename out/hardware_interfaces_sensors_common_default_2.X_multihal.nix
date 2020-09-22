{ cc_defaults, cc_library_headers, cc_library_shared, cc_library_static, cc_test_library }:
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

"android.hardware.sensors@2.X-multihal-defaults" = cc_defaults {
    name = "android.hardware.sensors@2.X-multihal-defaults";
    header_libs = [
        "android.hardware.sensors@2.X-multihal.header"
        "android.hardware.sensors@2.X-shared-utils"
    ];
    shared_libs = [
        "android.hardware.sensors@1.0"
        "android.hardware.sensors@2.0"
        "android.hardware.sensors@2.1"
        "libbase"
        "libcutils"
        "libfmq"
        "libhidlbase"
        "liblog"
        "libpower"
        "libutils"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
    ];
    cflags = ["-DLOG_TAG=\"SensorsMultiHal\""];
};

#  Header target for sub-HALs that implement the Multi-HAL 2.0 interface
"android.hardware.sensors@2.0-multihal.header" = cc_library_headers {
    name = "android.hardware.sensors@2.0-multihal.header";
    vendor_available = true;
    export_include_dirs = ["include/V2_0"];
};

#  Header target for sub-HALs that implement the Multi-HAL 2.1 interface
"android.hardware.sensors@2.1-multihal.header" = cc_library_headers {
    name = "android.hardware.sensors@2.1-multihal.header";
    vendor_available = true;
    export_include_dirs = ["include/V2_1"];
};

#  Header target for Multi-HAL so it can reference both 2.0/2.1 headers
"android.hardware.sensors@2.X-multihal.header" = cc_library_headers {
    name = "android.hardware.sensors@2.X-multihal.header";
    vendor_available = true;
    export_include_dirs = ["include"];
};

"android.hardware.sensors@2.X-multihal" = cc_library_static {
    name = "android.hardware.sensors@2.X-multihal";
    defaults = [
        "hidl_defaults"
        "android.hardware.sensors@2.X-multihal-defaults"
    ];
    srcs = [
        "HalProxy.cpp"
        "HalProxyCallback.cpp"
    ];
    vendor_available = true;
    export_header_lib_headers = [
        "android.hardware.sensors@2.X-multihal.header"
    ];
};

"android.hardware.sensors@2.0-ScopedWakelock" = cc_library_shared {
    name = "android.hardware.sensors@2.0-ScopedWakelock";
    defaults = [
        "hidl_defaults"
        "android.hardware.sensors@2.X-multihal-defaults"
    ];
    srcs = [
        "ScopedWakelock.cpp"
    ];
    header_libs = [
        "android.hardware.sensors@2.0-multihal.header"
    ];
    vendor_available = true;
    export_header_lib_headers = [
        "android.hardware.sensors@2.0-multihal.header"
    ];
};

"android.hardware.sensors@2.0-ScopedWakelock.testlib" = cc_test_library {
    name = "android.hardware.sensors@2.0-ScopedWakelock.testlib";
    defaults = [
        "hidl_defaults"
        "android.hardware.sensors@2.X-multihal-defaults"
    ];
    srcs = [
        "ScopedWakelock.cpp"
    ];
    vendor_available = true;
    header_libs = [
        "android.hardware.sensors@2.0-multihal.header"
    ];
    export_header_lib_headers = [
        "android.hardware.sensors@2.0-multihal.header"
    ];
};

in { inherit "android.hardware.sensors@2.0-ScopedWakelock" "android.hardware.sensors@2.0-ScopedWakelock.testlib" "android.hardware.sensors@2.0-multihal.header" "android.hardware.sensors@2.1-multihal.header" "android.hardware.sensors@2.X-multihal" "android.hardware.sensors@2.X-multihal-defaults" "android.hardware.sensors@2.X-multihal.header"; }
