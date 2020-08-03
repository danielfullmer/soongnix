{ cc_library_static }:
let

libclangARCMigrate = cc_library_static {
    name = "libclangARCMigrate";
    defaults = ["clang-defaults"];
    srcs = ["*.cpp"];
};

in { inherit libclangARCMigrate; }
