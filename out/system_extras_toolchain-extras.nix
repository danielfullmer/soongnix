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

    vendor_available = true;
    vndk = {
        enabled = true;
    };
    recovery_available = true;

    stl = "none";
    system_shared_libs = [];
    header_libs = ["libc_headers"];
};

libprofile-extras_ndk = cc_library_static {
    name = "libprofile-extras_ndk";
    defaults = ["libprofile-defaults"];
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

in { inherit libprofile-defaults libprofile-extras libprofile-extras-test libprofile-extras_ndk; }
