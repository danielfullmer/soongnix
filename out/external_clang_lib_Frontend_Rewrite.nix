{ cc_library_static }:
let

libclangRewriteFrontend = cc_library_static {
    name = "libclangRewriteFrontend";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangRewriteFrontend; }
