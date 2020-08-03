{ cc_library_static }:
let

libLLVMDebugInfoCodeView = cc_library_static {
    name = "libLLVMDebugInfoCodeView";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMDebugInfoCodeView; }
