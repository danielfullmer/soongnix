{ cc_library_static }:
let

libLLVMIRReader = cc_library_static {
    name = "libLLVMIRReader";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["IRReader.cpp"];
};

in { inherit libLLVMIRReader; }
