{ cc_library_static }:
let

libclangFormat = cc_library_static {
    name = "libclangFormat";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangFormat; }
