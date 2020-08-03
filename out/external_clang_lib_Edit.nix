{ cc_library_static }:
let

libclangEdit = cc_library_static {
    name = "libclangEdit";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangEdit; }
