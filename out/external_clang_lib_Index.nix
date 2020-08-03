{ cc_library_static }:
let

libclangIndex = cc_library_static {
    name = "libclangIndex";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangIndex; }
