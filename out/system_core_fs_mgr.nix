{ cc_binary, cc_defaults, cc_library, cc_library_static }:
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

fs_mgr_defaults = cc_defaults {
    name = "fs_mgr_defaults";
    sanitize = {
        misc_undefined = ["integer"];
    };
    local_include_dirs = ["include/"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

libfs_mgr = cc_library {
    #  Do not ever allow this library to be vendor_available as a shared library.
    #  It does not have a stable interface.
    name = "libfs_mgr";
    defaults = ["fs_mgr_defaults"];
    recovery_available = true;
    export_include_dirs = ["include"];
    include_dirs = ["system/vold"];
    srcs = [
        "fs_mgr.cpp"
        "fs_mgr_format.cpp"
        "fs_mgr_verity.cpp"
        "fs_mgr_dm_linear.cpp"
        "fs_mgr_overlayfs.cpp"
        "fs_mgr_roots.cpp"
        "fs_mgr_vendor_overlay.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "libcutils"
        "libext4_utils"
        "libfec"
        "liblog"
        "liblp"
        "libselinux"
    ];
    static_libs = [
        "libavb"
        "libfs_avb"
        "libfstab"
        "libdm"
        "libgsi"
    ];
    export_static_lib_headers = [
        "libfs_avb"
        "libfstab"
        "libdm"
    ];
    export_shared_lib_headers = [
        "liblp"
    ];
    whole_static_libs = [
        "liblogwrap"
        "libdm"
        "libfstab"
    ];
    cppflags = [
        "-DALLOW_ADBD_DISABLE_VERITY=0"
    ];
    product_variables = {
        debuggable = {
            cppflags = [
                "-UALLOW_ADBD_DISABLE_VERITY"
                "-DALLOW_ADBD_DISABLE_VERITY=1"
            ];
        };
    };
};

libfstab = cc_library_static {
    #  Do not ever make this a shared library as long as it is vendor_available.
    #  It does not have a stable interface.
    name = "libfstab";
    vendor_available = true;
    recovery_available = true;
    host_supported = true;
    defaults = ["fs_mgr_defaults"];
    srcs = [
        "fs_mgr_fstab.cpp"
        "fs_mgr_boot_config.cpp"
        "fs_mgr_slotselect.cpp"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    export_include_dirs = ["include_fstab"];
    header_libs = [
        "libbase_headers"
        "libgsi_headers"
    ];
};

remount = cc_binary {
    name = "remount";
    defaults = ["fs_mgr_defaults"];
    static_libs = [
        "libavb_user"
    ];
    shared_libs = [
        "libbootloader_message"
        "libbase"
        "libcrypto"
        "libfec"
        "libfs_mgr"
    ];
    header_libs = [
        "libcutils_headers"
    ];
    srcs = [
        "fs_mgr_remount.cpp"
    ];
    cppflags = [
        "-DALLOW_ADBD_DISABLE_VERITY=0"
    ];
    product_variables = {
        debuggable = {
            cppflags = [
                "-UALLOW_ADBD_DISABLE_VERITY"
                "-DALLOW_ADBD_DISABLE_VERITY=1"
            ];
        };
    };
};

in { inherit fs_mgr_defaults libfs_mgr libfstab remount; }
