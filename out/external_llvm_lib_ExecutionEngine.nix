{ cc_library_static }:
let

libLLVMExecutionEngine = cc_library_static {
    name = "libLLVMExecutionEngine";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

subdirs = ["*"];

in { inherit libLLVMExecutionEngine; }
