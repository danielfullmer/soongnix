{ cc_library_static }:
let

libLLVMCodeGen = cc_library_static {
    name = "libLLVMCodeGen";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

subdirs = ["*"];

in { inherit libLLVMCodeGen; }
