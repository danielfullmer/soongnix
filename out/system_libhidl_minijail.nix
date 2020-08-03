{ cc_library_shared }:
let

libhwminijail = cc_library_shared {
    name = "libhwminijail";
    defaults = ["hidl_defaults"];
    vendor = true;
    export_include_dirs = ["include"];

    srcs = ["HardwareMinijail.cpp"];

    shared_libs = [
        "libbase"
        "libminijail"
    ];
};

in { inherit libhwminijail; }
