{ cc_library_static }:
let

libLLVMMipsDisassembler = cc_library_static {
    name = "libLLVMMipsDisassembler";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = ["MipsDisassembler.cpp"];
};

in { inherit libLLVMMipsDisassembler; }
