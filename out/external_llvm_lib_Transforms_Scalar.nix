{ cc_library_static }:
let

libLLVMScalarOpts = cc_library_static {
    name = "libLLVMScalarOpts";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMScalarOpts; }
