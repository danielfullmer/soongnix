{ cc_library_static }:
let

libLLVMInstrumentation = cc_library_static {
    name = "libLLVMInstrumentation";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMInstrumentation; }
