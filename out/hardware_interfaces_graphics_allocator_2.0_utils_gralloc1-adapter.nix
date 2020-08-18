{ cc_library_static }:
let

libgralloc1-adapter = cc_library_static {
    name = "libgralloc1-adapter";
    defaults = ["hidl_defaults"];
    vendor = true;
    srcs = [
        "gralloc1-adapter.cpp"
        "Gralloc1On0Adapter.cpp"
    ];
    include_dirs = ["system/core/libsync/include"];
    export_include_dirs = ["."];
    whole_static_libs = ["libgrallocusage"];
    shared_libs = [
        "libhardware"
        "liblog"
    ];
};

in { inherit libgralloc1-adapter; }
