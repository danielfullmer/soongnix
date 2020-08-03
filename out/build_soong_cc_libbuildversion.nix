{ cc_library_static }:
let

libbuildversion = cc_library_static {
    name = "libbuildversion";
    host_supported = true;
    recovery_available = true;
    srcs = ["libbuildversion.cpp"];
    export_include_dirs = ["include"];
    cflags = ["-fvisibility=hidden"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

in { inherit libbuildversion; }
