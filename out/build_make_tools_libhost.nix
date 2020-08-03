{ cc_library_host_static }:
let

libhost = cc_library_host_static {

    srcs = ["CopyFile.c"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    name = "libhost";
    target = {
        windows = {
            cflags = ["-Wno-unused-parameter"];
            enabled = true;
        };
    };
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    stl = "none";

};

in { inherit libhost; }
