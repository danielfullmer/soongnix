{ cc_library, cc_test }:
let

libtimeinstate = cc_library {
    name = "libtimeinstate";
    srcs = ["cputimeinstate.cpp"];
    shared_libs = [
        "libbase"
        "libbpf"
        "libbpf_android"
        "liblog"
        "libnetdutils"
    ];
    header_libs = ["bpf_prog_headers"];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
    export_include_dirs = ["."];
};

libtimeinstate_test = cc_test {
    name = "libtimeinstate_test";
    srcs = ["testtimeinstate.cpp"];
    shared_libs = [
        "libbase"
        "libbpf"
        "libbpf_android"
        "libtimeinstate"
        "libnetdutils"
    ];
    header_libs = ["bpf_prog_headers"];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit libtimeinstate libtimeinstate_test; }
