{ cc_binary, cc_defaults, cc_library_headers, cc_library_static, filegroup }:
let

vold_default_flags = cc_defaults {
    name = "vold_default_flags";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-missing-field-initializers"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];

    clang = true;

    tidy = true;
    tidy_checks = [
        "-*"
        "cert-*"
        "clang-analyzer-security*"
        "android-*"
    ];
    tidy_flags = [
        "-warnings-as-errors=clang-analyzer-security*,cert-*"
    ];
};

vold_default_libs = cc_defaults {
    name = "vold_default_libs";

    static_libs = [
        "libavb"
        "libbootloader_message"
        "libfec"
        "libfec_rs"
        "libfs_avb"
        "libfs_mgr"
        "libscrypt_static"
        "libsquashfs_utils"
        "libvold_binder"
    ];
    shared_libs = [
        "android.hardware.keymaster@3.0"
        "android.hardware.keymaster@4.0"
        "android.hardware.boot@1.0"
        "libbase"
        "libbinder"
        "libcrypto"
        "libcrypto_utils"
        "libcutils"
        "libdiskconfig"
        "libext4_utils"
        "libf2fs_sparseblock"
        "libfscrypt"
        "libhardware"
        "libhardware_legacy"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
        "libkeyutils"
        "liblog"
        "liblogwrap"
        "libselinux"
        "libsysutils"
        "libutils"
    ];
};

libvold_binder = cc_library_static {
    name = "libvold_binder";
    defaults = ["vold_default_flags"];

    srcs = [
        ":vold_aidl"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
    aidl = {
        local_include_dirs = ["binder"];
        include_dirs = ["frameworks/native/aidl/binder"];
        export_aidl_headers = true;
    };
};

libvold_headers = cc_library_headers {
    name = "libvold_headers";
    export_include_dirs = ["."];
};

#  Static library factored out to support testing
libvold = cc_library_static {
    name = "libvold";
    defaults = [
        "vold_default_flags"
        "vold_default_libs"
    ];

    srcs = [
        "AppFuseUtil.cpp"
        "Benchmark.cpp"
        "CheckEncryption.cpp"
        "Checkpoint.cpp"
        "Devmapper.cpp"
        "EncryptInplace.cpp"
        "FileDeviceUtils.cpp"
        "FsCrypt.cpp"
        "IdleMaint.cpp"
        "KeyBuffer.cpp"
        "KeyStorage.cpp"
        "KeyUtil.cpp"
        "Keymaster.cpp"
        "Loop.cpp"
        "MetadataCrypt.cpp"
        "MoveStorage.cpp"
        "NetlinkHandler.cpp"
        "NetlinkManager.cpp"
        "Process.cpp"
        "ScryptParameters.cpp"
        "Utils.cpp"
        "VoldNativeService.cpp"
        "VoldUtil.cpp"
        "VolumeManager.cpp"
        "cryptfs.cpp"
        "fs/Exfat.cpp"
        "fs/Ext4.cpp"
        "fs/F2fs.cpp"
        "fs/Vfat.cpp"
        "model/Disk.cpp"
        "model/EmulatedVolume.cpp"
        "model/ObbVolume.cpp"
        "model/PrivateVolume.cpp"
        "model/PublicVolume.cpp"
        "model/VolumeBase.cpp"
        "model/StubVolume.cpp"
    ];
    product_variables = {
        arc = {
            exclude_srcs = [
                "AppFuseUtil.cpp"
                "model/ObbVolume.cpp"
            ];
            static_libs = [
                "arc_services_aidl"
                "libarcappfuse"
                "libarcobbvolume"
            ];
        };
        debuggable = {
            cppflags = ["-D__ANDROID_DEBUGGABLE__"];
        };
    };
    shared_libs = [
        "android.hardware.health.storage@1.0"
    ];
    whole_static_libs = [
        "com.android.sysprop.apex"
    ];
};

vold = cc_binary {
    name = "vold";
    defaults = [
        "vold_default_flags"
        "vold_default_libs"
    ];

    srcs = ["main.cpp"];
    static_libs = ["libvold"];
    product_variables = {
        arc = {
            static_libs = [
                "arc_services_aidl"
                "libarcappfuse"
                "libarcobbvolume"
            ];
        };
    };
    init_rc = [
        "vold.rc"
        "wait_for_keymaster.rc"
    ];

    required = [
        "mke2fs"
        "vold_prepare_subdirs"
        "wait_for_keymaster"
    ];

    shared_libs = [
        "android.hardware.health.storage@1.0"
        "libhidltransport"
    ];
};

vdc = cc_binary {
    name = "vdc";
    defaults = ["vold_default_flags"];

    srcs = ["vdc.cpp"];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libutils"
    ];
    static_libs = [
        "libvold_binder"
    ];
    init_rc = ["vdc.rc"];
};

wait_for_keymaster = cc_binary {
    name = "wait_for_keymaster";
    defaults = ["vold_default_flags"];

    srcs = [
        "wait_for_keymaster.cpp"
        "Keymaster.cpp"
    ];
    shared_libs = [
        "libbase"
        "libbinder"

        "android.hardware.keymaster@3.0"
        "android.hardware.keymaster@4.0"
        "libhardware"
        "libhardware_legacy"
        "libhidlbase"
        "libhwbinder"
        "libkeymaster4support"
    ];
};

secdiscard = cc_binary {
    name = "secdiscard";
    defaults = ["vold_default_flags"];

    srcs = [
        "FileDeviceUtils.cpp"
        "secdiscard.cpp"
    ];
    shared_libs = ["libbase"];
};

vold_prepare_subdirs = cc_binary {
    name = "vold_prepare_subdirs";
    defaults = ["vold_default_flags"];

    srcs = [
        "vold_prepare_subdirs.cpp"
        "Utils.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblogwrap"
        "libselinux"
        "libutils"
    ];
    static_libs = [
        "libvold_binder"
    ];
};

vold_aidl = filegroup {
    name = "vold_aidl";
    srcs = [
        "binder/android/os/IVold.aidl"
        "binder/android/os/IVoldListener.aidl"
        "binder/android/os/IVoldTaskListener.aidl"
    ];
};

subdirs = ["tests"];

in { inherit libvold libvold_binder libvold_headers secdiscard vdc vold vold_aidl vold_default_flags vold_default_libs vold_prepare_subdirs wait_for_keymaster; }
