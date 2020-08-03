{ cc_library_static }:
let

libLLVMX86Desc = cc_library_static {
    name = "libLLVMX86Desc";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMX86Desc; }
