{ cc_binary, cc_defaults, cc_library, cc_library_headers, cc_test }:
let

libincfs_defaults = cc_defaults {
    name = "libincfs_defaults";
    cpp_std = "c++2a";
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
    defaults = ["linux_bionic_supported"];
    export_include_dirs = [
        "include/"
        "kernel-headers"
    ];
    local_include_dirs = ["include/"];
    header_libs = [
        "libincfs_headers"
    ];
    export_header_lib_headers = ["libincfs_headers"];
    static_libs = [
        "libbase"
        "com.android.sysprop.incremental"
    ];
    shared_libs = [
        "libcrypto"
        "liblog"
        "libselinux"
    ];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
        "-cert-err34-c"
        "clang-analyzer-security*"
        #  Disabling due to many unavoidable warnings from POSIX API usage.
        "-google-runtime-int"
        "-google-explicit-constructor"
        #  operator=() does not handle self-assignment properly - all protobuf-generated classes
        "-cert-oop54-cpp"
    ];
};

libincfs = cc_library {
    name = "libincfs";
    defaults = ["libincfs_defaults"];
    srcs = [
        "incfs_ndk.c"
        "incfs.cpp"
        "MountRegistry.cpp"
        "path.cpp"
    ];
};

libincfs_headers = cc_library_headers {
    name = "libincfs_headers";
    export_include_dirs = [
        "include/"
        "kernel-headers"
    ];
    host_supported = true;
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
};

libincfs-test = cc_test {
    name = "libincfs-test";
    defaults = ["libincfs_defaults"];
    static_libs = [
        "libincfs"
    ];
    shared_libs = [
        "libbase"
    ];
    srcs = [
        "tests/incfs_test.cpp"
        "tests/MountRegistry_test.cpp"
    ];
    require_root = true;
};

incfsdump = cc_binary {
    name = "incfsdump";
    defaults = ["libincfs_defaults"];
    host_supported = true;
    static_libs = [
        "libbase"
    ];
    srcs = [
        "incfsdump/main.cpp"
        "incfsdump/dump.cpp"
    ];
};

in { inherit incfsdump libincfs libincfs-test libincfs_defaults libincfs_headers; }
