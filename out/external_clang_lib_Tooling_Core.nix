{ cc_library_static }:
let

libclangToolingCore = cc_library_static {
    name = "libclangToolingCore";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangToolingCore; }
