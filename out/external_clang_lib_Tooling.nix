{ cc_library_static }:
let

libclangTooling = cc_library_static {
    name = "libclangTooling";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

subdirs = ["Core"];

in { inherit libclangTooling; }
