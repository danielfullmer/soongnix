{ cc_binary, cc_library_shared }:
let

libtinycompress = cc_library_shared {
    name = "libtinycompress";
    vendor = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-macro-redefined"
        "-Wno-unused-function"
    ];
    export_include_dirs = ["include"];
    srcs = [
        "compress.c"
        "utils.c"
    ];
    shared_libs = [
        "libcutils"
        "libutils"
    ];
    header_libs = [
        "device_kernel_headers"
    ];
};

cplay = cc_binary {
    name = "cplay";
    vendor = true;

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-macro-redefined"
    ];
    local_include_dirs = ["include"];
    srcs = ["cplay.c"];
    shared_libs = [
        "libcutils"
        "libutils"
        "libtinycompress"
    ];
};

in { inherit cplay libtinycompress; }
