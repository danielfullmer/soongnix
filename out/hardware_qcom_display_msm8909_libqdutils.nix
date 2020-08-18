{ cc_library_shared }:
let

libqdutils = cc_library_shared {
    name = "libqdutils";
    vendor = true;
    defaults = ["display_defaults"];
    header_libs = [
        "libhardware_headers"
        "libutils_headers"
    ];
    shared_libs = [
        "libbinder"
        "libqservice"
    ];
    cflags = [
        "-DDEBUG_CALC_FPS"
        "-DLOG_TAG=\"qdutils\""
        "-Wno-sign-conversion"
    ];
    srcs = [
        "qd_utils.cpp"
        "display_config.cpp"
        "profiler.cpp"
    ];
};

libqdMetaData = cc_library_shared {
    name = "libqdMetaData";
    vendor = true;
    defaults = ["display_defaults"];
    cflags = [
        "-Wno-sign-conversion"
        "-DLOG_TAG=\"qdmetadata\""
    ];
    srcs = [
        "qdMetaData.cpp"
        "qd_utils.cpp"
    ];
};

#  Remove after WFD moves to use libqdMetaData directly
"libqdMetaData.system" = cc_library_shared {
    name = "libqdMetaData.system";
    defaults = ["display_defaults"];
    cflags = [
        "-Wno-sign-conversion"
        "-DLOG_TAG=\"qdmetadata\""
    ];
    srcs = [
        "qdMetaData.cpp"
        "qd_utils.cpp"
    ];
};

in { inherit "libqdMetaData.system" libqdMetaData libqdutils; }
