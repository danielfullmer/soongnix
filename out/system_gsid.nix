{ aidl_interface, cc_binary, cc_library, cc_library_headers, cc_library_static, filegroup, vts_config }:
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
        "libbase"
        "libbinder"
        "libcutils"
        "libgsi"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libgsid"
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

libgsid = cc_library_static {
    name = "libgsid";
    srcs = [
        "libgsid.cpp"
    ];
    shared_libs = [
        "gsi_aidl_interface-cpp"
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libservices"
        "libutils"
    ];
    static_libs = [
        "libgsi"
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
        "partition_installer.cpp"
    ];
    required = [
        "mke2fs"
    ];
    init_rc = [
        "gsid.rc"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "liblog"
    ];
    static_libs = [
        "gsi_aidl_interface-cpp"
        "libavb"
        "libcutils"
        "libdm"
        "libext4_utils"
        "libfs_mgr"
        "libgsi"
        "libgsid"
        "liblp"
        "libutils"
        "libc++fs"
    ];
    local_include_dirs = ["include"];
};

gsi_aidl_interface = aidl_interface {
    name = "gsi_aidl_interface";
    unstable = true;
    srcs = [":gsiservice_aidl"];
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
        "aidl/android/gsi/AvbPublicKey.aidl"
        "aidl/android/gsi/GsiProgress.aidl"
        "aidl/android/gsi/IGsiService.aidl"
        "aidl/android/gsi/IGsiServiceCallback.aidl"
        "aidl/android/gsi/IImageService.aidl"
        "aidl/android/gsi/IProgressCallback.aidl"
        "aidl/android/gsi/MappedImage.aidl"
    ];
    path = "aidl";
};

VtsGsiBootTest = vts_config {
    name = "VtsGsiBootTest";
};

in { inherit VtsGsiBootTest gsi_aidl_interface gsi_tool gsid gsiservice_aidl libgsi libgsi_headers libgsid; }
