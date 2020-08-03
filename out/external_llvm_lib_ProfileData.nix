{ cc_library_static }:
let

libLLVMProfileData = cc_library_static {
    name = "libLLVMProfileData";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

subdirs = ["*"];

in { inherit libLLVMProfileData; }
