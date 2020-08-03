{ cc_library_static }:
let

libLLVMOption = cc_library_static {
    name = "libLLVMOption";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMOption; }
