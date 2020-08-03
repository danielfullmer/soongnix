{ cc_library_static }:
let

libclangRewrite = cc_library_static {
    name = "libclangRewrite";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangRewrite; }
