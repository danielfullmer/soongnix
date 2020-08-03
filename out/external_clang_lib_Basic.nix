{ cc_library_static }:
let

libclangBasic = cc_library_static {
    name = "libclangBasic";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangBasic; }
