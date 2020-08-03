{ cc_library_static }:
let

libclangCodeGen = cc_library_static {
    name = "libclangCodeGen";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangCodeGen; }
