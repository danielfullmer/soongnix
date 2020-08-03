{ cc_library, cc_library_headers, python_binary_host, python_defaults }:
let

#  Copyright 2012 The Android Open Source Project

libmkbootimg_abi_headers = cc_library_headers {
    name = "libmkbootimg_abi_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

bootimg_headers = cc_library_headers {
    name = "bootimg_headers";
    vendor_available = true;
    recovery_available = true;
    export_include_dirs = ["include/bootimg"];
    host_supported = true;
    target = {
        windows = {
            enabled = true;
        };
    };
};

libmkbootimg_abi_check = cc_library {
    name = "libmkbootimg_abi_check";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "mkbootimg_dummy.cpp"
    ];
    header_libs = ["libmkbootimg_abi_headers"];
    export_header_lib_headers = ["libmkbootimg_abi_headers"];
};

mkbootimg_defaults = python_defaults {
    name = "mkbootimg_defaults";

    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

mkbootimg = python_binary_host {
    name = "mkbootimg";
    defaults = ["mkbootimg_defaults"];
    srcs = [
        "mkbootimg.py"
    ];
};

unpack_bootimg = python_binary_host {
    name = "unpack_bootimg";
    defaults = ["mkbootimg_defaults"];
    srcs = [
        "unpack_bootimg.py"
    ];
};

in { inherit bootimg_headers libmkbootimg_abi_check libmkbootimg_abi_headers mkbootimg mkbootimg_defaults unpack_bootimg; }
