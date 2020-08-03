{ cc_library_static }:
let

libLLVMRuntimeDyld = cc_library_static {
    name = "libLLVMRuntimeDyld";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMRuntimeDyld; }
