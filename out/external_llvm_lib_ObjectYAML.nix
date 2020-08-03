{ cc_library_static }:
let

libLLVMObjectYAML = cc_library_static {
    name = "libLLVMObjectYAML";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMObjectYAML; }
