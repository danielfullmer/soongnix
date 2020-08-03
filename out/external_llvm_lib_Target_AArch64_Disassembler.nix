{ cc_library_static }:
let

libLLVMAArch64Disassembler = cc_library_static {
    name = "libLLVMAArch64Disassembler";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAArch64Disassembler; }
