{ cc_library_static }:
let

libLLVMARMDisassembler = cc_library_static {
    name = "libLLVMARMDisassembler";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = ["ARMDisassembler.cpp"];
};

in { inherit libLLVMARMDisassembler; }
