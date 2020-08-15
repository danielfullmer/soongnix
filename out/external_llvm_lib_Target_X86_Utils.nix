{ cc_library_static }:
let

libLLVMX86Utils = cc_library_static {
    name = "libLLVMX86Utils";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["X86ShuffleDecode.cpp"];
};

in { inherit libLLVMX86Utils; }
