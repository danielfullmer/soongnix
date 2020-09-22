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

libfs_mgr_defaults = cc_defaults {
    name = "libfs_mgr_defaults";
    defaults = ["fs_mgr_defaults"];
    export_include_dirs = ["include"];
    include_dirs = ["system/vold"];
    cflags = [
        "-D_FILE_OFFSET_BITS=64"
    ];
    srcs = [
        "file_wait.cpp"
        "fs_mgr.cpp"
        "fs_mgr_format.cpp"
        "fs_mgr_verity.cpp"
        "fs_mgr_dm_linear.cpp"
        "fs_mgr_overlayfs.cpp"
        "fs_mgr_roots.cpp"
        "fs_mgr_vendor_overlay.cpp"
        ":libfiemap_srcs"
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
        "libext2_uuid"
        "libfscrypt"
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
    header_libs = [
        "libfiemap_headers"
        "libstorage_literals_headers"
    ];
    export_header_lib_headers = [
        "libfiemap_headers"
    ];
    required = [
        "e2freefrag"
        "e2fsdroid"
    ];
};

#  Two variants of libfs_mgr are provided: libfs_mgr and libfs_mgr_binder.
#  Use libfs_mgr in recovery, first-stage-init, or when libfiemap or overlayfs
#  is not used.
#
#  Use libfs_mgr_binder when not in recovery/first-stage init, or when overlayfs
#  or libfiemap is needed. In this case, libfiemap will proxy over binder to
#  gsid.
libfs_mgr = cc_library {
    #  Do not ever allow this library to be vendor_available as a shared library.
    #  It does not have a stable interface.
    name = "libfs_mgr";
    recovery_available = true;
    defaults = [
        "libfs_mgr_defaults"
    ];
    srcs = [
        ":libfiemap_passthrough_srcs"
    ];
};

libfs_mgr_binder = cc_library {
    #  Do not ever allow this library to be vendor_available as a shared library.
    #  It does not have a stable interface.
    name = "libfs_mgr_binder";
    defaults = [
        "libfs_mgr_defaults"
        "libfiemap_binder_defaults"
    ];
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
        vendor = {
            cflags = [
                #  Skipping entries in fstab should only be done in a system
                #  process as the config file is in /system_ext.
                #  Remove the op from the vendor variant.
                "-DNO_SKIP_MOUNT"
            ];
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
        "libutils"
        "libvold_binder"
    ];
    shared_libs = [
        "libbootloader_message"
        "libbase"
        "libbinder"
        "libcutils"
        "libcrypto"
        "libext4_utils"
        "libfec"
        "libfs_mgr_binder"
        "liblog"
        "liblp"
        "libselinux"
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
    required = [
        "clean_scratch_files"
    ];
};

clean_scratch_files = cc_binary {
    name = "clean_scratch_files";
    defaults = ["fs_mgr_defaults"];
    shared_libs = [
        "libbase"
        "libfs_mgr_binder"
    ];
    srcs = [
        "clean_scratch_files.cpp"
    ];
    product_variables = {
        debuggable = {
            init_rc = [
                "clean_scratch_files.rc"
            ];
        };
    };
};

in { inherit clean_scratch_files fs_mgr_defaults libfs_mgr libfs_mgr_binder libfs_mgr_defaults libfstab remount; }
