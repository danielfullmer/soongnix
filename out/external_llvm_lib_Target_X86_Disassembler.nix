{ cc_library_static }:
let

libLLVMX86Disassembler = cc_library_static {
    name = "libLLVMX86Disassembler";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMX86Disassembler; }
