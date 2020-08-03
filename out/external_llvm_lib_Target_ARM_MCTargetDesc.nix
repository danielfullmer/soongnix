{ cc_library_static }:
let

libLLVMARMDesc = cc_library_static {
    name = "libLLVMARMDesc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMARMDesc; }
