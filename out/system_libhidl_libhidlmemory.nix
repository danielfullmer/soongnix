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

libhidlmemory = cc_library {
    name = "libhidlmemory";
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    apex_available = [
        "//apex_available:platform"
        "com.android.neuralnetworks"
        "test_com.android.neuralnetworks"
        "com.android.media"
        "com.android.media.swcodec"
    ];
    defaults = ["libhidl-defaults"];
    shared_libs = [
        "libbase"
        "liblog"
        "libutils"
        "libcutils"
        "libhidlbase"
        "android.hidl.memory@1.0"
        "android.hidl.memory.token@1.0"
    ];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    export_shared_lib_headers = [
        "android.hidl.memory@1.0"
        "android.hidl.memory.token@1.0"
        "libhidlbase"
    ];

    srcs = [
        "HidlMemoryToken.cpp"
        "mapping.cpp"
    ];

    product_variables = {
        debuggable = {
            cflags = ["-DLIBHIDL_TARGET_DEBUGGABLE"];
        };
    };
    min_sdk_version = "29";
};

in { inherit libhidlmemory; }
