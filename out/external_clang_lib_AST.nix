{ cc_library_static }:
let

libclangAST = cc_library_static {
    name = "libclangAST";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangAST; }
