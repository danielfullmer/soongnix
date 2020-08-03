{ cc_defaults, cc_library }:
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

libhidlbase-impl-shared-libs = cc_defaults {
    name = "libhidlbase-impl-shared-libs";
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libutils"
    ];
    export_shared_lib_headers = [
        "libutils"
        "libcutils" #  for native_handle.h
    ];
};

libhidlbase-impl-internal = cc_library {
    name = "libhidlbase-impl-internal";
    vendor_available = true;
    recovery_available = true;
    defaults = [
        "libhidlbase-impl-shared-libs"
        "libhidl-defaults"
    ];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    sanitize = {
        misc_undefined = ["integer"];
    };

    srcs = [
        "HidlInternal.cpp"
        "HidlSupport.cpp"
        "Status.cpp"
        "TaskRunner.cpp"
    ];

    product_variables = {
        debuggable = {
            cflags = ["-DLIBHIDL_TARGET_DEBUGGABLE"];
        };
    };
};

in { inherit libhidlbase-impl-internal libhidlbase-impl-shared-libs; }
