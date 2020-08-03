{ cc_library_static }:
let

libclangLibclang = cc_library_static {
    name = "libclangLibclang";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangLibclang; }
