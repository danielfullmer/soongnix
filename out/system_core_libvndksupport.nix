{ cc_library }:
let

subdirs = ["tests"];

libvndksupport = cc_library {
    name = "libvndksupport";
    srcs = ["linker.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    local_include_dirs = ["include/vndksupport"];
    export_include_dirs = ["include"];
    shared_libs = [
        "libdl_android"
        "liblog"
    ];
    version_script = "libvndksupport.map.txt";
    stubs = {
        symbol_file = "libvndksupport.map.txt";
        versions = ["29"];
    };
};

in { inherit libvndksupport; }
