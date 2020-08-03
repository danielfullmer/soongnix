{ cc_library_static }:
let

libclangSema = cc_library_static {
    name = "libclangSema";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangSema; }
