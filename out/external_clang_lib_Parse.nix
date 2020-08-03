{ cc_library_static }:
let

libclangParse = cc_library_static {
    name = "libclangParse";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangParse; }
