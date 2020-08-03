{ cc_library_static }:
let

libclangSerialization = cc_library_static {
    name = "libclangSerialization";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangSerialization; }
