{ cc_library_static }:
let

libclangFrontend = cc_library_static {
    name = "libclangFrontend";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

subdirs = ["Rewrite"];

in { inherit libclangFrontend; }
