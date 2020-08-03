{ aidl_interface, cc_binary, cc_library, cc_library_headers, cc_test, filegroup }:
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

gsi_tool = cc_binary {
    name = "gsi_tool";
    shared_libs = [
        "gsi_aidl_interface-cpp"
        "libbinder"
        "libbase"
        "libcutils"
        "libgsi"
        "liblog"
        "libservices"
        "libutils"
    ];
    srcs = [
        "gsi_tool.cpp"
    ];
};

libgsi = cc_library {
    name = "libgsi";
    recovery_available = true;
    host_supported = true;
    srcs = [
        "libgsi.cpp"
    ];
    shared_libs = [
        "libbase"
    ];
    export_include_dirs = ["include"];
};

libgsi_headers = cc_library_headers {
    name = "libgsi_headers";
    host_supported = true;
    recovery_available = true;
    vendor_available = true;
    export_include_dirs = ["include"];
};

gsid = cc_binary {
    name = "gsid";
    srcs = [
        "daemon.cpp"
        "gsi_service.cpp"
    ];
    required = [
        "mke2fs"
    ];
    init_rc = [
        "gsid.rc"
    ];
    shared_libs = [
        "gsi_aidl_interface-cpp"
        "libbase"
        "libbinder"
        "libext4_utils"
        "libfs_mgr"
        "libgsi"
        "liblog"
        "liblp"
        "libutils"
    ];
    static_libs = [
        "libdm"
        "libfiemap_writer"
    ];
    local_include_dirs = ["include"];
};

gsi_boot_test = cc_test {
    name = "gsi_boot_test";
    shared_libs = [
        "libbase"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libext4_utils"
        "libfstab"
        "android.hardware.weaver@1.0"
    ];
    srcs = [
        "tests/boot_tests.cpp"
    ];
};

gsi_aidl_interface = aidl_interface {
    name = "gsi_aidl_interface";
    srcs = [
        "aidl/android/gsi/GsiInstallParams.aidl"
        "aidl/android/gsi/GsiProgress.aidl"
        "aidl/android/gsi/IGsiService.aidl"
    ];
    local_include_dir = "aidl";
    backend = {
        ndk = {
            enabled = false;
        };
    };
};

gsiservice_aidl = filegroup {
    name = "gsiservice_aidl";
    srcs = [
        "aidl/android/gsi/GsiInstallParams.aidl"
        "aidl/android/gsi/GsiProgress.aidl"
        "aidl/android/gsi/IGsiService.aidl"
    ];
};

in { inherit gsi_aidl_interface gsi_boot_test gsi_tool gsid gsiservice_aidl libgsi libgsi_headers; }
