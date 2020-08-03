{ cc_library_static }:
let

libLLVMAArch64AsmParser = cc_library_static {
    name = "libLLVMAArch64AsmParser";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAArch64AsmParser; }
