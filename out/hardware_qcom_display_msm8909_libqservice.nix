{ cc_library_shared }:
let

libqservice = cc_library_shared {
    name = "libqservice";
    vendor = true;
    defaults = ["display_defaults"];
    shared_libs = ["libbinder"];
    cflags = [
        "-DLOG_TAG=\"qdqservice\""
        "-Wno-sign-conversion"
    ];
    srcs = [
        "QService.cpp"
        "IQService.cpp"
        "IQClient.cpp"
        "IQHDMIClient.cpp"
    ];
};

in { inherit libqservice; }
