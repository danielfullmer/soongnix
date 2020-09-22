{ cc_defaults, cc_library_static }:
let

fmtlib-defaults = cc_defaults {
    name = "fmtlib-defaults";
    srcs = ["src/format.cc"];
    cflags = [
        "-fno-exceptions"
        "-Wall"
        "-Werror"
        #  If built without exceptions, libfmt uses assert.
        "-UNDEBUG"
    ];
    sanitize = {
        misc_undefined = ["integer"];
    };
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
};

#  This is built into libbase.  If you want to use this library, link to libbase instead.
fmtlib = cc_library_static {
    name = "fmtlib";
    defaults = ["fmtlib-defaults"];
    vendor_available = true;
    ramdisk_available = true;
    recovery_available = true;
    host_supported = true;
    native_bridge_supported = true;
    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
    apex_available = [
        "//apex_available:anyapex"
        "//apex_available:platform"
    ];
    min_sdk_version = "29";
};

fmtlib_ndk = cc_library_static {
    name = "fmtlib_ndk";
    defaults = ["fmtlib-defaults"];
    sdk_version = "current";
    stl = "c++_static";
};

in { inherit fmtlib fmtlib-defaults fmtlib_ndk; }
