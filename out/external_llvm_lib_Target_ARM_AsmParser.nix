{ cc_library_static }:
let

libLLVMARMAsmParser = cc_library_static {
    name = "libLLVMARMAsmParser";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMARMAsmParser; }
