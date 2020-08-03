{ cc_binary, cc_defaults, cc_library_headers, cc_library_static, filegroup, sh_binary }:
let

installd_defaults = cc_defaults {
    name = "installd_defaults";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"

        "-Wunreachable-code"
        "-Wunreachable-code-break"
        "-Wunreachable-code-return"
    ];
    srcs = [
        "CacheItem.cpp"
        "CacheTracker.cpp"
        "InstalldNativeService.cpp"
        "QuotaUtils.cpp"
        "dexopt.cpp"
        "globals.cpp"
        "utils.cpp"
        "utils_default.cpp"
        "view_compiler.cpp"
        ":installd_aidl"
    ];
    header_libs = [
        "dex2oat_headers"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "liblog"
        "liblogwrap"
        "libprocessgroup"
        "libselinux"
        "libutils"
        "server_configurable_flags"
    ];

    product_variables = {
        arc = {
            exclude_srcs = [
                "QuotaUtils.cpp"
            ];
            static_libs = [
                "libarcdiskquota"
                "arc_services_aidl"
            ];
            cflags = [
                "-DUSE_ARC"
            ];
        };
    };

    clang = true;

    tidy = true;
    tidy_checks = [
        "-*"
        "clang-analyzer-security*"
        "cert-*"
        "-cert-err58-cpp"
    ];
    tidy_flags = [
        "-warnings-as-errors=clang-analyzer-security*,cert-*"
    ];
};

#
#  Static library used in testing and executable
#

libinstalld = cc_library_static {
    name = "libinstalld";
    defaults = ["installd_defaults"];

    export_include_dirs = ["."];
    aidl = {
        export_aidl_headers = true;
    };

    product_variables = {
        arc = {
            exclude_srcs = [
                "QuotaUtils.cpp"
            ];
            static_libs = [
                "libarcdiskquota"
                "arc_services_aidl"
            ];
            cflags = [
                "-DUSE_ARC"
            ];
        };
    };
};

libinstalld_headers = cc_library_headers {
    name = "libinstalld_headers";
    export_include_dirs = ["."];
};

#
#  Executable
#

installd = cc_binary {
    name = "installd";
    defaults = ["installd_defaults"];
    srcs = ["installd.cpp"];

    static_libs = ["libdiskusage"];

    init_rc = ["installd.rc"];

    product_variables = {
        arc = {
            exclude_srcs = [
                "QuotaUtils.cpp"
            ];
            static_libs = [
                "libarcdiskquota"
                "arc_services_aidl"
            ];
            cflags = [
                "-DUSE_ARC"
            ];
        };
    };

    #  Needs to be wherever installd is as it's execed by
    #  installd.
    required = ["migrate_legacy_obb_data.sh"];
};

#  OTA chroot tool

otapreopt_chroot = cc_binary {
    name = "otapreopt_chroot";
    cflags = [
        "-Wall"
        "-Werror"
    ];
    clang = true;

    srcs = [
        "otapreopt_chroot.cpp"
        "otapreopt_utils.cpp"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libprotobuf-cpp-full"
        "libselinux"
        "libutils"
        "libziparchive"
    ];
    static_libs = [
        "libapex"
        "libapexd"
        "lib_apex_manifest_proto"
        "libavb"
        "libdm"
        "libvold_binder"
    ];
};

installd_aidl = filegroup {
    name = "installd_aidl";
    srcs = [
        "binder/android/os/IInstalld.aidl"
    ];
};

#
#  Static library for otapreopt used in testing
#
libotapreoptparameters = cc_library_static {
    name = "libotapreoptparameters";
    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = ["otapreopt_parameters.cpp"];

    export_include_dirs = ["."];

    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libprocessgroup"
        "libutils"
    ];
};

#
#   OTA Executable
#

otapreopt = cc_binary {
    name = "otapreopt";
    cflags = [
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "dexopt.cpp"
        "globals.cpp"
        "otapreopt.cpp"
        "otapreopt_utils.cpp"
        "utils.cpp"
        "utils_default.cpp"
        "view_compiler.cpp"
    ];

    header_libs = ["dex2oat_headers"];

    static_libs = [
        "libartimagevalues"
        "libdiskusage"
        "libotapreoptparameters"
    ];

    shared_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
        "liblog"
        "liblogwrap"
        "libprocessgroup"
        "libselinux"
        "libutils"
        "server_configurable_flags"
    ];
};

#  OTA slot script
otapreopt_slot = sh_binary {
    name = "otapreopt_slot";
    src = "otapreopt_slot.sh";
    init_rc = ["otapreopt.rc"];
};

#  OTA postinstall script
otapreopt_script = sh_binary {
    name = "otapreopt_script";
    src = "otapreopt_script.sh";
    #  Let this depend on otapreopt, the chroot tool and the slot script,
    #  so we just have to mention one in a configuration.
    required = [
        "otapreopt"
        "otapreopt_chroot"
        "otapreopt_slot"
    ];
};

#  Script to migrate legacy obb data.
"migrate_legacy_obb_data.sh" = sh_binary {
    name = "migrate_legacy_obb_data.sh";
    src = "migrate_legacy_obb_data.sh";
};

in { inherit "migrate_legacy_obb_data.sh" installd installd_aidl installd_defaults libinstalld libinstalld_headers libotapreoptparameters otapreopt otapreopt_chroot otapreopt_script otapreopt_slot; }
