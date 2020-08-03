{ cc_library_static }:
let

libLLVMMCDisassembler = cc_library_static {
    name = "libLLVMMCDisassembler";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMMCDisassembler; }
