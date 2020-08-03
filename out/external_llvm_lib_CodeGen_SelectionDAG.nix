{ cc_library_static }:
let

libLLVMSelectionDAG = cc_library_static {
    name = "libLLVMSelectionDAG";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMSelectionDAG; }
