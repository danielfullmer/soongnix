{ cc_defaults, cc_library_static, hidl_package_root }:
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

"android.hidl" = hidl_package_root {
    name = "android.hidl";
};

libhidltransport-impl-shared-libs = cc_defaults {
    name = "libhidltransport-impl-shared-libs";
    shared_libs = [
        "libbase"
        "liblog"
        "libutils"
        "libhwbinder"
        "libcutils"
        "libvndksupport"
    ];
    export_shared_lib_headers = [
        "libutils"
    ];

    target = {
        recovery = {
            exclude_shared_libs = ["libvndksupport"];
        };
    };
};

libhidltransport-impl-internal = cc_library_static {
    name = "libhidltransport-impl-internal";
    vendor_available = true;
    recovery_available = true;

    defaults = [
        "hidl-module-defaults"
        "libhidl-defaults"
        "libhidltransport-impl-shared-libs"
    ];

    static_libs = [
        "libhidlbase-impl-internal"
    ];
    export_static_lib_headers = [
        "libhidlbase-impl-internal"
    ];

    export_include_dirs = ["include"];

    generated_sources = [
        "android.hidl.manager@1.0_genc++"
        "android.hidl.manager@1.1_genc++"
        "android.hidl.manager@1.2_genc++"
        "android.hidl.base@1.0_genc++"
    ];
    generated_headers = [
        "android.hidl.manager@1.0_genc++_headers"
        "android.hidl.manager@1.1_genc++_headers"
        "android.hidl.manager@1.2_genc++_headers"
        "android.hidl.base@1.0_genc++_headers"
    ];
    export_generated_headers = [
        "android.hidl.manager@1.0_genc++_headers"
        "android.hidl.manager@1.1_genc++_headers"
        "android.hidl.manager@1.2_genc++_headers"
        "android.hidl.base@1.0_genc++_headers"
    ];

    srcs = [
        "HidlBinderSupport.cpp"
        "HidlLazyUtils.cpp"
        "HidlPassthroughSupport.cpp"
        "HidlTransportSupport.cpp"
        "HidlTransportUtils.cpp"
        "ServiceManagement.cpp"
        "Static.cpp"
    ];

    product_variables = {
        debuggable = {
            cflags = ["-DLIBHIDL_TARGET_DEBUGGABLE"];
        };
        enforce_vintf_manifest = {
            cflags = ["-DENFORCE_VINTF_MANIFEST"];
        };
    };
};

in { inherit "android.hidl" libhidltransport-impl-internal libhidltransport-impl-shared-libs; }
