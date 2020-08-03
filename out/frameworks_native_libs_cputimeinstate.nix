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
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

libtimeinstate_test = cc_test {
    name = "libtimeinstate_test";
    srcs = ["testtimeinstate.cpp"];
    shared_libs = [
        "libtimeinstate"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit libtimeinstate libtimeinstate_test; }
