{ cc_library_static }:
let

libLLVMipo = cc_library_static {
    name = "libLLVMipo";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMipo; }
