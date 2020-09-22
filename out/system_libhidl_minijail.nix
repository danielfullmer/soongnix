{ cc_library_shared }:
let

#  TODO(b/110363419): remove or make failures harder
#  Deprecated: most minijail users should either use libavservices_minijail
#  or reinstitute this (w/ fatal checks).
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
    visibility = [":__subpackages__"];
};

in { inherit libhwminijail; }
