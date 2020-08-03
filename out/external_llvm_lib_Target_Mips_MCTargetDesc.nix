{ cc_library_static }:
let

libLLVMMipsDesc = cc_library_static {
    name = "libLLVMMipsDesc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMMipsDesc; }
