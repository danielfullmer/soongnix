{ cc_library_static }:
let

libclangDriver = cc_library_static {
    name = "libclangDriver";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangDriver; }
