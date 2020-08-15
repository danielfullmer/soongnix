{ cc_library_static }:
let

libLLVMLinker = cc_library_static {
    name = "libLLVMLinker";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "IRMover.cpp"
        "LinkModules.cpp"
    ];
};

in { inherit libLLVMLinker; }
