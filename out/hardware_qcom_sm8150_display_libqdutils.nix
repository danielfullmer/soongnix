{ cc_library_shared }:
let

libqdutils = cc_library_shared {
    name = "libqdutils";
    vendor = true;
    defaults = [
        "display_defaults"
        "display_go_defaults"
    ];
    header_libs = [
        "libhardware_headers"
        "libutils_headers"
    ];
    shared_libs = [
        "libbinder"
        "libqservice"
    ];
    cflags = [
        "-DLOG_TAG=\"qdutils\""
        "-Wno-sign-conversion"
    ];
    srcs = [
        "qd_utils.cpp"
        "display_config.cpp"
    ];
};

in { inherit libqdutils; }
