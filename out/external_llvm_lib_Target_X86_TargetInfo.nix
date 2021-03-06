{ cc_library_static }:
let

libLLVMX86Info = cc_library_static {
    name = "libLLVMX86Info";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["X86TargetInfo.cpp"];
};

in { inherit libLLVMX86Info; }
