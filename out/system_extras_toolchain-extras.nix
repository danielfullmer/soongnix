{ cc_defaults, cc_library_static, cc_test }:
let

libprofile-defaults = cc_defaults {
    name = "libprofile-defaults";
    srcs = [
        "profile-extras.cpp"
        "profile-globals.c"
    ];
    native_coverage = false;
};

libprofile-extras = cc_library_static {
    name = "libprofile-extras";
    defaults = ["libprofile-defaults"];

    native_bridge_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    ramdisk_available = true;
    recovery_available = true;

    stl = "none";
    system_shared_libs = [];
    header_libs = ["libc_headers"];
};

libprofile-extras_ndk = cc_library_static {
    name = "libprofile-extras_ndk";
    defaults = ["libprofile-defaults"];
    native_bridge_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    sdk_version = "minimum";
};

libprofile-clang-defaults = cc_defaults {
    name = "libprofile-clang-defaults";
    srcs = [
        "profile-clang-extras.cpp"
    ];
    native_coverage = false;
};

libprofile-clang-extras = cc_library_static {
    name = "libprofile-clang-extras";
    defaults = ["libprofile-clang-defaults"];

    native_bridge_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    ramdisk_available = true;
    recovery_available = true;

    stl = "none";
    system_shared_libs = [];
    header_libs = ["libc_headers"];
};

libprofile-clang-extras_ndk = cc_library_static {
    name = "libprofile-clang-extras_ndk";
    defaults = ["libprofile-clang-defaults"];
    native_bridge_supported = true;
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    sdk_version = "minimum";
};

libprofile-extras-test = cc_test {
    name = "libprofile-extras-test";
    srcs = [
        "profile-extras-test.cpp"
    ];
    static_libs = [
        "libprofile-extras"
    ];
    ldflags = ["-uinit_profile_extras"];
    native_coverage = false;
};

in { inherit libprofile-clang-defaults libprofile-clang-extras libprofile-clang-extras_ndk libprofile-defaults libprofile-extras libprofile-extras-test libprofile-extras_ndk; }
