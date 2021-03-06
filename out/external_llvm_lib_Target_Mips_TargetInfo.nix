{ cc_library_static }:
let

libLLVMMipsInfo = cc_library_static {
    name = "libLLVMMipsInfo";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = ["MipsTargetInfo.cpp"];
};

in { inherit libLLVMMipsInfo; }
