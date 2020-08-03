{ cc_library_static }:
let

libclangAnalysis = cc_library_static {
    name = "libclangAnalysis";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangAnalysis; }
