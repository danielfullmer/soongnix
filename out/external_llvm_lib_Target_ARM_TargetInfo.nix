{ cc_library_static }:
let

libLLVMARMInfo = cc_library_static {
    name = "libLLVMARMInfo";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = ["ARMTargetInfo.cpp"];
};

in { inherit libLLVMARMInfo; }
