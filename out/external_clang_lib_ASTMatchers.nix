{ cc_library_static }:
let

libclangASTMatchers = cc_library_static {
    name = "libclangASTMatchers";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangASTMatchers; }
