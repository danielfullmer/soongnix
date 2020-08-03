{ cc_library_static }:
let

libdiagnose_usb = cc_library_static {
    name = "libdiagnose_usb";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    host_supported = true;
    recovery_available = true;
    target = {
        windows = {
            enabled = true;
        };
    };
    srcs = ["diagnose_usb.cpp"];
    export_include_dirs = ["include"];
    static_libs = ["libbase"];
};

in { inherit libdiagnose_usb; }
