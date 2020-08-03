{ cc_library_static }:
let

libclangLex = cc_library_static {
    name = "libclangLex";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangLex; }
